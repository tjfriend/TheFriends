<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-container" style="max-height: 700px; overflow-y: auto" align="center">
	<input type="button" value="등록" id="add"/>
	<h2>사진첩</h2>
	<c:choose>
		<c:when test="${li != 'null' }">
			<c:forEach items="${li }" var="i">
				${i.ID } <br />
				${i.TITLE } <br />
				${i.CONTENT } <br />
				<br />
				<a href="/picture/reple?num=${i.NUM }&file=/files/${i.UUID}"><img
					src="/files/${i.UUID }" style="width: 100px" /></a>
				<br />
			</c:forEach>
		</c:when>
		<c:otherwise>
			사진이 없습니다
		</c:otherwise>
</c:choose>

	<c:forEach var="i" begin="1" end="${size }">
			<a href="/picture/pictureview/${id }?p=${i }">${i }</a>
	</c:forEach>
	

	<c:if test="${a == 0 || a == 1 }">
		<c:choose>
			<c:when test="${a == 1 }">
				<script>alert("업로드 성공");
				</script>
			</c:when>
			<c:otherwise>
				<script>alert("업로드 실패");
				</script>
			</c:otherwise>
		</c:choose>
	</c:if>
</div>

<script>
	$("#add").click(function(){
		var url = "/picture/up/${id}";
		$.ajax({
			"method" : "get",
			"url" : url,
			"async" : false
		}).done(function(txt){
			$("#homeMain").html(txt);
		});
	});
</script>