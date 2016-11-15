<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-row" style="margin-top: 50px">
	<h2>Charge</h2>
	
	<form action="/charge/cash" method="post">
	→ 충전 금액 
	<select id="p">
		<option>-------</option>
		<option id="self">직접입력</option>
		<option>100 원</option>
		<option>1,000 원</option>
		<option>10,000 원</option>
		<option>100,000 원</option>
	</select>
	<input type="text" id="point" style="display: none" placeholder="원"/> <br />
	<script>
		$("#p").click(function(){
			if($("#p").val() == "직접입력"){
				$("#point").show();
			}else{
				$("#point").hide();
			}
		});
	</script> 
	<br/>
	→ 결제수단 <br/>
	<input type="radio" name="card" value="card" id="card"/> 카드
	<input type="radio" name="cash" value="cash" id="cash"/> 무통장 입금
	<br/>	
	
	<div id="cardctg" style="display: none">
	카드선택 <select >
		<option>국민</option>
		<option>우리</option>
		<option>신한</option>
		<option>농협</option>
		<option>삼성</option>
	</select> <br /> 
	카드번호 <input type="text" name="card" size="4" /> - <input
		type="text" name="card" size="4" /> - <input type="text" name="card"
		size="4" /> - <input type="text" name="card" size="4" /><br />
		<input type="submit" value="충전하기">
	</form>
	</div>
	
	
	<script>
		$("#card").click(function(){
			$("#cardctg").show();
		});
	</script>	
	
	
	

	<form action="/charge/view" method="post">
		<input type="submit" name="charge" value="선물하기" />
	</form>

	<form action="/charge/chargeAll" method="post">
		<input type="submit" value="충전내역" />
	</form>

	<form action="/charge/use" method="post">
	<input type="submit" name="charge" value="사용내역" />
	</form>
</div>