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
	align="center">사용내역</h2>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<div class="table-responsive">
		<table class="table">
			<thead align="center">
				<tr align="center">
					<td><label>#</label></td>
					<td><label>선물한 친구</label></td>
					<td><label>선물한 포인트</label></td>
					<td><label>사용일</label></td>
				</tr>
			</thead>
			<c:if test="${list.size()!=0 }">
				<tbody>
					<c:forEach var="i" items="${li }">
						<tr align="center">
							<td>${i.NUM }</td>
							<td>${i.TAKEID }</td>
							<td>${i.POINT }</td>
							<td>${i.USEDATE }</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>
		<div align="right">
			<input type="button" value="목록으로" class="btn btn-default" onclick="javascript:location.href='/charge'"/>
		</div>
	</div>
</div>

<div align="center">
	<label id="page"> <c:choose>
			<c:when test="${bestsize >= 5 }">
				<c:forEach var="i" begin="${size-2}" end="${size+2 }">
					<c:choose>
						<c:when test="${param.p == i }">
							<a style="color: red;" href="/charge/use?p=${i }">${i }</a>
						</c:when>
						<c:otherwise>
							<a href="/charge/use?p=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" begin="1" end="${size }">
					<c:choose>
						<c:when test="${param.p == i }">
							<a style="color: red;" href="/charge/use?p=${i }">${i }</a>
						</c:when>
						<c:otherwise>
							<a href="/charge/use?p=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</label>
</div>