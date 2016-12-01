<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="w3-container" style="max-height: 700px" align="center">
	<h3 class="w3-padding-32 w3-text-grey" align="center">HomeBoard</h3>
	<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
		<div class="table-responsive">
			<table class="table">
				<thead align="center">
					<tr>
						<td><label>#</label></td>
						<td><label>Title</label></td>
						<td><label>Content</label></td>
						<td><label>Date</label></td>
						<td><label>Count</label></td>
					</tr>
				</thead>
				<tbody id="tbody" align="center">
					<c:forEach var="homebo" items="${homeboarddata }">
						<c:if test="${homebo.ID == id }">
					<tr>
						<td><label>${homebo.RNUM }</label></td>
						<td><label><a href="/homeBoard/details/${id }/${homebo.NUM }?rnum=${homebo.RNUM }">${homebo.TITLE }</a></label></td>
						<td><label><a href="/homeBoard/details/${id }/${homebo.NUM }?rnum=${homebo.RNUM }">${homebo.CONTENT }</a></label></td>
						<td><label>${homebo.DAY }</label></td>
						<td><label>${homebo.INQUIRY }</label></td>
					</tr>
						 </c:if>
					</c:forEach>
				</tbody>
			</table>
			<div align="center">
				<label id="page"> <!-- 페이징 처리 --> <c:choose>
					<c:when test="${homebestsize >= 5 }">
						<c:forEach var="i" begin="${homeboardsize-2}" end="${homeboardsize+2 }">
							<c:choose>
								<c:when test="${param.p == i }">
									<a style="color: red;" onclick="gopage(${i})">${i }</a>
								</c:when>
								<c:otherwise>
									<a onclick="gopage(${i})">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="1" end="${homeboardsize }">
							<c:choose>
								<c:when test="${param.p == i }">
									<a style="color: red;" onclick="gopage(${i})">${i }</a>
								</c:when>
								<c:otherwise>
									<a onclick="gopage(${i})">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</label>
			<c:if test="${id == loginid }">
				<div align="right">
					<input type="button" value="글작성" id="noticeWrite" class="btn btn-default" onclick="noticeWrite()"/>
				</div>
			</c:if>
			</div>
		</div>
		<div align="center">
				<label>검색&nbsp;</label> <input type="search" name="search" id="search"
					style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px" />
				<input type="button"  value="검색" class="btn btn-default"  id="searchbt" />
		</div>
	</div>
</div>


<script>
							function gopage(element){
								$.ajax({
									"method" : "get",
									"url" : "/homeBoard/${id}?p="+element+"&search=${homeboardsearch}",
									"async" : false
								}).done(function(txt){
									$("#homeMain").html(txt);
								});
							}
							
							
					

					$("#searchbt").click(function() {
								var search = $('#search').val();
								
								$.ajax({
									"method" : "get",
									"url" : "/homeBoard/${id}?search="+search+"&p=1",
									"async" : false
								}).done(function(txt) {
									$("#homeMain").html(txt);
								});
							});
							

$("#noticeWrite").click(function(){
	window.open("/homeBoard/homeboardWrite/${id}", "picup", "width= 500px, height= 500px, left= 300, top= 100, resizable=no");
});
</script>

