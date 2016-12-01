<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div class="w3-container" style="max-height: 700px" align="center">
	<h3 class="w3-padding-32 w3-text-grey" align="center">Visitors</h3>
	<div class="w3-row" style="padding-left: 30px; padding-right: 30px">
		<div>
			<textarea cols="70" rows="4" style="resize: none" id="memo"></textarea>&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="등록" id="submit" style="margin-bottom: 25px"/>
			<input type="checkbox" id="mode" style="margin-bottom: 5px"/>비공개<br/><br/>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead align="center">
					<tr>
						<td width="15%"><label>Writer</label></td>
						<td><label>Comment</label></td>
						<td width="15%"><label>Date</label></td>
						<c:if test="${t.WRITER == sessionScope.id }">
							<td width="20%"><label>수정 / 삭제</label></td>
						</c:if>
					</tr>
				</thead>
				<tbody id="tbody" align="center">
					<c:forEach var="t" items="${list }">
						<tr>
							<td><label>${t.WRITER }</label></td>
							<td><label>${t.MEMO }</label></td>
							<td><label>${t.DAY }</label></td>
							<c:if test="${t.WRITER == sessionScope.id }">
								<td>
									<input type="button" class="btn btn-default" value="수정" id="modify"/>
									<input type="button" class="btn btn-default" value="삭제" id="delete"/>
									<input type="button" class="btn btn-default" value="완료" id="commit" style="display: none;"/>
									<input type="button" class="btn btn-default" value="취소" id="cancel" style="display: none;"/>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<label id="page">
				<!-- 페이징 처리 -->
					<%-- <c:forEach var="i" begin="1" end="${noticesize }">
						<c:choose>
							<c:when test="${current == i }">
								<b>${u }</b>
							</c:when>
							<c:otherwise>
								<a href="/notice/list?p=${i }">${i }</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> --%>
				</label>
			</div>
		</div>
	</div>
</div>

<div class="w3-modal" style="display: none" id="addDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="add">
		<input type="button" class="btn btn-success" value="등록되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="addFailDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="addFail">
		<input type="button" class="btn btn-success" value="등록에 실패하였습니다.." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>