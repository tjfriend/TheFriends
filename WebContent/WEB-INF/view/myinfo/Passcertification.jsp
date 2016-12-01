<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
	body, h1, h2, h3, h4, h5 {
		font-family: "Raleway", sans-serif
	}
</style>

<h3 class="w3-text-grey" style="margin-top: 50px"
	align="center">My Info</h3>
<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 20px" align="center">
	<p>회원님의 개인정보 보호를 위해 비밀번호를 다시 한번 확인합니다.</p>
	<form action="/myinfo/PassConfirm" method="post">
		비밀번호 :&nbsp;&nbsp;
		<input type="password" name="pass" style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px">
		<input type="submit" value="확인" class="btn btn-default"> 
		<c:if test="${passch == 1 }">
			<p><font size="2" color="red">비밀번호가 틀렸습니다</font></p>
		</c:if>
	</form>
</div>