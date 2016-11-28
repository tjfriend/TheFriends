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
	align="center">Event1</h2>
<c:forEach var="mem" items="${nick }">
		<h4>123${mem.NICKNAME }</h4>
	</c:forEach>

<div class="w3-row"
	style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<div class="table-responsive">
		<table class="table">
			<thead align="center">
				<tr>
					<td width="5%"><label>#</label></td>
					<td width="50%"><label>Title</label></td>
					<td width="15%"><label>Writer</label></td>
					<td width="15%"><label>Day</label></td>
					<td width="15%"><label>Count</label></td>
				</tr>
			</thead>
			<tbody id="tbody" align="center">
				<c:forEach var="event" items="${eventdata }">
					<tr>
						<td><label>${event.NUM }</label></td>
						<td><label><a href="/event/details/${event.NUM }">${event.TITLE }</a></label></td>
						<td><label>${event.WRITER }</label></td>
						<td><label>${event.DAY	 }</label></td>
						<td><label>${event.INQUIRY }</label></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div align="center">
			<label id="page"> <!-- 페이징 처리 --> <c:forEach var="i"
					begin="1" end="${eventsize }">
					<c:choose>
						<c:when test="${current == i }">
							<b>${u }</b>
						</c:when>
						<c:otherwise>
							<a href="/notice/list?p=${i }">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</label>

			
				
				<div align="right">
					<input type="button" value="글작성" class="btn btn-default"
						onclick="noticeWrite()" />
				</div>
				
			
		</div>
	</div>
	<div align="center">
		<form action="/event/list" method="post">
			<label>검색 :</label> <input type="search" name="search"
				style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px" />
			<input type="submit" value="검색" class="btn btn-default" />
		</form>
	</div>
</div>

<script>
	function noticeWrite() {
		location.href = "/event/write";
	}
</script>