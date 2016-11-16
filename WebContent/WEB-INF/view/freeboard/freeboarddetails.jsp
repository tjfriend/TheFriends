<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Talk & Talk</h1> <br/> <br/> <br/>
<div style="margin: 0px;">
	<table class="table" style="margin: 0px;">
		<tr align="center">
			<th style="text-align: center;" width="5%">번호</th>
			<th style="text-align: center;" width="20%">카테고리</th>
			<th style="text-align: center;" width="35%">제목</th>
			<th style="text-align: center;" width="20%">아이디</th>
			<th style="text-align: center;" width="20%">작성일자</th>
		</tr>
		<c:forEach var="fbd" items="${freeboarddetailsdata }">
			<tr align="center">
				<td align="center" width="5%">${fbd.NUM }</td>
				<td width="20%">${fbd.CATEGORY }</td>
				<td width="35%">${fbd.TITLE }</td>
				<td width="20%">${fbd.ID }</td>
				<td width="20%">${fbd.TIME }</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div align="center">
	<table class="table">
		<c:forEach var="fbd" items="${freeboarddetailsdata }">
			<tr>
				<td>${fbd.CONTENT }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="수정" onclick="location.href='/board/freeboardupdate?num=${freeboarddetailsdata[0].NUM}'"/>
</div>



