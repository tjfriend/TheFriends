<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>사용내역</h2>

<c:choose>
	<c:when test="${li != null }">
		<c:forEach items="${li }" var="i">
		${i.TAKEID } → ${i.POINT }  point <br/>
		${i.USEDATE }
		</c:forEach>
	</c:when>
	<c:otherwise>
		사용 내역이 없습니다
	</c:otherwise>
</c:choose>