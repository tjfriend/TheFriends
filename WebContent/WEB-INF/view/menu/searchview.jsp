<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${map }" var="i">
	���̵� : ${i.ID } <br/>
	�̸� : ${i.NAME } <br/>
	�޴��� : ${i.PHONE } <br/>
	�̸��� : ${i.EMAIL } <br/>
	�ּ� : ${i.ADDRESS } <br/>
</c:forEach>    
    