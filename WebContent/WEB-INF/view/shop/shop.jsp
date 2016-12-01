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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://masonry.desandro.com/masonry.pkgd.js"></script>
<script src="/js/jquery.lazyload.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Shop</h2>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<div class="w3-row">
		<div align="left" class="w3-half">
			　
			<div id="audio"></div>
		</div>
		<c:if test="${nick.get(0).NICKNAME eq '관리자' }">
		<div align="right" class="w3-half">
			<input type="button" value="음악올리기" class="btn btn-default" id="musicUp"/>
		</div>
		</c:if>
	</div>
	<div class="table-responsive">
		<table class="table">
			<tr align="center">
				<td width="5%"><label>순위</label></td>
				<td width="60%"><label>곡정보</label></td>
				<td width="15%"><label>금액</label></td>
				<td width="20%"><label>듣기/구매/선물</label></td>
			</tr>
			<c:forEach var="shop" items="${shopdata }">
				<tr align="center">
					<td align="center"><label>${shop.NUM }</label></td>
					<td><label>${fn:split(shop.TITLE,'.')[0] }</label></td>
					<td><label>${shop.MONEY }잣</label></td>
					<td><input type="button" value="듣기" onclick="listen('${shop.TITLE}')"/>
					<input type="button" value="구매" id="buy${shop.TITLE }" onclick="javascript:openbuy('${shop.TITLE }', ${shop.MONEY })" />
					<input type="button" value="선물" id="buy${shop.TITLE }" onclick="javascript:opengift('${shop.TITLE }', ${shop.MONEY })"/></td>
			</c:forEach>
		</table>
	</div>
		<div align="center">
			<label id="page"> <!-- 페이징 처리 --> <c:choose>
					<c:when test="${shopbestsize >= 5 }">
						<c:forEach var="i" begin="${shopsize-2}" end="${shopsize+2 }">
							<c:choose>
								<c:when test="${param.p == i }">
									<a style="color: red;" href="/shop/list?p=${i }&search=${shopsearch }">${i }</a>
								</c:when>
								<c:otherwise>
								<a href="/shop/list?p=${i }&search=${shopsearch }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="1" end="${shopsize }">
							<c:choose>
								<c:when test="${param.p == i }">
									<a style="color: red;" href="/shop/list?p=${i }&search=${shopsearch }">${i }</a>
								</c:when>
								<c:otherwise>
									<a href="/shop/list?p=${i }&search=${shopsearch }">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</label>
	<div align="center">
		<form action="/shop/list" method="post">
			<label>검색&nbsp;</label>
			<input type="search" name="search" placeholder="검색 내용을 입력하세요."
						style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"> 
			 <input type="submit" value="검색" class="btn btn-default" />
		</form>
	</div>
</div>

<div class="w3-modal" style="display: none" id="buyDiv">
	<div class="w3-modal-content" style="width: 15%; height: 13%; border-radius: 10px; margin-top: 100px" align="center" id="buy">
	</div>
</div>

<div class="w3-modal" style="display: none" id="buyEndDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="buyEnd">
		<label></label>
		<input type="button" class="btn btn-success" value="구매하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="buyFailDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="buyFail">
		<label></label>
		<input type="button" class="btn btn-danger" value="구매에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	function buyDiv(title, money){
		$("#buyDiv").fadeIn(300);
		var html = "<label><font color='blue'>"+money+"</font>잣으로 <font color='red'>"+title+"</font>를(을)<br/>구매하시겠습니까?</label><br/><br/>";
		html += "<input type='button' class='btn btn-default' value='구입' style='width: 20%; height: 30%; border-radius: 10px' onclick='buy("+title+")'/>&nbsp;&nbsp;"
		html += "<input type='button' class='btn btn-default' value='취소' style='width: 20%; heigth: 30%; border-radius: 10px' onclick='fadeOutDiv()'/>";
		$("#buy").html(html);
	}
	function fadeOutDiv(){
		$("#buyDiv").fadeOut(300);
	}
	
	function endDiv(txt){
		$("#"+txt+"Div").fadeIn(300).delay(1000).fadeOut(300);
	}
	
	$("#musicUp").click(function(){
		window.open("/shop/write", "musicUp", "width=400px, height=500px");
	})
	
	function listen(title) {
		$("#audio").html("<audio controls='controls' autoplay='autoplay'><source src='/music/"+title+"'></audio>");
	}
	
	LeftPosition = (screen.width - 400) / 2;
	TopPosition = (screen.height - 300) / 2;
	
	function buy(title){
		$.ajax({
			"method" : "get",
			"url" : "/shop/shopbuy?title="+title,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				endDiv("buyEnd");
	// 			alert("구매성공");
			} else {
				endDiv("buyFail");
	// 			alert("구매실패");
			}
		});
	}
	
	function openbuy(title, money) {
		buyDiv(title, money);
	}
	
	LeftPosition = (screen.width - 400) / 2;
	TopPosition = (screen.height - 300) / 2;
	
	function opengift(title, money) {
		window.open("/shop/shopgift?title="+title+"&money="+money, "buy",
				"width=400, height=150,left=" + LeftPosition
						+ ",top=" + TopPosition);
	}
</script>