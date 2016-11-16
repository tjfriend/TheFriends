<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:choose>
	<c:when test="${map != null }">
		<table class="table">
			<tr></tr>
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>휴대폰</td>
				<td>이메일</td>
				<td>주소</td>
			</tr>
		<c:forEach items="${map }" var="i">
		<tr>
			<td>${i.ID } </td> 
			<td>${i.NAME }</td>
			<td>${i.PHONE }</td>
			<td>${i.EMAIL }</td>
			<td>${i.ADDRESS }</td>
		<tr>
		</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<h2>검색 내용이 없습니다</h2>
	</c:otherwise>
</c:choose>