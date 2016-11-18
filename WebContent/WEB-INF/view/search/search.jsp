<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Search</h2>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px" align="center">
	<div>
		<select id="find" style="width: 7%; height: 33px; border: 1px solid #ccc; border-radius: 5px">
			<option value="choose">선택</option>
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="email">이메일</option>
			<option value="phone">휴대폰</option>
		</select>&nbsp;
		<input type="text" name="con" id="con"
					style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px">&nbsp;
		<input type="button" value="검색하기" id="search" style="height: 33px" class="btn btn-default"/>
	</div><br/>
	<div>
		<span id="span"></span>
	</div>
</div>

<script>
	
	$("#search").click(function() {
		var find = $("#find").val();
		var con = $("#con").val();
		$.ajax({
			"url" : "/search/friend/" + find + "/" + con
		}).done(function(txt) {
			document.getElementById("span").innerHTML = txt;
		})
	});
	
	function addFriend(element){
		var friend = element.id;
		window.open("/search/addfriend?friend="+friend, "addfriend", "width=300, height=200, left=600, top=200, resizable=no");
	}
</script>