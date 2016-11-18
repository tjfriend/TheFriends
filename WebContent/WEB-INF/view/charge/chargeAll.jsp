<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>충전내역</h2>
<c:forEach var="i" begin="1" end="${size }">
	<a href="/charge/chargeAll?p=${i }">${i }</a>
</c:forEach>

<c:choose>
	<c:when test="${li.size() != 0 }">
		<table class="table">
			<tr>
				<td align="center">충전일</td>
				<td align="center">충전 포인트</td>
			</tr>
			<c:forEach items="${li }" var="i">
				<tr>
					<td align="center">${i.CHARGEDATE }</td>
					<td align="center">${i.POINT }point</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<h2>충전 내역이 없습니다</h2>
	</c:otherwise>
</c:choose>