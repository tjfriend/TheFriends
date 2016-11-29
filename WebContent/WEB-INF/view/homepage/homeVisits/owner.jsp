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

<div class="w3-container" align="center">
	<h3 class="w3-padding-32 w3-text-grey" align="center">Visitors</h3>
	<div class="w3-row" style="padding-left: 30px; padding-right: 30px">
		<div align="right">
			<select style="width: 12%; height: 25px; padding:0px; border: 1px solid #ccc; border-radius: 5px" class="w3-select">
				<option>��ü����</option>
				<option>�����</option>
			</select>
		</div>
		<div class="table-responsive">
			<table class="table">
				<thead align="center">
					<tr>
						<td width="15%"><label>Writer</label></td>
						<td><label>Comment</label></td>
						<td width="15%"><label>Date</label></td>
						<td width="20%"><label>���� / ����</label></td>
					</tr>
				</thead>
				<tbody id="tbody" align="center">
					<c:forEach var="t" items="${list }">
						<tr>
							<td><label>${t.WRITER }</label></td>
							<td><label>${t.MEMO }</label></td>
							<td><label>${t.DAY }</label></td>
							<td>
								<input type="button" class="btn btn-default" value="����" id="modify"/>
								<input type="button" class="btn btn-default" value="����" id="delete"/>
								<input type="button" class="btn btn-default" value="�Ϸ�" id="commit" style="display: none;"/>
								<input type="button" class="btn btn-default" value="���" id="cancel" style="display: none;"/>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<label id="page">
				<!-- ����¡ ó�� -->
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