<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Talk & Talk</h1>

<form action="/board/make" method="post">

	분류 :&nbsp; <select name="category" style="width: 150px">
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
			</select>
			<br /> <br /> 

	제목 :&nbsp; <input type="text" name="title"> <br /><br/>
	내용 :&nbsp; <textarea rows="15" cols="60" name="content"></textarea>
	<br /> 

	<input
		type="submit" value="작성하기" /><br />
</form>
