<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>비밀 번호 확인 </h2>
<div>
	<h5>회원님의 개인정보 보호를 위해 비밀번호를 다시 한번 확인합니다.</h5>
	<form action="/myinfo/PassConfirm">
		비밀번호 :&nbsp;&nbsp;<input type="password" name="pass">
		<input type="submit" value="확인"> 
	</form>
</div>