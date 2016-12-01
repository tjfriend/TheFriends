<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Free Board</h2>

<div align="center">
	<div class="w3-row"
		style="padding-left: 30px; padding-right: 30px; padding-top: 40px; width: 70%">
		<div align="right">
			<input type="button" value="목록보기" class="btn btn-default"
				onclick="self.location='/board/list?p=${freeboardsetlist}';">
				<c:choose>
					<c:when test="${freeboarddetailsdata2 == freeboarddetailsdata.ID }">
						<input type="button" value="수정" class="btn btn-default"
							onclick="location.href='/board/freeboardupdate?num=${freeboarddetailsdata.NUM}'" />
						<input type="button" value="삭제" class="btn btn-default"
						id="boardDelete${details.NUM }" onclick="boardDelete(this)">
					</c:when>
				</c:choose>
		</div>
		<div class="table-responsive" align="center">
			<table class="table">
				<tr align="center">
					<td width="5%"><label>#</label></td>
					<td width="15%"><label>Category</label></td>
					<td width="50%"><label>Title</label></td>
					<td width="8%"><label>Writer</label></td>
					<td width="15%"><label>Day</label></td>
					<td width="7%"><label>Count</label></td>
				</tr>
				
					<tr align="center">
						<td>${freeboarddetailsdata.NUM }</td>
						<td>${freeboarddetailsdata.CATEGORY }</td>
						<td>${freeboarddetailsdata.TITLE }</td>
						<td>${freeboarddetailsdata.ID }</td>
						<td>${freeboarddetailsdata.TIME }</td>
						<td>${freeboarddetailsdata.INQUIRY }</td>
					</tr>
			</table>
			<div align="center">
				<table class="table">
					<tr>
						<td style="padding: 20px">${details.CONTENT }</td>
				</table>
				<hr />
			</div>
		</div>
		<!--  	댓글 -->
		<div>
			<table class="table">
				<c:forEach var="ecmda" items="${freeboardcommentda }">
					<tr align="center">
						<td width="15%">${ecmda.ID }</td>
						<td width="50%"><input type="text"
							id="changememo${ecmda.COMMENTNUM }" class="btn btn-default"
							disabled="disabled"
							style="width: 100%; border: 1px; resize: none;"
							value="${ecmda.MEMO }" /> <input type="text"
							id="memo${ecmda.COMMENTNUM }" class="btn btn-default"
							style="width: 100%; resize: none; display: none;" name="memo"
							value="${ecmda.MEMO }" /></td>
						<td width="15%">${ecmda.DAY }</td>
						<td width="20%"><c:if test="${loginid == ecmda.ID }">
								<input type="button" value="수정" id="change${ecmda.COMMENTNUM }"
									onclick="change(this)" class="btn btn-default">
								<input type="button" value="완료" style="display: none;"
									id="changecubmit${ecmda.COMMENTNUM }" class="btn btn-default"
									onclick="memoupdate(this)">
								<input type="button" value="취소"
									id="chagecancel${ecmda.COMMENTNUM }" class="btn btn-default"
									onclick="changeCancel(this)" style="display: none;">
								<input type="hidden" name="commentnum"
									value="${ecmda.COMMENTNUM }">
								<input type="button" value="삭제"
									id="deletesumit${ecmda.COMMENTNUM }" class="btn btn-default"
									onclick="deletesumit(this)">
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
			
			<fmt:parseNumber var="var3" value="${(freeboardcommentsi-1)/5}"
					integerOnly="true" />
					<c:if test="${freeboardcommentsi > 5 }">
					<input type="button" value="이전" onclick="javascript:backpage()">
				</c:if>
			<c:forEach var="p" begin="${var3*5+1 }" end="${freeboardcommentsi }">
				<c:choose>
					<c:when test="${p == freeboardcommentsi }">
						<a href="/board/freeboarddetails/${details.NUM }?p=${p }&paging=${freeboardcommentsi }">${p }</a>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="/board/freeboarddetails/${details.NUM }?p=${p }&paging=${freeboardcommentsi }">${p }</a>&nbsp;|
					</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${freeboardbestsizecom != freeboardcommentsi }">
					<input type="button" value="다음" onclick="javascript:nextpage()" />
				</c:if>
		</div>
		<br />
		<c:if test="${freeboardbestsizecom == freeboardcommentsi }">
				<fmt:parseNumber var="freeboardcommentsi" value="${(var3+1)*5}"
					integerOnly="true" />
			</c:if>

		<script>
		
		function nextpage() {
			paging = ${freeboardcommentsi + 5 };
			p = ${freeboardcommentsi + 1 };
						
			location.href = "/board/freeboarddetails/${details.NUM }?p="+ p + "&paging=" + paging;
		}
		function backpage() {
			paging = ${freeboardcommentsi - 5 };
			p = paging - 4;
			location.href = "/board/freeboarddetails/${details.NUM }?p="+ p + "&paging=" + paging;
		}
		
			function memoupdate(element) {
				var id = element.id;
				id = id.slice(id.indexOf('t') + 1);

				var memo = $("#memo" + id).val();
				location.href = "/board/commentupdate?num=${details.NUM}&commentnum="
						+ id + "&memo=" + memo+"&p=${p}+&paging=${freeboardcommentsi}";
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

			function boardDelete(element) {
				var id = element.id;
				var num = id.substring(id.indexOf('e') + 5);

				if (confirm("이 게시글을 정말로 삭제하시겠습니까?") == true) {
					location.href = "/board/freeboarddelete?num=" + num;
				} else {
					return;
				}

			}

			function deletesumit(element) {
				var id = element.id;
				var commentnum = id.substring(id.indexOf('t') + 7);

				if (confirm("이 댓글을 정말로 삭제하시겠습니까?") == true) {
					location.href = "/board/commentdelete?num=${details.NUM}&commentnum="
							+ commentnum;
				} else {
					return;
				}

			}
		</script>

		<!-- 로그인시 댓글등록창이 보이게 한다 -->
		<div align="center">
			<c:if test="${login != null }">
				<form action="/board/freeboardcomment" method="post">
							<input type="hidden" name="paging" value="${freeboardbestsizecom }">	
					<input type="hidden" name="num" value="${details.NUM }"> <input
						type="hidden" name="endpa" value="${freeboardcommentsi }">
					<input type="text" name="memo"
						style="width: 50%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px; resize: none;" />
					<input type="submit" value="등록" class="btn btn-default">
				</form>
			</c:if>

		</div>
	</div>
</div>