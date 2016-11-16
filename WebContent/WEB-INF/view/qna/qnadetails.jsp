<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>QnA 상세 보기</h1>

<table class="table">

	<c:forEach var="qdt" items="${qnadetailsdata }">
		<tr>
			<th align="center" width="10%">${qdt.NUM }</th>
			<th width="50%">${qdt.TITLE }</th>
			<th width="40%">${qdt.TIME }</th>
		</tr>
		<hr />
		<tr>
			<th>${qdt.ID }</th>
		</tr>
		<br/>
		<tr>
			<td>${qdt.CONTENT }</td>
			</tr>
	</c:forEach>
</table>


