<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Shop</h2>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<div align="right">
		<input type="button" value="음악올리기" class="btn btn-default" id="musicUp"/>
	</div>

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
				<input type="button" value="구매" id="buy${shop.TITLE }" onclick="javascript:openbuy('${shop.TITLE }', ${shop.MONEY })" />
				<input type="button" value="선물" id="buy${shop.TITLE }" onclick="javascript:opengift('${shop.TITLE }', ${shop.MONEY })"/></td>
				
			
				
		</c:forEach>
		
	</table>

	<div id="audio"></div>

<script>
$("#musicUp").click(function(){
	window.open("/shop/write", "musicUp", "width=400px, height=500px");
})

function listen(title) {
	$("#audio").html("<audio controls='controls' autoplay='autoplay'><source src='/music/"+title+"'></audio>");
}

LeftPosition = (screen.width - 400) / 2;
TopPosition = (screen.height - 300) / 2;

function openbuy(title, money) {
	
	if(confirm(money+"잣으로 "+title+"를 구매하시겠습니까?") == true ){
		$.ajax({
			"method" : "get",
			"url" : "/shop/shopbuy?title="+title,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				alert("구매성공");
			} else {
				alert("구매실패");
			}
		});
	}else{
		return;
	}
}

LeftPosition = (screen.width - 400) / 2;
TopPosition = (screen.height - 300) / 2;

function opengift(title, money) {
	window.open("/shop/shopgift?title="+title+"&money="+money, "buy",
			"width=400, height=150,left=" + LeftPosition
					+ ",top=" + TopPosition);
}
</script>

	<form action="/shop/list" method="post">
		검색 : <input type="search" name="search" placeholder="검색 내용을 입력하세요."> 
			 <input type="submit" value="검색"  >

	</form>
</div>