<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://masonry.desandro.com/masonry.pkgd.js"></script>
<script src="/js/jquery.lazyload.js"></script>

<div class="w3-row" style="margin-top: 50px">
	<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
			align="center">Charge</h2>
	<div id="btnDib" align="center">
		<input type="button" class="btn btn-default" id="viewCharge" value="충전하기" style="height: 33px" onclick="which(this)"/>
		<input type="button" class="btn btn-default" id="viewGift" value="선물하기" style="height: 33px" onclick="which(this)"/>
		<input type="button" class="btn btn-default" id="chargeList" value="충전내역" style="height: 33px" onclick="which(this)"/>
		<input type="button" class="btn btn-default" id="useList" value="사용내역" style="height: 33px" onclick="which(this)"/>
	</div><br>
	<div id="chargeDiv" hidden="hidden">
		<h3 class="w3-text-grey" align="center">Charge</h3><br/>
		<div align="center" class="form-group">
			<label for="point" style="width: 20%" class="w3-text-grey"><font size="4">충전금액</font></label><br/>
			<input type="text" id="point" name="point" placeholder="Points"
						style="width: 10%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
			<select id="spoint" style="width: 9%; height: 33px; border: 1px solid #ccc; border-radius: 5px">
				<option>직접입력</option>
				<option>100원</option>
				<option>1000원</option>
				<option>10000원</option>
				<option>100000원</option>
			</select>  
		</div>
		<div align="center" class="form-group">
			<label for="point" style="width: 20%" class="w3-text-grey"><font size="4">받는사람</font></label><br/>
			<select id="take" style="width: 9%; height: 33px; border: 1px solid #ccc; border-radius: 5px">
				<option>나에게</option>
				<c:forEach var="t" items="${list }">
					<option>${t.FRIEND }</option>
				</c:forEach>
			</select> 
		</div>
		<div align="center" class="form-group">	 
			<label for="point" style="width: 20%" class="w3-text-grey"><font size="4">결제방법</font></label><br/>
			<label class="w3-text-grey"><input type="radio" name="pay" value="card" id="card"  /> 카드</label> &nbsp;&nbsp;
			<label class="w3-text-grey"><input type="radio" name="pay" value="cash" id="cash" /> 무통장 입금 </label> 
		</div>
		<div align="center" class="form-group">
			<!-- 카드 목록 -->
			<div id="cardctg" style="display: none">
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">카드선택</font></label>&nbsp;
				<select id="scard" style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
					<option>선택</option> 
					<option>국민</option>
					<option>우리</option>
					<option>신한</option>
					<option>농협</option>
					<option>삼성</option>
				</select>
				<br />
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">카드번호</font></label><br/>
				<input type="text" name="card" size="4" maxlength="4" id="c1"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				- <input type="text" name="card" size="4" maxlength="4" id="c2"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				- <input type="text" name="card" size="4" maxlength="4" id="c3"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				- <input type="text" name="card" size="4" maxlength="4" id="c4"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/><br />
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">유효기간</font></label><br/>
				<input type="text" size="2" placeholder="년" maxlength="2" id="c5"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				/ <input type="text" size="2" placeholder="월" maxlength="2" id="c6"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/><br />
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">비밀번호</font></label><br/>
				<input type="password" size="4" maxlength="4" id="c7"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/><br /> 
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">CVC</font></label><br/>
				<input type="password" size="4" maxlength="3" id="c8"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/><br />
			</div>
		</div>
		<div align="center" class="form-group">
			<!-- 무통장 목록 -->
			<div id="cashctg" style="display: none">
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">계좌번호</font></label><br/>
				<table class="table" style="width:20%">
					<tr align="center">
						<td>국민은행</td>
						<td>123-123456-123</td>
					</tr>
					<tr align="center">
						<td>우리은행</td>
						<td>1234-12-123456</td>
					</tr>
					<tr align="center">
						<td>신한은행</td>
						<td>123-123-123456</td>
					</tr>
					<tr align="center">
						<td>농협</td>
						<td>123-12-123-123</td>
					</tr>
				</table>
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">입금자명</font></label>
				<input type="text" id="name" size="7" maxlength="8"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				<br />
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="2">연락처</font></label>
				<select style="width: 4%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select> 
				- <input type="text" size="4" id="ph1" maxlength="4"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				- <input type="text" size="4" id="ph2" maxlength="4"
							style="width: 5%; height: 25px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
			</div>
		</div>
		<div align="center" class="form-group">
			<input type="button" class="btn btn-default" id="cc" value="충전하기" style="height: 33px" />
			<font id="rst" size="2"></font>
		
			<br/>
		</div>
	</div>
	
	<div id="giftDiv" hidden="hidden">
		<div align="center">
			<h3 class="w3-text-grey" align="center">Gift</h3><br/>
			<div align="center" class="form-group">
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="4">내 포인트</font></label><br/>
				<input type="text" name="mypoint" value="${point }" readonly="readonly"
							style="width: 10%; height: 25px; border: 1px solid #ccc; border-radius: 5px; text-align: center"/>
				<label class="w3-text-grey">Points</label>
			</div>
			<div align="center" class="form-group">
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="4">선물 받을 친구</font></label><br/>
				<select id="gtake" style="width: 8%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
					<c:forEach var="t" items="${list }">
						<option>${t.FRIEND }</option>
					</c:forEach>	
				</select>
			</div>
			<div align="center" class="form-group">
				<label for="point" style="width: 20%" class="w3-text-grey"><font size="4">선물할 포인트</font></label><br>
				<input type="text" id="gpoint"
							style="width: 10%; height: 25px; border: 1px solid #ccc; border-radius: 5px; text-align: center"/><br />
			</div>
			<div align="center" class="form-group">
				<input type="button" value="선물하기"  id="gb" class="btn btn-default" style="height: 33px"/><br/>
				<font id="gt"></font>
			</div>
		</div>
	</div>
