<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table style="width: 100%" class="table">
	<thead align="center">
		<tr>
			<td style="width: 15%"><label>Writer</label></td>
			<td><label>Comment</label></td>
			<td style="width: 15%"><label>Day</label></td>
			<td style="width: 20%"><label>수정/삭제</label></td>
		</tr>
	</thead>
	<tbody id="replyComment" align="center">
		<c:forEach var="t" items="${li }">
			<tr>
				<td>${t.WRITER }</td>
				<td>
					<input type="text" readonly="readonly" id="${t.REPLYNUM }" value="${t.CONTENT }"
							style="width:100%; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px; text-align: center"/>
				</td>
				<td>${t.DAY }</td>
				<td>
					<c:choose>
						<c:when test="${t.WRITER==sessionScope.id }">
							<input type="button" class="btn btn-default" value="수정" id="modify${t.REPLYNUM }" onclick="modify(this)"/>
							<input type="button" class="btn btn-default" value="완료" id="commit${t.REPLYNUM }" style="display: none" onclick="commit(this)"/>
							/ 
							<input type="button" class="btn btn-default" value="삭제" id="delete${t.REPLYNUM }" onclick="del(this)"/>
							<input type="button" class="btn btn-default" value="취소" id="cancel${t.REPLYNUM }" style="display: none" onclick="cancel(this)"/>
						</c:when>
						<c:otherwise>
							<input type="button" class="btn btn-default" value="수정" id="modify${t.REPLYNUM }" onclick="modify(this)" disabled="disabled"/>
							<input type="button" class="btn btn-default" value="완료" id="commit${t.REPLYNUM }" style="display: none" onclick="commit(this)" disabled="disabled"/>
							/ 
							<input type="button" class="btn btn-default" value="삭제" id="delete${t.REPLYNUM }" onclick="del(this)" disabled="disabled"/>
							<input type="button" class="btn btn-default" value="취소" id="cancel${t.REPLYNUM }" style="display: none" onclick="cancel(this)" disabled="disabled"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<script>
	var txt;
	function modify(element){
		var id = element.id;
		id = id.slice(id.indexOf('y')+1);
		$("#modify"+id).hide();
		$("#delete"+id).hide();
		$("#commit"+id).show();
		$("#cancel"+id).show();
		$("#"+id).prop("readonly", null);
		txt = $("#"+id).val();
	}
	
	function del(element){
		var id = element.id;
		id = id.slice(id.indexOf('t')+2);
// 		$("#modify"+id).hide();
// 		$("#delete"+id).hide();
// 		$("#commit"+id).show();
// 		$("#cancel"+id).show();
		$.ajax({
			"method" : "get",
			"url" : "/picture/delete?replynum="+id,
			"async" : false
		}).done(function(txt){
			alert("삭제완료");
			$("#replyDiv").hide();
		});
	}
	
	function commit(element){
		var id = element.id;
		id = id.slice(id.indexOf('t')+1);
		txt = $("#"+id).val();
		$("#modify"+id).show();
		$("#delete"+id).show();
		$("#commit"+id).hide();
		$("#cancel"+id).hide();
		$("#"+id).prop("readonly", "readonly");
		$.ajax({
			"method" : "get",
			"url" : "/picture/modify?replynum="+id+"&content="+txt,
			"async" : false
		}).done(function(txt){
			
		});
	}
	
	function cancel(element){
		var id = element.id;
		id = id.slice(id.indexOf('l')+1);
		$("#modify"+id).show();
		$("#delete"+id).show();
		$("#commit"+id).hide();
		$("#cancel"+id).hide();
		$("#"+id).prop("readonly", "readonly");
		$("#"+id).val(txt);
	}
</script>