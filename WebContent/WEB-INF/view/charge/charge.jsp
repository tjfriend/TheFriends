<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-row" style="margin-top: 50px">
	<h2>Charge</h2>

	→ 충전 금액
	<input type="text" id="point" name="point" />
	<select id="spoint">
		<option>직접입력</option>
		<option>100원</option>
		<option>1000원</option>
		<option>10000원</option>
		<option>100000원</option>
	</select>  
	<br/>
	
	→ 받는사람
	<select id="take">
		<option>나에게</option>
		<c:forEach var="t" items="${list }">
			<option>${t.FRIEND }</option>
		</c:forEach>
	</select> 
	<br/>
	 
	→ 결제수단  &nbsp;
	<label><input type="radio" name="pay" value="card" id="card"  /> 카드</label> 
	<label><input type="radio" name="pay" value="cash" id="cash" /> 무통장 입금 </label> 
	<br />

	<!-- 카드 목록 -->
	<div id="cardctg" style="display: none">
		카드선택
		<select id="scard">
			<option>선택해주세요</option> 
			<option>국민</option>
			<option>우리</option>
			<option>신한</option>
			<option>농협</option>
			<option>삼성</option>
		</select>
		<br />
		카드번호 <input type="text" name="card" size="4" maxlength="4" id="c1" />
		- <input type="text" name="card" size="4" maxlength="4" id="c2"/> - <input
			type="text" name="card" size="4" maxlength="4" id="c3"/> - <input
			type="text" name="card" size="4" maxlength="4" id="c4"/><br />
		유효기간 <input	type="text" size="2" placeholder="년" maxlength="2" id="c5" /> / 
			<input type="text" size="2" placeholder="월" maxlength="2" id="c6"/> <br />
		카드비밀번호 <input type="password" size="4" maxlength="4" id="c7"/> <br /> 
		cvc <input type="password" size="4" maxlength="3" id="c8"/> <br />
	</div>

	<!-- 무통장 목록 -->
	<div id="cashctg" style="display: none">
		계좌번호 <br/>
		국민 1111-1111-1111-1111 <br/>
		우리 1111-1111-1111-1111 <br/>
		신한 1111-1111-1111-1111 <br/>
		농협 1111-1111-1111-1111 <br/>
		은행선택 
		<select id="scash">
			<option>선택해주세요</option>
			<option>국민</option>
			<option>우리</option>
			<option>신한</option>
			<option>농협</option>
		</select>
		<br/> 
		입금자명 <input type="text" id="name" size="7" maxlength="5"/>
		<br />
	</div>

 	<input type="button" value="충전하기" id="cc" />
	<font id="rst"></font>

	<br/>
	
	<h3>내포인트 선물하기</h3>

		내 보유 포인트 
		<input type="text" name="mypoint" value="${point }" readonly="readonly"/> <br />
		선물할 친구 
		<select id="gtake">
			<c:forEach var="t" items="${list }">
				<option>${t.FRIEND }</option>
			</c:forEach>	
		</select> <br />
		
		선물할 포인트 <input type="text" id="gpoint" /> <br />
		<input type="button" value="선물하기"  id="gb"/>
		<font id="gt"></font>
	<hr/>
	
	<input type="button" value="충전내역" onclick="javascript:location.href='/charge/chargeAll'" />
	<input type="button" value="사용내역" onclick="javascript:location.href='charge/use'" />
</div>

<script>
	// 금액 선택
	$("#spoint").change(function() {
			var sel = $("#spoint").prop("value");
			var point = $("#point");
			if(sel=="직접입력"){
				point.val("");
				point.prop("readonly",null);
			}else {
				point.val(sel);
				point.prop("readonly", "readonly");
			}
	});
	
	// 결제수단 선택 (카드 || 무통장)
	$("#card").click(function(){
		$("#cardctg").show();
		$("#cashctg").hide();
	});
		
	$("#cash").click(function(){
		$("#cashctg").show();
		$("#cardctg").hide();
	});
	
	// 충전버튼
	$("#cc").click(function(){
		if($("#card").prop("checked")) {
			if($("#point").val() == "" || $("#scard").prop("value") == "선택해주세요" || $("#c1").val() == "" || $("#c2").val() == "" || $("#c3").val() == "" || $("#c4").val() == "" ||
					$("#c5").val() == "" || $("#c6").val() == "" || $("#c7").val() == "" || $("#c8").val() == ""){
				$("#cc").disabled();				
			}
		}else if($("#cash").prop("checked")){
			if($("#point").val() == "" || $("#name").val() == "" || $("#scash").prop("value") == "선택해주세요"){
				$("#cc").disabled();
			}
		}else if(!$("#card").prop("checked") || !$("#cash").prop("checked")){
			$("#cc").disabled();
		}
		
		var take = $("#take").val();
		var point = $("#point").val();
		
		$.ajax({
			"method" : "get",
			"url" : "/charge/cash?take="+take+"&point="+point
		}).done(function(txt){
			if(txt == "true"){
				$("#rst").prop("color", "green");
				$("#rst").text("충전 성공");
				$("#point").val("");
			}else{
				$("#rst").prop("color", "red");
				$("#rst").text("충전 실패");
				$("#point").val("");
			}
		})
	});
	
	
	// 선물하기 결과
	$("#gb").click(function(){
		if($("#gpoint").val() == ""){
			$("#gb").disabled();
		}
		
		var take = $("#gtake").val();
		var point = $("#gpoint").val();
		$.ajax({
			"method" : "get",
			"url" : "/charge/gift?take="+take+"&point="+point
		}).done(function(txt){
			if(txt == "true"){
				$("#gt").prop("color", "green");
				$("#gt").text("선물 성공");
				$("#gpoint").val("");
			}else{
				$("#gt").prop("color", "red");
				$("#gt").text("선물 실패");
				$("#gpoint").val("");
			}
		})
	});

</script>
