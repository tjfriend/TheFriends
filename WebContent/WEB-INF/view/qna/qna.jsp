<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h2>Search</h2>

	<select onchange="location.href ='www.naver.com" name="category" id="ctg1">
		<option id="ctg1-1" selected="selected" value="all">분류</option>
		<option id="ctg1-2" value="data">개인정보</option>
		<option id="ctg1-3" value="event">이벤트</option>
		<option id="ctg1-4" value="homepage">홈페이지</option>
		<option id="ctg1-5" value="charge">유료</option>
		<option id="ctg1-6" value="etc">기타</option>
	</select>

<script>
	${}

</script>
	<table class="table">
		<tr>
			<th align="center">#</th>
			<th width="80">분류</th>
			<th width="50%">제목</th>
			<th width="100">ID</th>
			<th>day</th>
		</tr>
		<c:forEach var="qna" items="${qnadata }">
			<tr>
				<td align="center">${qna.num }</td>
				<td align="center">${qna.category }</td>
				<th><a href="/qna/qnadetails?num=${qna.num }">${qna.title }</a></th>
				<th>${qna.id }</th>
				<th>${qna.time }</th>
		</c:forEach>
	</table>

	<div align="right">
		<c:choose>

			<c:when test="${login == null }">
				<input type="button" value="질문하기" onclick="javascript:openLogin()">
				<script>
					LeftPosition = (screen.width - 400) / 2;
					TopPosition = (screen.height - 300) / 2;

					function openLogin() {
						window.open("/login/simple", "login",
								"width=400, height=300,left=" + LeftPosition
										+ ",top=" + TopPosition);

					}
				</script>
			</c:when>
			<c:otherwise>
				<input type="button" value="질문하기"
					onclick="javascript:location.href='/qna/write'">
			</c:otherwise>
		</c:choose>
	</div>




	<c:forEach var="i" begin="1" end="${qnasize }">
		<c:choose>
			<c:when test="${current == i }">
				<b>${u }</b>
			</c:when>
			<c:otherwise>
				<a href="/qna?p=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</div>