</div>

<div class="w3-modal" style="display: none" id="finishDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="finish">
		<input type="button" class="btn btn-success" value="충전되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="failDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="fail">
		<input type="button" class="btn btn-danger" value="충전에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="giftDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="gift">
		<input type="button" class="btn btn-success" value="충전되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="giftFailDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="giftFail">
		<input type="button" class="btn btn-danger" value="충전에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="giftPoDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="giftPo">
		<input type="button" class="btn btn-danger" value="선물포인트가 현재포인트보다 많습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	function endDiv(txt){
		$("#"+txt+"Div").fadeIn(300).delay(1000).fadeOut(300);
	}

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
			if($("#point").val() == "" || $("#scard").prop("value") == "선택" || $("#c1").val() == "" || $("#c2").val() == "" || $("#c3").val() == "" || $("#c4").val() == "" ||
					$("#c5").val() == "" || $("#c6").val() == "" || $("#c7").val() == "" || $("#c8").val() == ""){
				$("#cc").disabled();				
			}
		}else if($("#cash").prop("checked")){
			if($("#point").val() == "" || $("#name").val() == "" || $("#scash").prop("value") == "선택"
					|| $("#ph1").val() == "" || $("#ph2").val() == ""){
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
				endDiv("finish");
// 				$("#rst").prop("color", "green");
// 				$("#rst").text("충전 성공");
				$("#point").val("");
				$("#name").val("");
				$("#ph1").val("");
				$("#ph2").val("");
				$("#c1").val("");
				$("#c2").val("");
				$("#c3").val("");
				$("#c4").val("");
				$("#c5").val("");
				$("#c6").val("");
				$("#c7").val("");
				$("#c8").val("");
			}else{
				endDiv("fail");
// 				$("#rst").prop("color", "red");
// 				$("#rst").text("충전 실패");
				$("#point").val("");
				$("#name").val("");
				$("#ph1").val("");
				$("#ph2").val("");
				$("#c1").val("");
				$("#c2").val("");
				$("#c3").val("");
				$("#c4").val("");
				$("#c5").val("");
				$("#c6").val("");
				$("#c7").val("");
				$("#c8").val("");
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
		if(point<=${point}){
			$.ajax({
				"method" : "get",
				"url" : "/charge/gift?take="+take+"&point="+point
			}).done(function(txt){
				if(txt == "true"){
					endDiv("gift");
// 					$("#gt").prop("color", "green");
// 					$("#gt").text("선물 성공");
					$("#gpoint").val("");
				}else{
					endDiv("giftFail");
// 					$("#gt").prop("color", "red");
// 					$("#gt").text("선물 실패");
					$("#gpoint").val("");
				}
			});
		} else {
			endDiv("giftPo");
// 			$("#gt").prop("color", "red");
// 			$("#gt").text("선물포인트는 현재포인트보다 작거나 같아야 합니다.");
		}
	});
	
	function which(element){
		var val = element.value;
		if(val=="충전하기"){
			$("#chargeDiv").prop("hidden", null);
			$("#giftDiv").prop("hidden", "hidden");
		} else if(val=="선물하기"){
			$("#giftDiv").prop("hidden", null);
			$("#chargeDiv").prop("hidden", "hidden");
		} else if(val=="충전내역"){
			location.href = "/charge/chargeAll";
		} else if(val=="사용내역"){
			location.href = "/charge/use";
		}
	}
</script>
