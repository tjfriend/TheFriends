<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>공지사항</h1>


<form action="/notice/make" method="post">
	제목 :&nbsp; <input type="text" name="title"> <br /> 내용 :&nbsp;
	<textarea rows="5" cols="5" name="content"></textarea>
	<br /> 

	<input
		type="submit" value="작성하기" /><br />
</form>
