<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${li }" var="i">
	작성자 : ${i.WRITER } <br/>
	<br/>
	내용 
	<br/>
	<span id="con${i.REPLYNUM }" >${i.CONTENT } </span><br/>
	<c:if test="${sessionScope.id == i.WRITER }">
		<textarea id="${i.REPLYNUM }" rows="3" cols="50" style="display: none" >${i.CONTENT }</textarea>
		<br/>
		<a onclick="modify(${i.REPLYNUM })" id="mo${i.REPLYNUM }" > 수정 </a>
		<a onclick="del(${i.REPLYNUM })" > 삭제 </a>
		<a onclick="newcon(${i.REPLYNUM })" id="new${i.REPLYNUM }" style="display: none ">수정하기</a>
	</c:if>
	<hr/>
</c:forEach>