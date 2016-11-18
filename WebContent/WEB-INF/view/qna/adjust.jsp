<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>ADJUST</h1>

<form action="/qna/qnaadjust" method="post">
<input type="hidden"  name="num" value="${list.get(0).NUM }"/>
	${list.get(0).CATEGORY }
	분류 :&nbsp; <select name="category" style="width: 150px">
			<option value="개인정보">개인정보</option>
			<option value="이벤트">이벤트</option>
			<option value="홈페이지">홈페이지</option>
			<option value="유료">유료</option>
			<option value="기타">기타</option>	
			</select>
			<br /> <br /> 

	제목 :&nbsp; <input type="text" name="title" value="${list.get(0).TITLE }"> <br /><br/>
	내용 :&nbsp; <textarea rows="15" cols="60" name="content">${list.get(0).CONTENT }</textarea>
	<br /> 

	<input
		type="submit" value="수정하기" /><br />
</form>
