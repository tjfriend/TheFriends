<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>QnA 상세 보기</h1>

<div align="right">
	<input type="button" value="목록보기" onClick="self.location='/qna/list';">
	<c:choose>
		<c:when test="${loginid == details.ID }">
			<input type="button" value="수정"
				onclick="location.href='/qna/qnaupdate?num=${details.NUM}'" />
			<form action="/qna/qnadelete">
				<input type="hidden" name="num" value="${details.NUM }"> <input
					type="submit" value="삭제">

			</form>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</div>





<div style="overflow: auto;">
	<table class="table">
		<tr>
			<th align="center" width="10%">${details.NUM }</th>
			<th width="10">${details.CATEGORY }</th>
			<th width="45%">${details.TITLE }</th>
			<th width="20%">${details.TIME }</th>
			<%-- 	디자인고치기		<td width="5" align="right"><a href="/qna/qnaupdate?num=${details.NUM}">수정</a></td> --%>
		</tr>
		<tr>
			<th>${details.ID }</th>
			<th>${details.INQUIRY }
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
					<th>${qnac.commentnum }</th>
					<th>${qnac.id }</th>
					<td>${qnac.day }</td>
					<td align="right"><input type="button" value="수정" id="change"
						onclick="changecomment('memo_${qnac.commentnum }')">
						
						<form action="/qna/commentdelete">
							<input type="hidden" name="commentnum"
								value="${qnac.commentnum }"> <input type="hidden"
								name="num" value="${details.NUM }"> <input type="submit"
								value="삭제">
						</form></td>
				</tr>
				<tr>
					<td><textarea rows="3" cols="100%" id="memo_${qnac.commentnum }"
							disabled="disabled" style="border: 1px; resize: none;">${qnac.memo }</textarea></td>

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
	<script>
		function changecomment(target) {
			document.getElementById(target).disabled= !document.getElementById(target).disabled;
			if(document.getElementById(target).disabled){
				document.getElementById(target).focus();
				
			}
		}
	</script>

	<!-- 로그인시 댓글등록창이 보이게 한다 -->
	<div>
		<c:choose>
			<c:when test="${login == null }">
			</c:when>
			<c:otherwise>
				<form action="/qna/qnacomment">
					<input type="hidden" name="num" value="${details.NUM }"> <input
						type="hidden" name="endpa" value="${qnacommentsi }">
					<div style="float: left; margin-right: 10">
						<textarea rows="5" cols="80" style="resize: vertical;" name="memo"> </textarea>
					</div>
					<div style="float: left; left:">
						<input style="width: 80px; height: 106px;" type="submit"
							value="등록">
					</div>
				</form>
			</c:otherwise>
		</c:choose>
	</div>
</div>