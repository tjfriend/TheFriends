<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <c:choose>
	<c:when test="${y == 'charge'}">
		충전성공
	</c:when>
	<c:when test="${y == 'use' }">
		선물 성공
	</c:when>
	<c:when test="${y == 'fail' }">
		선물 실패
	</c:when>
	<c:otherwise>
		충전실패
	</c:otherwise>
</c:choose>