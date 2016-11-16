<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h1>Talk & Talk</h1>
	
		<select onchange="location.href ='www.naver.com" name="category" id="ctg1">
		<option id="ctg1-1" selected="selected" value="all">카테고리</option>
		<option id="ctg1-2" value="10age">10대 이야기</option>
		<option id="ctg1-3" value="20age">20대 이야기</option>
		<option id="ctg1-4" value="30age">30대 이야기</option>
		<option id="ctg1-5" value="40age">40대 이야기</option>
		<option id="ctg1-6" value="50age">50대 이야기</option>
		<option id="ctg1-7" value="wonderfulstory">훈훈한 이야기</option>
		<option id="ctg1-8" value="happeningworld">세상에 이런일이</option>
		<option id="ctg1-9" value="wronged">나 억울해요</option>
		<option id="ctg1-10" value="Issue">이슈</option>
		<option id="ctg1-11" value="Humor">유머</option>
		<option id="ctg1-12" value="loveParting">사랑과이별</option>
		<option id="ctg1-13" value="man">남자들끼리만</option>
		<option id="ctg1-14" value="Woman">여자들끼리만</option>
	</select>
	
	<script>

</script>

	<table class="table">
		<tr align="center">
			<td>번호</td>
			<td width="80">분류</td>
			<td width="50%">제목</td>
			<td width="100">ID</td>
			<td>day</td>
		</tr>
		<c:forEach var="freeboard" items="${freeboarddata }">
			<tr align="center">
				<td align="center">${freeboard.num }</td>
				<td align="center">${freeboard.category }</td>
				<td><a href="/board/freeboarddetails?num=${freeboard.num }">${freeboard.title }</a></td>
				<td>${freeboard.id }</td>
				<td>${freeboard.time }</td>
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