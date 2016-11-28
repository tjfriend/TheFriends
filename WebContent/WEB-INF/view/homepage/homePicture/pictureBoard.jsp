<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<div class="w3-container" style="max-height: 700px;" align="center">
	<c:if test="${sessionScope.id == id }">
	<input type="button" value="등록" id="add"/>
	</c:if>
	<h2>사진첩</h2>
	<c:choose>
		<c:when test="${li != 'null' }">
			<c:forEach items="${li }" var="i">
				제목 : ${i.TITLE } <br />
				공개설정 : ${i.OPEN }
				<br />
				<a id="reple" onclick="re(this)" accesskey="${i.UUID }" class="${i.NUM }">
				<img src="/files/${i.UUID }" style="width: 100px" /><br/>
				</a>
				조회수 : ${i.COUNT } <br/>
				<input type="button" value="좋아요" onclick="goodss(${i.NUM })" id="good${i.NUM }"/> ${i.GOOD }
				<br/>${i.CONTENT } <br />
				<br />
			</c:forEach>
		</c:when>
		<c:otherwise>
			사진이 없습니다
		</c:otherwise>
</c:choose>
	<c:forEach var="i" begin="1" end="${size }">
			<a id="page" onclick="pg(this)">${i }</a>
	</c:forEach>
</div>
<script>
	
	window.onload = function(){
		if(${a==1}){
			alert("업로드 성공");
			window.close();
		} else {
			alert("업로드 실패");
			window.close();
		}
	};
	
// 	function goodss(element){
// 		var num = $("#good"+element).indexOf("d");
// 		alert(num);
// 		$.ajax({
// 			"url" : "/picture/good?num="+${num}
// 		}).done(function(txt){
			
// 		});
// 	};
	
	function pg(element){
		var url  = "/picture/pictureview/${id}?p="+element.innerHTML;
		$.ajax({
			"url" : url
		}).done(function(txt){
			$("#homeMain").html(txt);
		});
	};

	$("#add").click(function(){
		window.open("/picture/up/${id}", "picup", "width: 5px, height: 5px");
	});
	
	
	function re(element){
		var url = "/picture/reple?uuid="+$(element).attr("accesskey")+"&num="+$(element).attr("class");
		$.ajax({
			"url" : url 
		}).done(function(txt){
			$("#homeMain").html(txt);
		});		
	}
	
</script>