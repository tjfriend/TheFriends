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

<div align="center">
	<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px; width: 70%">
		<div align="right">
			<input type="button" value="목록보기" class="btn btn-default" onClick="self.location='/qna/list';">
			<c:choose>
				<c:when test="${loginid == details.ID }">
					<input type="button" value="수정" class="btn btn-default"
						onclick="location.href='/qna/qnaupdate?num=${details.NUM}'" />
					<input type="button" value="삭제" class="btn btn-default"
						onclick="location.href='/qna/qnadelete?num=${details.NUM}'">
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="table-responsive" align="center">
			<table class="table">
				<tr align="center">
					<tr align="center">
					<td width="5%"><label>#</label></td>
					<td width="15%"><label>Category</label></td>
					<td width="50%"><label>Title</label></td>
					<td width="8%"><label>Writer</label></td>
					<td width="15%"><label>Day</label></td>
					<td width="7%"><label>Count</label></td>
				</tr>
				<tr align="center">
					<td>${details.NUM }</td>
					<td>${details.CATEGORY }</td>
					<td>${details.TITLE }</td>
					<td>${details.ID }</td>
					<%-- 	디자인고치기		<td width="5" align="right"><a href="/qna/qnaupdate?num=${details.NUM}">수정</a></td> --%>
					<td>${details.TIME }</td>
					<td>${details.INQUIRY }</td>
				</tr>
			</table>
			<div align="center">
				<table class="table">
					<tr>
						<td style="padding: 20px">${details.CONTENT }</td>
				</table>
				<hr />
			</div>
			<div align="center">
				<table class="table">
					<tr align="center">
						<td width="15%"><label>Writer</label></td>
						<td width="50%"><label>Comment</label></td>
						<td width="15%"><label>Day</label></td>
						<td width="20%"><label></label></td>
					</tr>
				</table>
			</div>
		
			<!--  	댓글 -->
			<div>  
				<table class="table">
					<c:forEach var="qnac" items="${qnacommentda }">
						<tr align="center">
							<td width="15%">${qnac.id }</td>
							<td width="50%">
								<input type="text" id="changememo${qnac.commentnum }" class="btn btn-default"
									disabled="disabled" style="width: 100%; border: 1px; resize: none;" value="${qnac.memo }"/>
								<input type="text"  id="memo${qnac.commentnum }"
									class="btn btn-default" style="width: 100%; resize: none; display: none;" name="memo" value="${qnac.memo }"/>
							</td>
							<td width="15%">${qnac.day }</td>
							<td width="20%">
								<c:if test="${loginid == details.ID }">
									<input type="button" value="수정" id="change${qnac.commentnum }"
										onclick="change(this)" class="btn btn-default"> 
									<input type="button" value="완료" style="display: none;"
											id="changecubmit${qnac.commentnum }" class="btn btn-default"
											onclick="memoupdate(this)">
									<input type="button" value="취소" id="chagecancel${qnac.commentnum }"
										class="btn btn-default" onclick="changeCancel(this)" style="display: none;">
									<input type="hidden" name="commentnum"
										value="${qnac.commentnum }">
									<input type="button" value="삭제" id="deletesumit${qnac.commentnum }" class="btn btn-default"
										onclick="location.href='/qna/commentdelete?commentnum=${qnac.commentnum}&num=${details.NUM}'">
								</c:if>
							</td>
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
			<br/>
		
			<script>
				function memoupdate(element){
					var id = element.id;
					id = id.slice(id.indexOf('t')+1);
					var memo = $("#memo"+id).val();
					location.href="/qna/commentupdate?num=${details.NUM}&commentnum="+id+"&memo="+memo;
				}
				
				function change(element) {
					var id = element.id;
					var num = id.substring(id.indexOf('e') + 1);
					$("#change" + num).hide();
					$("#deletesumit" + num).hide();
					$("#chagecancel" + num).show();
					$("#memo" + num).show();
					$("#changecubmit" + num).show();
					$("#changememo" + num).hide();
				}
		
				function changeCancel(element) {
					var id = element.id;
					var num = id.substring(id.indexOf('l') + 1);
					$("#change" + num).show();
					$("#changememo" + num).show();
					$("#deletesumit" + num).show();
					$("#chagecancel" + num).hide();
					$("#changecubmit" + num).hide();
					$("#memo" + num).hide();
				}
			</script>
		
			<!-- 로그인시 댓글등록창이 보이게 한다 -->
			<div align="center">
				<c:if test="${login != null }">
					<form action="/qna/qnacomment">
						<input type="hidden" name="num" value="${details.NUM }"> <input
							type="hidden" name="endpa" value="${qnacommentsi }">
						<input type="text" name="memo" style="width: 50%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px; resize: none;"/>
						<input type="submit" value="등록" class="btn btn-default">
					</form>
				</c:if>
			</div>
		</div>
	</div>
</div>