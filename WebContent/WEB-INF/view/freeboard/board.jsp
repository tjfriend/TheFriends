<%@page import="org.springframework.beans.factory.annotation.Value"%>
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
	align="center">Free Board</h2>

<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<script>
		function getSelectValue(frm) {
			frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
			frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
		}
	</script>
	<form action="/board/list" id="ctg" align="right" method="post">
		<select name="mode" id="sel" style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
			<option value="" ${freeboardmode eq ''?'selected':'' }>분류</option>
			<option value="10대 이야기" ${freeboardmode eq '10대 이야기'?'selected':'' }>10대 이야기</option>
			<option value="20대 이야기" ${freeboardmode eq '20대 이야기'?'selected':'' }>20대 이야기</option>
			<option value="30대 이야기" ${freeboardmode eq '30대 이야기'?'selected':'' }>30대 이야기</option>
			<option value="40대 이야기" ${freeboardmode eq '40대 이야기'?'selected':'' }>40대 이야기</option>
			<option value="50대 이야기" ${freeboardmode eq '50대 이야기'?'selected':'' }>50대 이야기</option>
			<option value="훈훈한 이야기"  ${freeboardmode eq '훈훈한 이야기'?'selected':'' }>훈훈한 이야기</option>
			<option value="세상에 이런일이"  ${freeboardmode eq '세상에 이런일이'?'selected':'' }>세상에 이런일이</option>
			<option value="나 억울해요" ${freeboardmode eq '나 억울해요'?'selected':'' }>나 억울해요</option>
			<option value="이슈" ${freeboardmode eq '이슈'?'selected':'' }>이슈</option>
			<option value="유머" ${freeboardmode eq '유머'?'selected':'' }>유머</option>
			<option value="사랑과이별" ${freeboardmode eq '사랑과이별'?'selected':'' }>사랑과이별</option>
			<option value="남자들끼리만" ${freeboardmode eq '남자들끼리만'?'selected':'' }>남자들끼리만</option>
			<option value="여자들끼리만" ${freeboardmode eq '여자들끼리만'?'selected':'' }>여자들끼리만</option>
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
				<td width="8%"><label>Writer</label></td>
				<td width="15%"><label>Day</label></td>
				<td width="7%"><label>Count</label></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="freeboard" items="${freeboarddata }">
				<tr align="center">
					<td align="center">${freeboard.NUM }</td>
					<td align="center">${freeboard.CATEGORY }</td>
					<td><a href="/board/freeboarddetails?num=${freeboard.NUM }">${freeboard.TITLE }</a></td>
					<td>${freeboard.ID }</td>
					<td>${freeboard.TIME }</td>
					<td>${freeboard.INQUIRY }</td>
			</c:forEach>
		</tbody>
	</table>
	
	<div align="center">
		<c:forEach var="i" begin="1" end="${freeboardsize }">
			<c:choose>
				<c:when test="${current == i }">
					<b>${u }</b>
				</c:when>
				<c:otherwise>
					<a href="/board/list?mode=${freeboardmode }&search=${freeboardsearch }&p=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>

	<div align="right">
		<form action="/board/write" method="post">
			<input type="submit" value="글작성"  class="btn btn-default"/>
		</form>
	</div>
	
	<div align="center">
		<form action="/board/list" method="post">
			<input type="hidden" name="mode" value="${freeboardmode }"/> 
			<label>검색 </label>
			<input type="search" name="search" style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/> 
			<input type="submit" value="검색"  class="btn btn-default"/>
		</form>
	</div>
</div>