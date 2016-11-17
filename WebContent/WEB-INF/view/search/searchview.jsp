<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

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
				<td>친구추가</td>
			</tr>
			<c:forEach items="${map }" var="i">
				<tr>
					<td id="friendId">${i.ID }</td>
					<td>${i.NAME }</td>
					<td>${i.PHONE }</td>
					<td>${i.EMAIL }</td>
					<td>${i.ADDRESS }</td>
					<td><input class="fi" type="button" value="친구추가" id="${i.ID }" onclick="addFriend(this)"/></td>
			</c:forEach>
			<tr>
		</table>
	</c:when>
	<c:otherwise>
		<h2>검색 내용이 없습니다</h2>
	</c:otherwise>
</c:choose>
