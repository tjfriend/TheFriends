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


<div style="background-color: olive;">
	<form action="/shop/shopgiftend">
		<input type="hidden" name="title" value="${title }" /> 
		<input type="hidden" name="money" value="${money }" />
		<h3>선물할 친구를 선택하세요.</h3>
		<div align="left" class="form-group">
			<select id="gtake" name="gtake"
				style="width: 100px; height: 25px; border: 1px solid #ccc; border-radius: 5px">
				<c:forEach var="t" items="${list }">
					<option>${t.FRIEND }</option>
				</c:forEach>
			</select>
		</div>
		<input type="submit" value="선물하기"/> 
		<input type="button" value="취소" onclick="self.close()" />
		
	</form>
</div>