<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-row" style="margin-top: 50px">
	<h2>Search</h2>
	찾을 방법 <select id="find">
		<option value="id">아이디</option>
		<option value="name">이름</option>
		<option value="email">이메일</option>
		<option value="phone">휴대폰</option>
	</select> <input type="text" name="con" id="con"> <input type="button"
		value="검색하기" id="search" /> <br /> <span id="span"></span>
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