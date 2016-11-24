<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-row" style="margin-top: 50px">
	<h1>Music Market</h1>
	<br /> <br /> <br /> <br /> <br />

	<form action="/shop/write" method="post">
		<div align="right">
			<input type="submit" value="음악올리기" />
		</div>
	</form>

	<table class="table">
		<tr align="center">
			<td width="5%">순위</td>
			<td width="60%">곡정보</td>
			<td width="15%">금액</td>
			<td width="20%">듣기/구매/선물</td>
		</tr>

		<c:forEach var="shop" items="${shopdata }">
			<tr align="center">
				<td align="center">${shop.NUM }</td>
				<td>${fn:split(shop.TITLE,'.')[0] }</td>
				<td>${shop.MONEY }잣</td>
				<td><input type="button" value="듣기" onclick="listen('${shop.TITLE}')"/>
				<input type="button" value="구매" onclick="javascript:openbuy()"/>
				<input type="button" value="선물" onclick="javascript:opengift()"/></td>
				
			
				
		</c:forEach>
		
	</table>

	<div id="audio"></div>

<script>
function listen(title) {
	$("#audio").html("<audio controls='controls' autoplay='autoplay'><source src='/music/"+title+"'></audio>");
}

LeftPosition = (screen.width - 400) / 2;
TopPosition = (screen.height - 300) / 2;

function openbuy() {
	window.open("/shop/shopbuy", "buy",
			"width=400, height=150,left=" + LeftPosition
					+ ",top=" + TopPosition);
}

LeftPosition = (screen.width - 400) / 2;
TopPosition = (screen.height - 300) / 2;

function opengift() {
	window.open("/shop/shopgift", "buy",
			"width=400, height=150,left=" + LeftPosition
					+ ",top=" + TopPosition);
}
</script>

	<form action="/shop/list" method="post">
		검색 : <input type="search" name="search" placeholder="검색 내용을 입력하세요."> 
			 <input type="submit" value="검색"  >

	</form>
</div>