<%@page import="org.springframework.beans.factory.annotation.Value"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="w3-row" style="margin-top: 50px">
	<h1>Talk & Talk</h1>
	<script>
		function getSelectValue(frm) {
			frm.textValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].text;
			frm.optionValue.value = frm.selectBox.options[frm.selectBox.selectedIndex].value;
		}
	</script>
	<form action="/board/list" id="ctg">
		<select name="mode" id="sel">
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
		<tr align="center">
			<td>번호</td>
			<td width="200">분류</td>
			<td width="40%">제목</td>
			<td width="100">ID</td>
			<td>day</td>
			<td width="100">조회수</td>
		</tr>
		<c:forEach var="freeboard" items="${freeboarddata }">
			<tr align="center">
				<td align="center">${freeboard.num }</td>
				<td align="center">${freeboard.category }</td>
				<td><a href="/board/freeboarddetails?num=${freeboard.num }">${freeboard.title }</a></td>
				<td>${freeboard.id }</td>
				<td>${freeboard.time }</td>
				<td>${freeboard.inquiry }</td>
		</c:forEach>
	</table>
	
	<form action="write">
		<div align="right">
		<input type="submit" value="글작성"  />
		</div>
	</form>
	
	
	<c:forEach var="i" begin="1" end="${freeboardsize }">
		<c:choose>
			<c:when test="${current == i }">
				<b>${u }</b>
			</c:when>
			<c:otherwise>
				<a href="/board/list?mode=${freeboardmode }&p=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

</div>