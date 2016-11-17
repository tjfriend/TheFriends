<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Notice</h2>
<div class="w3-row" style="margin-top: 50px; padding: 50px">
	<div class="table-responsive">
		<table class="table">
			<thead align="center">
				<tr>
					<td><label>#</label></td>
					<td><label>Title</label></td>
					<td><label>Writer</label></td>
					<td><label>Count</label></td>
					<td><label>Date</label></td>
				</tr>
			</thead>
			<tbody id="tbody" align="center">
				<c:forEach var="notice" items="${noticedata }">
					<tr>
						<td align="center">${notice.num }</td>
						<td>${notice.title }</td>
						<td>${notice.id }</td>
						<td>0</td>
						<td>${notice.time }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<label id="page">
				<c:forEach var="i" begin="1" end="${noticesize }">
					<c:choose>
						<c:when test="${current == i }">
							<b>${u }</b>
						</c:when>
						<c:otherwise>
							<a href="/notice/list?p=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</label>
			<input type="button" value="글작성" onclick="noticeWrite()"/>
		</div>
	</div>
</div>

<script>
	function noticeWrite(){
		location.href = "/notice/write";
	}
</script>