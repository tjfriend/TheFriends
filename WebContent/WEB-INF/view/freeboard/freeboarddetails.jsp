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
	align="center">Free Board</h2>

<div align="center">
	<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px; width: 70%">
		<div align="right">
			<input type="button" value="목록보기" class="btn btn-default"
				onclick="self.location='/board/list';">
			<c:forEach var="fbd" items="${freeboarddetailsdata }">
				<c:choose>
					<c:when test="${freeboarddetailsdata2 == fbd.ID }">
						<input type="button" value="수정" class="btn btn-default"
									onclick="location.href='/board/freeboardupdate?num=${fbd.NUM}'" />
						<input type="button" value="삭제" class="btn btn-default"
							onclick="location.href='/board/freeboarddelete?num=${fbd.NUM}'" />
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
		<div class="table-responsive" align="center">
			<table class="table">
				<tr align="center">
					<td width="5%"><label>#</label></td>
					<td width="15%"><label>Category</label></td>
					<td width="50%"><label>Title</label></td>
					<td width="8%"><label>Writer</label></td>
					<td width="15%"><label>Day</label></td>
					<td width="7%"><label>Count</label></td>
				</tr>
				<c:forEach var="fbd" items="${freeboarddetailsdata }">
					<tr align="center">
						<td>${fbd.NUM }</td>
						<td>${fbd.CATEGORY }</td>
						<td>${fbd.TITLE }</td>
						<td>${fbd.ID }</td>
						<td>${fbd.TIME }</td>
						<td>${fbd.INQUIRY }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div align="center">
			<table class="table">
				<c:forEach var="fbd" items="${freeboarddetailsdata }">
					<tr>
						<td style="padding: 20px">${fbd.CONTENT }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>