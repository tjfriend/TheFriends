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
	align="center">Question</h2>
<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px" align="center">
	<label>분류 </label>&nbsp;&nbsp;
	<select name="category" style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
		<option value="개인정보">개인정보</option>
		<option value="이벤트">이벤트</option>
		<option value="홈페이지">홈페이지</option>
		<option value="유료">유료</option>
		<option value="기타">기타</option>	
	</select><br/><br/>
	<div class="table-responsive" align="center">
		<form action="/qna/make" method="post">
			<label for="title" style="width: 15%"><font size="4">TITLE</font></label>
			<input type="text" id="title" name="title"
					class="form-control" style="width: 25%" placeholder="Title" required="required"/><br/>
			<label for="content" style="width: 15%"><font size="4">CONTENT</font></label><br/>
			<textarea rows="10" cols="100" style="width: 50%" placeholder="CONTENT" name="content" required="required"></textarea><br/><br/>
			<input type="submit" class="btn btn-default" value="작성하기" />&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="취소" onclick="javascript:location.href='/qna/list'"/>
		</form>
	</div>
</div>