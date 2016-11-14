<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h2>Search</h2>

	<table class="table">
		<tr>
			<th align="center">#</th>
			<th width="50%">제목</th>
			<th width="100">ID</th>
			<th>day</th>
		</tr>
		<c:forEach var="qna" items="${qnadata }">
			<tr>
				<td align="center">${qna.num }</td>
				<th>${qna.title }</th>
				<th>${qna.id }</th>
				<th>${qna.time }</th>
		</c:forEach>
	</table>
	
	<form action="question">
		<div align="right">
		<input type="submit" value="질문하기"  />
		</div>
	</form>
	<c:forEach var="i" begin="1" end="${qnasize }">
		<c:choose>
			<c:when test="${current == i }">
				<b>${u }</b>
			</c:when>
			<c:otherwise>
				<a href="/qna?p=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</div>