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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
	body, h1, h2, h3, h4, h5 {
		font-family: "Raleway", sans-serif
	}
</style>

<h3 class="w3-text-grey" style="margin-top: 50px"
	align="center">Profile</h3>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 20px" align="center">
	<form action="/picture/upload/${id }" method="post" enctype="multipart/form-data">
		<label style="width: 30%"><font size="3">공개설정 :</font></label><br/>
		<input type="radio" name="open" value="all">&nbsp;<label>전체공개</label>&nbsp;
		<input type="radio" name="open" value="friend">&nbsp;<label>친구공개</label>&nbsp;
		<input type="radio" name="open" value="none">&nbsp;<label>비공개</label><br/>
		<label for="title" style="width: 30%"><font size="3">TITLE</font></label>
		<input type="text" id="title" name="title"
				class="form-control" style="width: 25%" placeholder="Title" required="required"/><br/>
		<label for="content" style="width: 30%"><font size="3">CONTENT</font></label><br/>
		<textarea rows="3" cols="10" style="width: 50%; resize: none;" placeholder="CONTENT"  required="required" name="content"></textarea><br/><br/>
		<label style="width: 30%"><font size="3">사진등록 :</font></label><br/>
		<input type="file" name="picture"/><br/>
		<input type="submit" class="btn btn-default" value="올리기" />
		<input type="button" class="btn btn-default" value="취소" onclick="javascript:window.close()"/>
	</form>
</div>