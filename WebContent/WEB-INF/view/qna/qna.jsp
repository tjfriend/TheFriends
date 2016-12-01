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
	align="center">QnA // ${p }</h2>

<div class="w3-row"
	style="padding-left: 30px; padding-right: 30px; padding-top: 40px">

	<script>
		// 벨류값 가져오기
		function getSelectValue(frm) {
			frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
			frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
		}
	</script>

	<h3 align="center">The Most QnA</h3>
	<table class="table">
		<thead>
			<tr align="center">
				<td width="5%"><label>#</label></td>
				<td width="15%"><label>Category</label></td>
				<td width="50%"><label>Writer</label></td>
				<td width="8%"><label>ID</label></td>
				<td width="15%"><label>Day</label></td>
				<td width="7%"><label>Count</label></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="best" items="${qnabest }">
				<tr align="center">
					<td><label>${best.NUM }</label></td>
					<td><label>${best.CATEGORY}</label></td>
					<td><label><a href="/qna/details/${best.NUM}">${best.TITLE}</a></label></td>
					<td><label>${best.ID }</label></td>
					<td><label>${best.TIME }</label></td>
					<td><label>${best.INQUIRY }</label></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<form action="/qna/list" id="ctg" align="right" method="post">
		<select name="mode" id="sel"
			style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
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
		<thead>
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
			<c:forEach var="qna" items="${qnadata }">
				<tr align="center">
					<td><label>${qna.NUM }</label></td>
					<td><label>${qna.CATEGORY}</label></td>
					<td><label><a href="/qna/details/${qna.NUM}?pn=${p}">${qna.TITLE}</a></label></td>
					<td><label>${qna.ID }</label></td>
					<td><label>${qna.TIME }</label></td>
					<td><label>${qna.INQUIRY }</label></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>



	<div align="center">
		<label id="page"> <!-- 페이징 처리 --> <c:choose>
				<c:when test="${qnabestsize >= 5 }">
					<c:forEach var="i" begin="${qnasize-2}" end="${qnasize+2 }">
						<c:choose>
							<c:when test="${param.p == i }">
								<a style="color: red;"
									href="/qna/list?mode=${qnamode }&search=${qnasearch }&p=${i }&paging=${qnasize }">${i }</a>
							</c:when>
							<c:otherwise>
								<a
									href="/qna/list?mode=${qnamode }&search=${qnasearch }&p=${i }&paging=${qnasize }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="i" begin="1" end="${qnasize }">
						<c:choose>
							<c:when test="${param.p == i }">
								<a style="color: red;"
									href="/qna/list?mode=${qnamode }&search=${qnasearch }&p=${i }&paging=${qnasize }">${i }</a>
							</c:when>
							<c:otherwise>
								<a
									href="/qna/list?mode=${qnamode }&search=${qnasearch }&p=${i }&paging=${qnasize }">${i }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</label>
	</div>





	<div align="right">
		<c:choose>
			<c:when test="${login == null }">
				<input type="button" value="질문하기" onclick="javascript:openLogin()"
					class="btn btn-default">
				<script>
					LeftPosition = (screen.width - 400) / 2;
					TopPosition = (screen.height - 300) / 2;

					function openLogin() {
						alert("로그인이 필요한 서비스입니다 로그인을 해주세요.");
						// 						window.open("/login/simple", "login",
						// 								"width=400, height=300,left=" + LeftPosition
						// 										+ ",top=" + TopPosition);
					}
				</script>
			</c:when>
			<c:otherwise>
				<input type="button" value="질문하기"
					onclick="javascript:location.href='/qna/write'"
					class="btn btn-default">
			</c:otherwise>
		</c:choose>
	</div>

	<div align="center">
		<form action="/qna/list" method="post">
			<input type="hidden" name="mode" value="${qnamode }" /> <label>검색&nbsp;</label>
			<input type="search" name="search"
				style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px" />
			<input type="submit" value="검색" class="btn btn-default" />
		</form>
	</div>
</div>