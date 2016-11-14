<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>질문하기</h1>

제목 : <input type="text" name="title">
<br/>
내용 : <textarea rows="3" cols="30" name="content" id="ta"></textarea>
	<br />
id :<input type = "text" name = "id">
	<form action="qna">
	<input type="submit" value="등록" />
	</form>
