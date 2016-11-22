<%@ page import="org.springframework.beans.factory.annotation.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h2>Search</h2>

	<script>
		// 벨류값 가져오기
		function getSelectValue(frm) {
			frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
			frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
		}
	</script>



	<form action="/qna/list" id="ctg">
		<select name="mode" id="sel">
			<option value="" ${qnamode eq ''?'selected':'' }>분류</option>
			<option value="개인정보" ${qnamode eq '개인정보'?'selected':'' }>개인정보</option>
			<option value="이벤트" ${qnamode eq '이벤트'?'selected':'' }>이벤트</option>
			<option value="홈페이지" ${qnamode eq '홈페이지'?'selected':'' }>홈페이지</option>
			<option value="유료" ${qnamode eq '유료'?'selected':'' }>유료</option>
			<option value="기타" ${qnamode eq '기타'?'selected':'' }>기타</option>
		</select>
	</form>
	<script>
		document.getElementById("sel").addEventListener("change", function() {
			document.getElementById("ctg").submit();
		});
	</script>

	<c:choose>
	<c:when test="${p==1 }">
	<table class="table">
		<tr>
		<td style="color: blue; "><h3>자주 묻는 질문 </h3> </td>
		</tr>
		<c:forEach var = "best" items="${qnabest }">
		<tr>
			<th><a href="/qna/details/${best.NUM}">${best.TITLE }</a></th>
		</tr>
			
		</c:forEach>
	
	</table>
	</c:when>
	<c:otherwise>
	</c:otherwise>
	</c:choose>

	<table class="table">
		<tr>
			<th align="center">#</th>
			<th width="80">분류</th>
			<th width="50%">제목</th>
			<th width="100">ID</th>
			<th>day</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="qna" items="${qnadata }">
			<tr>
				<td align="center">${qna.NUM }</td>
				<td align="center">${qna.CATEGORY}</td>
				<th><a href="/qna/details/${qna.NUM}">${qna.TITLE}</a></th>
				<th>${qna.ID }</th>
				<th>${qna.TIME }</th>
				<th>${qna.INQUIRY }</th>
			</tr>
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
				<b></b>
			</c:when>
			<c:otherwise>
				<a href="/qna/list?mode=${qnamode }&search=${qnasearch }&p=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>




	<br />
	<hr />
	<form action="/qna/list">
		<input type="hidden" name="mode" value="${qnamode }"> 
		검색 : <input type="search" name="search"> 
			 <input type="submit" value="검색"  >

	</form>
</div>