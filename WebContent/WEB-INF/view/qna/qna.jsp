<%@ page import="org.springframework.beans.factory.annotation.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">QnA</h2>

<div class="w3-row" style="margin-top: 50px">

	<script>
		// 벨류값 가져오기
		function getSelectValue(frm) {
			frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
			frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
		}
	</script>

	
		<table class="table">
			<thead>
				<tr align="center">
					<td colspan="6" style="color: blue; "><h3>The Most QnA </h3> </td>
				</tr>
				<tr align="center">
					<td width="5%"><label>#</label></td>
					<td width="15%"><label>Category</label></td>
					<td width="50%"><label>Title</label></td>
					<td width="8%"><label>ID</label></td>
					<td width="15%"><label>Day</label></td>
					<td width="7%"><label>Count</label></td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var = "best" items="${qnabest }">
					<tr align="center">
						<td>${best.NUM }</td>
						<td>${best.CATEGORY}</td>
						<td><a href="/qna/details/${best.NUM}">${best.TITLE}</a></td>
						<td>${best.ID }</td>
						<td>${best.TIME }</td>
						<td>${best.INQUIRY }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	

	<form action="/qna/list" id="ctg" align="right" method="post">
		<select name="mode" id="sel" style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
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

	<table class="table">
		<tr align="center">
			<td width="5%"><label>#</label></td>
			<td width="15%"><label>Category</label></td>
			<td width="50%"><label>Title</label></td>
			<td width="8%"><label>ID</label></td>
			<td width="15%"><label>Day</label></td>
			<td width="7%"><label>Count</label></td>
		</tr>
		<c:forEach var="qna" items="${qnadata }">
			<tr align="center">
				<td>${qna.NUM }</td>
				<td>${qna.CATEGORY}</td>
				<td><a href="/qna/details/${qna.NUM}">${qna.TITLE}</a></td>
				<td>${qna.ID }</td>
				<td>${qna.TIME }</td>
				<td>${qna.INQUIRY }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div align="center">
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
	</div>
	
	<div align="right">
		<c:choose>
			<c:when test="${login == null }">
				<input type="button" value="질문하기" onclick="javascript:openLogin()" class="btn btn-default">
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
					onclick="javascript:location.href='/qna/write'" class="btn btn-default">
			</c:otherwise>
		</c:choose>
	</div>

	<div align="center">
		<form action="/qna/list" method="post">
			<input type="hidden" name="mode" value="${qnamode }"> 
			<label>검색 </label>
			<input type="search" name="search" style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"> 
				 <input type="submit" value="검색"  class="btn btn-default">
		</form>
	</div>
</div>