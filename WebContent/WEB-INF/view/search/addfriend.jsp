<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">

<style>
	body, h1, h2, h3, h4, h5 {
		font-family: "Raleway", sans-serif
	}
</style>

<div class="w3-light-grey w3-content w3-main" style="height: 95%">
	<h2 class="w3-text-grey" align="center">Add Friend</h2>
	<div align="center">
		<label for="point" style="width: 50%" class="w3-text-grey"><font size="3">내 아이디</font></label><br/>
		<input type="text" name="id" value="${id }" size="7" readonly="readonly"
					style="width: 50%; height: 25px; border: 1px solid #ccc; border-radius: 5px; text-align: center"/><br/>
		<label for="point" style="width: 50%" class="w3-text-grey"><font size="3">친구 아이디</font></label><br/>
		<input type="text" name="friend" value="${friend }" size="7" readonly="readonly"
					style="width: 50%; height: 25px; border: 1px solid #ccc; border-radius: 5px; text-align: center"/><br/>
	</div>
	<div align="center">
		<input type="submit" value="추가하기" class="btn btn-default"/>
		<input type="button" value="취소" id="cancel" class="btn btn-default"/>
	</div>
</div>

<script>
	$("#cancel").click(function(){
		close();
	});
</script>