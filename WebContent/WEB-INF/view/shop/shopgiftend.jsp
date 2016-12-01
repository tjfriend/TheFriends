<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${m==1 }">
		<p>선물에 성공하였습니다.</p> <br/>
		<input type="button" value="확인" onclick="self.close()" />
	</c:when>
	<c:otherwise>
		<p>선물에 실패하였습니다.</p> 
		<p>보유밤이 부족하거나 친구가 같은 음악이 있습니다.</p> <br/>
		<input type="button" value="닫기" onclick="self.close()" />
		
	</c:otherwise>
</c:choose>