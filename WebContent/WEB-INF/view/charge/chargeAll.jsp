<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>충전내역</h2>
<c:choose>
	<table class="table">
	<tr>
		<td>충전일</td>
		<td>충전 포인트</td>
	</tr>
	<c:when test="${li!=null }">
		<c:forEach items="${li }" var="i">
		<tr>
			<td>${i.CHARGDATE }</td>
			<td>${i.POINT } point </td>
		</tr>
		<hr/>
		</c:forEach>
	</c:when>
	<c:otherwise>
		충전 내역이 없습니다
	</c:otherwise>
	</table>
</c:choose>