<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>충전내역</h2>
<c:choose>
	<c:when test="${li!=null }">
		<c:forEach items="${li }" var="i">
		충전일 : ${i.CHARGEDATE } <br/>
		충전 포인트 : ${i.POINT }  point <br/>
		<hr/>
		</c:forEach>
	</c:when>
	<c:otherwise>
		충전 내역이 없습니다
	</c:otherwise>
</c:choose>