<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>QnA 상세 보기</h1>

<div style="overflow: auto;">
	<table class="table">
		<tr>
			<th align="center" width="10%">${details.NUM }</th>
			<th width="10">${details.CATEGORY }</th>
			<th width="50%">${details.TITLE }</th>
			<th width="30%">${details.TIME }</th>
		</tr>
		<tr>
			<th>${details.ID }</th>
		</tr>
	</table>
	<div>
		<table class="table">
			<tr>
				<th>${details.CONTENT }</th>
		</table>
		<hr />
	</div>
	<div>
		<table class="table">
			<c:forEach var="qcm" items="${qnacommentdata }">
				<tr>
					<th>${qcm.ID }</th>
					<td>${qcm.DAY }</td>
				</tr>
				<tr>
					<td>${qcm.MEMO }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!--  	댓글 -->
	<div>
		<table class="table">
			<c:forEach var="qnac" items="${qnacommentda }">
				<tr>
					<th>${qnac.id }</th>
					<td>${qnac.day }</td>
				</tr>
				<tr>
					<td>${qnac.memo }</td>
				</tr>
			</c:forEach>
		</table>
		<c:forEach var="p" begin="1" end="${qnacommentsi }">
			<c:choose>
				<c:when test="${current == p }">
					<b>${u }</b>
				</c:when>
				<c:otherwise>
					<a href="/qna/details/${details.NUM }?p=${p }">${p }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
	</div>
	
	
	<!-- 로그인시 댓글등록창이 보이게 한다 -->
	<div>
		<c:choose>
			<c:when test="${login == null }">
			</c:when>
			<c:otherwise>
				<form action="/qna/qnacomment">
					<input type="hidden" name="num" value="${details.NUM }">
					<input type="hidden" name="endpa" value="${qnacommentsi }">
					<div style="float: left; margin-right: 10">
						<textarea rows="5" cols="80" style="resize: vertical;" name="memo"> </textarea>
					</div>
					<div style="float: left; left:">
						<input style="width: 80px; height: 106px;" type="submit" value="등록">
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</div>