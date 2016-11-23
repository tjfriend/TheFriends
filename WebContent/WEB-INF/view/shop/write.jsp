<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Music Upload</h1>

<form action="/shop/upload" method="post">


	곡정보 :&nbsp; <input type="text" name="title" required="required"> <br /><br/>
	판매금액 :&nbsp; <input type="text" name="title" required="required">잣 	<br /> 


	<input type="submit" value="올리기" /><br />
</form>
