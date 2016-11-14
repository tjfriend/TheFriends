<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본격! 게시판 - 게시글 입력폼</title>
</head>
<body>
	<form action="\board" method="post">
		제목 : <input type="text" name="title" required="required"/><br/>
		 작성자 : <input type="text" name="writer" required="required" /><br/>
		 날짜 : <input type="text"	name="regdate" required="required"/><br/>
		 <input type="submit" />
	</form>

</body>
</html>
