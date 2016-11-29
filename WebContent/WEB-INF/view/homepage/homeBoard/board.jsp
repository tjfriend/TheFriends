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

<div class="w3-container" style="max-height: 700px" align="center">
	<h3 class="w3-padding-32 w3-text-grey" align="center">Board</h3>
	<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
		<div class="table-responsive">
			<table class="table">
				<thead align="center">
					<tr>
						<td><label>#</label></td>
						<td><label>Title</label></td>
						<td><label>Writer</label></td>
						<td><label>Date</label></td>
						<td><label>Count</label></td>
					</tr>
				</thead>
				<tbody id="tbody" align="center">
					<tr>
						<td><label>1</label></td>
						<td><label>제목</label></td>
						<td><label>글쓴이</label></td>
						<td><label>날짜</label></td>
						<td><label>조회수</label></td>
					</tr>
				</tbody>
			</table>
			<div align="center">
				<label id="page">
				<!-- 페이징 처리 -->
					<%-- <c:forEach var="i" begin="1" end="${noticesize }">
						<c:choose>
							<c:when test="${current == i }">
								<b>${u }</b>
							</c:when>
							<c:otherwise>
								<a href="/notice/list?p=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> --%>
				</label>
				<div align="right">
					<input type="button" value="글작성" class="btn btn-default" onclick="noticeWrite()"/>
				</div>
			</div>
		</div>
	</div>
</div>