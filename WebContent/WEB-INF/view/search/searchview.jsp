<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${map != null }">
		<c:forEach items="${map }" var="i">
			아이디 : ${i.ID } <br />
			이름 : ${i.NAME } <br />
			휴대폰 : ${i.PHONE } <br />
			이메일 : ${i.EMAIL } <br />
			주소 : ${i.ADDRESS } <br />
			<hr />
		</c:forEach>
	</c:when>
	<c:otherwise>
		<h2>검색 내용이 없습니다</h2>
	</c:otherwise>
</c:choose>