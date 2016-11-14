<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>포인트 선물하기</h2>

<form action="/charge/gift">
선물할 친구
<!-- <select name="take"> -->
	
<!-- </select> -->
<input type="text" name="take"/>

<br/>

선물할 포인트
<input type="text" name="point"/>
<br/>
<input type="submit" value="선물하기"/>
</form>