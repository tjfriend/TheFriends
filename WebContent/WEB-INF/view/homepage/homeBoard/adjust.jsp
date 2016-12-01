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

<h3 class="w3-text-grey" style="margin-top: 50px" align="center">Adjust</h3>

<div class="w3-row"
	style="padding-left: 30px; padding-right: 30px; padding-top: 20px"
	align="center">
	<form action="/homeBoard/homeBoardadjust" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="pn" value="${pn }">
		<input type="hidden"  name="num" value="${list.get(0).NUM }"/>
		<label for="title" style="width: 30%"><font size="3">TITLE</font></label>
		<input type="text" id="title" name="title" class="form-control" value="${list.get(0).TITLE }"
			style="width: 25%" placeholder="Title" required="required" /><br />
		<label for="content" style="width: 30%"><font size="3">CONTENT</font></label><br />
		<textarea rows="3" cols="10" style="width: 50%; resize: none;"
			placeholder="CONTENT" required="required" name="content">${list.get(0).CONTENT }</textarea>
		<br /> <br />  <input
			type="submit" class="btn btn-default" value="올리기" /> <input
			type="button" class="btn btn-default" value="취소"
			onclick="javascript:window.close()" />
	</form>
</div>