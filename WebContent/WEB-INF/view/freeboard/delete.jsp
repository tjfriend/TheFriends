<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Talk & Talk</h1>
<form action="/board/delete" method="post">
<input type="hidden"  name="num" value="${list.get(0).NUM }"/>

	<h2>삭제하시겠습니까?</h2>
	<br /> 
	<input type="button" value="확인" onclick="location.href='/board/delete?num=${list.get(0).NUM}'"/>
	<input type="button" value="취소" onclick="location.href='/board/freeboarddetails?num=${list.get(0).NUM}'"/>
</form>
