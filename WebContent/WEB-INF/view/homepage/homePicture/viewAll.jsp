<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${li }" var="i">
	작성자 : ${i.WRITER } <br/>
	내용 : ${i.CONTENT } <br/>
	<hr/>
</c:forEach>

	