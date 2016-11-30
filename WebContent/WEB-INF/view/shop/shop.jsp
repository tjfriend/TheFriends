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
		<div align="right" class="w3-half">
			<input type="button" value="음악올리기" class="btn btn-default" id="musicUp"/>
		</div>
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
					<td><input type="button" value="듣기" onclick="listen('${shop.TITLE}')" class="btn btn-default"/>
					<input type="button" value="구매" id="buy${shop.TITLE }" onclick="javascript:openbuy('${shop.TITLE }', ${shop.MONEY })" class="btn btn-default"/>
					<input type="button" value="선물" id="gift${shop.TITLE }" onclick="javascript:opengift('${shop.TITLE }', ${shop.MONEY })" class="btn btn-default"/></td>
			</c:forEach>
		</table>
	</div>
	
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
	<div class="w3-modal-content" style="width: 250px; height: 130px; border-radius: 10px; margin-top: 100px" align="center" id="buy">
		<label><font color='blue' id="money"></font>잣으로 <font color='red' id="title"></font>를(을)<br/>구매하시겠습니까?</label><br/><br/>
		<input type='button' class='btn btn-default' value='구매' style='width: 60px; height: 40px; border-radius: 10px' id="purchase"/>&nbsp;&nbsp;
		<input type='button' class='btn btn-default' value='취소' style='width: 60px; height: 40px; border-radius: 10px' onclick="fadeOutDiv('buy')"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="giftDiv">
	<div class="w3-modal-content" style="width: 250px; height: 170px; border-radius: 10px; margin-top: 100px" align="center" id="gift">
		<label><font color='blue' id="gmoney"></font>잣으로 <font color='red' id="gtitle"></font>를(을)<br/>선물하시겠습니까?</label><br/><br/>
		<div>
			<select id="friend" style="width: 25%; height: 25px; border: 1px solid #ccc; border-radius: 5px"></select>
		</div><br/>
		<input type='button' class='btn btn-default' value='선물' style='width: 60px; height: 40px; border-radius: 10px' id="present"/>&nbsp;&nbsp;
		<input type='button' class='btn btn-default' value='취소' style='width: 60px; height: 40px; border-radius: 10px' onclick="fadeOutDiv('gift')"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="buyEndDiv">
	<div class="w3-modal-content" style="width: 250px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="buyEnd">
		<input type="button" class="btn btn-success" value="구매하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="buyFailDiv">
	<div class="w3-modal-content" style="width: 250px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="buyFail">
		<input type="button" class="btn btn-danger" value="구매에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="giftEndDiv">
	<div class="w3-modal-content" style="width: 250px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="giftEnd">
		<input type="button" class="btn btn-success" value="선물하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="giftFailDiv">
	<div class="w3-modal-content" style="width: 250px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="giftFail">
		<input type="button" class="btn btn-danger" value="선물에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	$("#present").click(gift);
	$("#purchase").click(buy);
	function giftDiv(title, money){
		$.ajax({
			"method" : "get",
			"url" : "/shop/shopgift",
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<option>"+txt[i].FRIEND+"</option>";
			}
			$("#friend").html(html);
		});
		$("#giftDiv").fadeIn(300);
		$("#gmoney").html(money);
		$("#gtitle").html(title);
	}
	
	function buyDiv(title, money){
		$("#buyDiv").fadeIn(300);
		$("#money").html(money);
		$("#title").html(title);
	}
	
	function fadeOutDiv(div){
		$("#"+div+"Div").fadeOut(300);
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
	
	function buy(){
		var title = $("#title").html();
		$.ajax({
			"method" : "get",
			"url" : "/shop/shopbuy?title="+title,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				endDiv("buyEnd");
			} else {
				endDiv("buyFail");
			}
		});
	}

	function gift(){
		var title = $("#gtitle").html();
		var money = $("#gmoney").html();
		var gtake = $("#friend").val();
		console.log("gift!!" +$(this));
		$.ajax({
			"method" : "get",
			"url" : "/shop/shopgiftend?title="+title+"&money="+money+"&gtake="+gtake,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				endDiv("giftEnd");
			} else {
				endDiv("giftFail");
			}
		});
	}
	
	function openbuy(title, money) {
		buyDiv(title, money);
	}
	
	function opengift(title, money) {
		giftDiv(title, money);
	}
</script>