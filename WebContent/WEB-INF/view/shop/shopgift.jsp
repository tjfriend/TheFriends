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
<h3>정말로 선물을 하시겠습니까?</h3>

<div align="center" class="form-group">
				<label for="point" style="width: 20%" class="w3-text-grey"></label><br/>
				<select id="gtake" style="width: 8%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
					<c:forEach var="t" items="${list }">
						<option>${t.FRIEND }</option>
					</c:forEach>	
				</select>
			</div>

<input type="button" value="선물하기" onclick="" />
<input type="button" value="취소" onclick="" />
