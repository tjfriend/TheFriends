<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-row" style="margin-top: 50px">
	<h2>Charge</h2>

	→ 충전 금액
	<input type="text" id="point" name="point" />
	<select id="p">
		<option>직접입력</option>
		<option>100원</option>
		<option>1000원</option>
		<option>10000원</option>
		<option>100000원</option>
	</select>  
	<br />
	
	→ 받는사람
	<select id="take">
		<option>나에게</option>
		<c:forEach var="t" items="${list }">
			<option>${t.FRIEND }</option>
		</c:forEach>
	</select> 
	<br />
	 
	→ 결제수단  &nbsp;
	<label><input type="radio" name="card" value="card" id="card" /> 카드</label> 
	<label><input type="radio" name="card" value="cash" id="cash" /> 무통장 입금 </label> 
	<br />

	<div id="cardctg" style="display: none">
		카드선택
		<select>
			<option>선택해주세요</option> 
			<option>국민</option>
			<option>우리</option>
			<option>신한</option>
			<option>농협</option>
			<option>삼성</option>
		</select>
		<br />
		카드번호 <input type="text" name="card" size="4" maxlength="4" />
		- <input type="text" name="card" size="4" maxlength="4" /> - <input
			type="text" name="card" size="4" maxlength="4" /> - <input
			type="text" name="card" size="4" maxlength="4" /><br /> 유효기간 <input
			type="text" size="2" placeholder="년" maxlength="2" /> / <input
			type="text" size="2" placeholder="월" maxlength="2" /> <br /> 카드
		비밀번호 <input type="password" size="4" maxlength="4" /> <br /> cvc <input
			type="password" size="4" maxlength="3" /> <br />
	</div>

	<div id="cashctg" style="display: none">
		은행선택 
		<select>
			<option>선택해주세요</option>
			<option>국민</option>
			<option>우리</option>
			<option>신한</option>
			<option>농협</option>
		</select>
		<br />
		현금영수증 <label><input type="radio" name="receipt" id="receipt" />신청하기</label>
		<label><input type="radio" name="receipt" id="receipt2" />신청안함</label>
		 
		<br />
		<span id="span" style="display: none"> 
		<label><input type="radio" name="c" value="p" id="p2" /> 개인소득공제용</label>
		<label><input type="radio" name="c" value="c" id="c2" /> 사업자증빙용</label>
		</span>
	</div>

	<div id="s2" style="display: none">
		<select id="se">
			<option id="phone">휴대폰번호</option>
			<option id="rr">주민등록번호</option>
			<option id="cashre">현금영수증카드번호</option>
		</select>
	</div>

	<span id="s3" style="display: none"> <select>
			<option>010</option>
			<option>011</option>
			<option>016</option>
			<option>017</option>
			<option>019</option>
	</select> - <input type="text" size="4" /> - <input type="text" size="4" />
	</span>

	<div id="d1">
		<span id="s4" style="display: none"> <input type="text"
			size="6" /> - <input type="text" size="6" />
		</span> <span id="s5" style="display: none"> <input type="text"
			size="4" /> - <input type="text" size="4" /> - <input type="text"
			size="4" /> - <input type="text" size="6" />
		</span>
	</div>

	<span id="s6" style="display: none"> 사업자 등록번호 <input type="text"
		size="3" /> - <input type="text" size="2" /> - <input type="text"
		size="4" />
	</span>

	<br />
	 <input type="button" value="충전하기" id="cc" />
	<font id="rst"></font>


	<br/>
	<h3>내포인트 선물하기</h3>

		내 보유 포인트 <input type="text" name="mypoint" value="${point }" readonly="readonly"/> <br />
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
	$("#p").change(function() {
		var sel = $("#p").prop("value");
		var point = $("#point");
		if(sel=="직접입력"){
			point.val("");
			point.prop("readonly",null);
		}else {
			point.val(sel);
			point.prop("readonly", "readonly");
		}
	});
	
	// 결제수단 선택
	$("#card").click(function() {
		$("#cardctg").show();
		$("#cashctg").hide();
		$("#s6").hide();
	});
	
	$("#cash").click(function() {
		$("#cashctg").show();
		$("#cardctg").hide();
	});
	
	// 결제수단 선택
	$("#receipt").click(function() {
		$("#span").show();
		$("#s6").hide();
	});
	
	$("#receipt2").click(function() {
		$("#span").hide();
		$("#s6").hide();
	});
	
	$("#p2").click(function() {
		$("#s2").show();
	});
	
	$("#se").click(function() {
		if ($("#se").val() == "휴대폰번호") {
			$("#s3").show();
			$("#s4").hide();
			$("#s5").hide();
			$("#s6").hide();
		} else if ($("#se").val() == "주민등록번호") {
			$("#s4").show();
			$("#s3").hide();
			$("#s5").hide();
			$("#s6").hide();
		} else {
			$("#s5").show();
			$("#s3").hide();
			$("#s4").hide();
			$("#s6").hide();
		}
	});
	
	$("#c2").click(function() {
		$("#s6").show();
		$("#s2").hide();
		$("#d1").hide();
	});
	
	// 충전하기 결과
	$("#cc").click(function(){
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
