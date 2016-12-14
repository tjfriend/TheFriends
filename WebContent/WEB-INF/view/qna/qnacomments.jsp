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

<table class="table" style="width: 100%">
		<tr id="hide">
			<td width="5%"><label></label></td>
				<td width="15%"><label></label></td>
				<td width="45%"><label></label></td>
				<td width="15%"><label></label></td>
				<td width="20%"><label></label></td>
		</tr>
	<c:forEach var="cms" items="${comments }">
		<tr>
			<td width="5%"><label>☞</label></td>
			<td width="15%"><label>${cms.ID }</label></td>
			<td width="45%"><label>${cms.MEMO }</label></td>
			<td width="15%"><label>${cms.DAY }</label></td>
			<c:if test="${loginid == cms.ID }">
			<td width="20%"><label><input type="button" value="삭제" 
			id="cmdeletes${cms.COMMNETSNUM}" onclick="cmdeletes(this)"> </label></td>
			</c:if>
		</tr>
	</c:forEach>
</table>
<script>

	function cmdeletes(element) {
		var id = element.id;
		var commentnum = id.substring(id.indexOf('s') + 1);
			alert(commentnum+"// ");
		if (confirm("이 댓글을 정말로 삭제하시겠습니까?") == true) {
			$.ajax({
				"method" : "get",
				"url" : "/qna/commentsdelete?commentnum="+ commentnum + "&pn=${pn }&num=${cms.QNANUM}",
				"async" : false 		
			}).done(function(txt) {
				
// 			$("#lookcomments").html(data).find("#lookcomments");
			});
				location.reload();
// 			location.href = "/qna/commentsdelete?commentnum="+ commentnum + "&pn=${pn }&num=${cms.QNANUM}";
		} else {
			return;
		}
		
	}
</script>