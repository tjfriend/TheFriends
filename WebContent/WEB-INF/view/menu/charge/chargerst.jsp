<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 <c:choose>
	<c:when test="${y == 'charge'}">
		��������
	</c:when>
	<c:when test="${y == 'use' }">
		���� ����
	</c:when>
	<c:when test="${y == 'fail' }">
		���� ����
	</c:when>
	<c:otherwise>
		��������
	</c:otherwise>
</c:choose>