<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h2>자유게시판</h2>
	
		<select onchange="location.href ='www.naver.com" name="category" id="ctg1">
		<option id="ctg1-1" selected="selected" value="all">분류</option>
		<option id="ctg1-2" value="data">개인정보</option>
		<option id="ctg1-3" value="event">이벤트</option>
		<option id="ctg1-4" value="homepage">홈페이지</option>
		<option id="ctg1-5" value="charge">유료</option>
		<option id="ctg1-6" value="etc">기타</option>
	</select>
	
	<script>

</script>

	<table class="table">
		<tr>
			<th align="center">번호</th>
			<th width="80">분류</th>
			<th width="50%">제목</th>
			<th width="100">ID</th>
			<th>day</th>
		</tr>
		<c:forEach var="freeboard" items="${freeboarddata }">
			<tr>
				<td align="center">${freeboard.num }</td>
				<td align="center">${freeboard.category }</td>
				<th><a href="/board/freeboarddetails?num=${freeboard.num }">${freeboard.title }</a></th>
				<th>${freeboard.title }</th>
				<th>${freeboard.id }</th>
				<th>${freeboard.time }</th>
		</c:forEach>
	</table>
	
	<form action="write">
		<div align="right">
		<input type="submit" value="글작성"  />
		</div>
	</form>
	<c:forEach var="i" begin="1" end="${freeboardsize }">
		<c:choose>
			<c:when test="${current == i }">
				<b>${u }</b>
			</c:when>
			<c:otherwise>
				<a href="/board/list?p=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</div>