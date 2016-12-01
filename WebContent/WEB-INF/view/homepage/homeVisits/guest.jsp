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
							<td><label><input type="text" id="memo${t.NUM }" readonly="readonly" value="${t.MEMO }" style="text-align: center; border: 0"/></label></td>
							<td><label>${t.DAY }</label></td>
							<c:if test="${t.WRITER == sessionScope.id }">
								<td>
									<input type="button" class="btn btn-default" value="수정" id="modify${t.NUM }" onclick="modify('${t.NUM}')"/>
									<input type="button" class="btn btn-default" value="삭제" id="delete${t.NUM }" onclick="del('${t.NUM}')"/>
									<input type="button" class="btn btn-default" value="완료" id="commit${t.NUM }" style="display: none;" onclick="commit('${t.NUM}')"/>
									<input type="button" class="btn btn-default" value="취소" id="cancel${t.NUM }" style="display: none;" onclick="cancel(${t.NUM})"/>
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

<div class="w3-modal" style="display: none" id="modifyDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="modify">
		<input type="button" class="btn btn-success" value="수정되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="delDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="del">
		<input type="button" class="btn btn-success" value="삭제되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	$("#private").change(function(){
		var private = $("#private").val();
		var url = "/visits/priv/${id}/"+private;
		$.ajax({
			"method" : "get",
			"url" : url,
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td><label>"+txt[i].WRITER+"</label></td>";
				html += "<td><label><input type='text' id='memo"+txt[i].NUM+"' readonly='readonly' value='"+txt[i].MEMO+"' style='text-align: center; border: 0'/></label></td>";
				html += "<td><label>"+txt[i].DAY+"</label></td>";
				html += "<td>";
				html += "<input type='button' class='btn btn-default' value='수정' id='modify"+txt[i].NUM+"' onclick='modify("+txt[i].NUM+")'/> ";
				html += "<input type='button' class='btn btn-default' value='삭제' id='delete"+txt[i].NUM+"' onclick='del("+txt[i].NUM+")'/>";
				html += "<input type='button' class='btn btn-default' value='완료' id='commit"+txt[i].NUM+"' onclick='commit("+txt[i].NUM+")' style='display: none'/>";
				html += "<input type='button' class='btn btn-default' value='취소' id='cancel"+txt[i].NUM+"' onclick='cancel("+txt[i].NUM+")' style='display: none'/>";
				html += "</td></tr>";
			}
			$("#tbody").html(html);
		});
	});
	
	var txt = "";
	var m = 0;
	var d = 0;
	function modify(num){
		txt = $("#memo"+num).val();
		$("#memo"+num).prop("readonly", null);
		$("#modify"+num).hide();
		$("#delete"+num).hide();
		$("#commit"+num).show();
		$("#cancel"+num).show();
		m = 1;
	}
	
	function del(num){
		$("#modify"+num).hide();
		$("#delete"+num).hide();
		$("#commit"+num).show();
		$("#cancel"+num).show();
		d = 1;
	}
	
	function commit(num){
		if(m>0){
			txt = $("#memo"+num).val();
			$.ajax({
				"method" : "get",
				"url" : "/visits/modify/"+num+"/"+txt,
				"async" : false
			}).done(function(txt){
				$("#memo"+num).prop("readonly", "readonly");
				$("#modifyDiv").fadeIn(300).delay(1000).fadeOut(300);
				setTimeout(function(){location.href="/homepage/${id}"}, 1600);
				m = 0;
			});
		} else if(d>0){
			$.ajax({
				"method" : "get",
				"url" : "/visits/del/"+num,
				"async" : false
			}).done(function(txt){
				$("#delDiv").fadeIn(300).delay(1000).fadeOut(300);
				setTimeout(function(){location.href="/homepage/${id}"}, 1600);
				d = 0;
			});
		}
		$("#modify"+num).show();
		$("#delete"+num).show();
		$("#commit"+num).hide();
		$("#cancel"+num).hide();
	}
	
	function cancel(num){
		$("#modify"+num).show();
		$("#delete"+num).show();
		$("#commit"+num).hide();
		$("#cancel"+num).hide();
		$("#memo"+num).prop("readonly", "readonly");
		$("#memo"+num).val(txt);
	}
</script>