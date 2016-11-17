<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>질문하기</h1>


<form action="/qna/make" method="post">
	
	분류 :&nbsp;<select name="category" style="font-size:10pt">
			<option value="개인정보">개인정보</option>
			<option value="이벤트">이벤트</option>
			<option value="홈페이지">홈페이지</option>
			<option value="유료">유료</option>
			<option value="기타">기타</option>	
			</select>
	
	제목 :&nbsp; <input type="text" name="title" required="required"> <br /> 내용 :&nbsp;
	<textarea rows="5" cols="5" name="content" required="required"></textarea>
	<br /> 

	<input
		type="submit" value="질문하기" /><br />
</form>
