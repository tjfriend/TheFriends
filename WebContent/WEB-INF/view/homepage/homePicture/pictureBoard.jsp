<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<h2>사진첩</h2>


<c:choose>
	<c:when test="${li != 'null' }">
		<c:forEach items="${li }" var="i">
				${i.ID } <br />
				${i.TITLE } <br />
				${i.CONTENT } <br />
			<img src="/files/${i.UUID }" />
			<br />
		</c:forEach>
	</c:when>
	<c:otherwise>
			사진이 없습니다
		</c:otherwise>
</c:choose>

<c:choose>
	<c:if test="${a.containsKey() == true }">
		<c:if test="${a==0 || a==1 }">
			<c:when test="${a == 1 }">
				<script>alert("업로드 성공");</script>
			</c:when>
			<c:otherwise>
				<script>alert("업로드 실패");</script>
			</c:otherwise>
		</c:if>
	</c:if>
</c:choose>