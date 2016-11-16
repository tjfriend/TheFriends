<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>자유게시판 상세 보기</h1>

<table class="table">

	<c:forEach var="fbd" items="${freeboarddetailsdata }">
		<tr>
			<th align="center" width="10%">${freeboard.NUM }</th>
			<th width="50%">${freeboard.TITLE }</th>
			<th width="40%">${freeboard.TIME }</th>
		</tr>
		<hr />
		<tr>
			<th>${freeboard.ID }</th>
		</tr>
		<br/>
		<tr>
			<td>${freeboard.CONTENT }</td>
			</tr>
	</c:forEach>
</table>


