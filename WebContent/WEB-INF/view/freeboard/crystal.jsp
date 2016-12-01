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
	align="center">Free Board</h2>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px" align="center">
	<form action="/board/crystal" method="post">
		<input type="hidden"  name="num" value="${list.get(0).NUM }"/>
<%-- 		${list.get(0).CATEGORY } --%>
		<label>분류 </label>&nbsp;&nbsp;
		<select name="category" style="width: 12%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
			<option>10대 이야기</option>
			<option>20대 이야기</option>
			<option>30대 이야기</option>
			<option>40대 이야기</option>
			<option>50대 이야기</option>	
			<option>훈훈한 이야기</option>
			<option>세상에 이런일이</option>
			<option>나 억울해요</option>
			<option>이슈</option>
			<option>유머</option>	
			<option>사랑과이별</option>
			<option>남자들끼리만</option>
			<option>여자들끼리만</option>
		</select><br /><br /> 
		<input type="hidden" name="pn" value="${pn }">
		<label for="title" style="width: 15%"><font size="4">TITLE</font></label>
		<input type="text" id="title" name="title" value="${list.get(0).TITLE }"
				class="form-control" style="width: 25%" placeholder="Title" required="required"/><br/>
		<label for="content" style="width: 15%"><font size="4">CONTENT</font></label><br/>
		<textarea rows="10" cols="100" style="width: 50%; resize: none;" placeholder="CONTENT" name="content" required="required">${list.get(0).CONTENT }</textarea><br/><br/>
		<input type="submit" value="수정하기" class="btn btn-default"/>&nbsp;&nbsp;
		<input type="button" value="취소" class="btn btn-default" onclick="self.location='/board/freeboarddetails?num=${list.get(0).NUM}'">
	</form>
</div>