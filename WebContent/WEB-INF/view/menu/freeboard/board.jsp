<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="w3-row" style="margin-top: 50px">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>본격! 게시판 - 게시글 리스트</title>
</head>
<body>
<h1>게시글 리스트</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<tr>
			<th>1</th>
			<th>본격!</th>
			<th>게시판 짜기</th>
			<th>오늘</th>
			<th>1000000</th>
		</tr>
	</table>
	<form action="board/write" method="post">
		 <input type="submit" value="글쓰기" />
</body>
</html>
</div>
