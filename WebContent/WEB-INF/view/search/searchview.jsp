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

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<div class="table-responsive">
		<table class="table">
			<thead align="center">
				<tr>
					<td><label>아이디</label></td>
					<td><label>이름</label></td>
					<td><label>휴대폰</label></td>
					<td><label>이메일</label></td>
					<td><label>주소</label></td>
					<td><label>친구추가</label></td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${li }" var="i">
					<tr>
						<td id="friendId">${i.ID }</td>
						<td>${i.NAME }</td>
						<td>${i.PHONE }</td>
						<td>${i.EMAIL }</td>
						<td>${i.ADDRESS }</td>
						<td><input class="fi" type="button" value="친구추가" id="${i.ID }" onclick="addFriend(this)"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<label id="page">
				<c:forEach var="i" begin="1" end="${size }">
					<a href="/search/${find }/${con }?p=${i }">${i }</a>
				</c:forEach>
			</label>
		</div>
	</div>
</div>