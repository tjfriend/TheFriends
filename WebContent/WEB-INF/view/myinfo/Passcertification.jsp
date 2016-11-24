<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>비밀 번호 확인 </h2>
<style>
hre {
	display: block;
	margin-top: 0.5em;
	margin-bottom: 0.5em;
	margin-left: 0px;
	margin-right: 0px;
	border-style: inset;
	border-width: 1px;
}
</style>
<div>
<hre></hre>
	<h5>회원님의 개인정보 보호를 위해 비밀번호를 다시 한번 확인합니다.</h5>
	<form action="/myinfo/PassConfirm" method="post">
		비밀번호 :&nbsp;&nbsp;<input type="password" name="pass">
		<input type="submit" value="확인"> 
		<c:choose>
			<c:when test="${passch == 1 }">
				<p><font size="2" color="red">비밀번호가 틀렸습니다</font></p>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
	</form>
		
</div>