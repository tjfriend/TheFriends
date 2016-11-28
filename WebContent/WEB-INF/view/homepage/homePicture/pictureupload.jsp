<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-container">
	<h2>사진 올리기</h2>

	<form action="/picture/upload/${id }" method="post" enctype="multipart/form-data">
		공개 설정 : 
		<input type="radio" name="open" value="전체공개">전체공개
		<input type="radio" name="open" value="친구공개">친구공개
		<input type="radio" name="open" value="비공개">비공개	
		<br/>
		제목 : <input type="text" name="title"/> <br/>
		내용 : <textarea rows="10" cols="30" name="content"></textarea> <br/>
		사진등록 :  
		<input type="file" name="picture"/><br/>
		<input type="submit" value="파일업로드"/>
	</form>
</div>
