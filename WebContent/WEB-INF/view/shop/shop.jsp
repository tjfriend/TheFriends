<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h1>Music Market</h1>
	<br /> <br /> <br /> <br /> <br />

	<form action="write">
		<div align="right">
			<input type="submit" value="음악올리기" />
		</div>
	</form>

	<table class="table">
		<tr align="center">
			<td width="5%">순위</td>
			<td width="70%">곡정보</td>
			<td width="15%">금액</td>
			<td width="10%">듣기/구매/선물</td>
		</tr>

		<c:forEach var="freeboard" items="${freeboarddata }">
			<tr align="center">
				<td align="center">${shop.NUM }</td>
				<td>${shop.TITLE }</td>
				<td>${shop.MONEY }</td>
				<td><input type="button" value="듣기" />
				<input type="button" value="구매" />
				<input type="button" value="선물" onclick=""/></td>
				
		</c:forEach>
	</table>



</div>