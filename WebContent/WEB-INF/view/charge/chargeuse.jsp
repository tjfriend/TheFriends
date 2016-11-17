<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>사용내역</h2>
<c:forEach var="i" begin="1" end="${size }">
	<a href="/charge/use?p=${i }">${i }</a>
</c:forEach>

<c:choose>
	<c:when test="${li2 != null }">
	<table class="table">
		<tr>
			<td>충전일</td>
			<td>선물한 친구</td>
			<td>선물한 포인트</td>
		</tr>
		<c:forEach items="${li2 }" var="i">
		<tr>
			<td>${i.USEDATE }</td>
			<td>${i.TAKEID }</td>
			<td>${i.POINT }  point </td>
		</tr>
		</c:forEach>
	</table>
	</c:when>
	<c:otherwise>
		사용 내역이 없습니다
	</c:otherwise>
</c:choose>