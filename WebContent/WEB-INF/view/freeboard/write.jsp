<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>글작성하기</h1>

<form action="/board/confirm">
제목 : <input type="text">
<br/>
내용 : <textarea rows="3" cols="30" name="content" id="ta"></textarea>
	<br />
	<input type="submit" value="완료" />
</form>