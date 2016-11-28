<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
body,h1,h2,h3,h4,h5,h6 {padding:20px}
#food { margin:20px}
</style>
<body>
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">
	<h2 class="w3-padding-64 w3-text-grey" align="center">Picture</h2>
	<c:if test="${sessionScope.id == id }">
		<input type="button" value="등록" id="add" />
	</c:if>
	<div class="w3-row-padding w3-padding-16 w3-center" id="food">
	<c:choose>
	<c:when test="${li != 'null' }">
		<c:forEach items="${li }" var="i">
			<div class="w3-quarter">
			<c:choose>
			<c:when test="${i.OPEN == 'all'}">
			제목 : ${i.TITLE } 
				<br />
				공개설정 : ${i.OPEN }
				<br />
				<a id="reple" onclick="re(this)" accesskey="${i.UUID }"	class="${i.NUM }"> 
				<img src="/files/${i.UUID }"style="width: 200px; height: 300px" />
				<h3>${i.TITLE}</h3> 
				<br />
				</a>
				조회수 : ${i.COUNT }
				<br />
				<input type="button" value="좋아요" onclick="goods(${i.NUM })"/> <span id="ss${i.NUM }"> ${i.GOOD } </span>
				<br/>
				<p>${i.CONTENT}</p>
				<br/>
			</c:when>
			<c:when test="${i.OPEN == 'none' and id == sessionScope.id }">
				<h3>${i.TITLE}</h3> 
				<br />
				공개설정 : ${i.OPEN }
				<br />
					<a id="reple" onclick="re(this)" accesskey="${i.UUID }"
						class="${i.NUM }"> <img src="/files/${i.UUID }"style="width: 200px; height: 300px" />
				<br />
					</a>
				조회수 : ${i.COUNT }
				<br />
					<input type="button" value="좋아요" onclick="goods(${i.NUM })"/> <span id="ss${i.NUM }"> ${i.GOOD } </span>
				<br />
				${i.CONTENT } 
				<br />
			</c:when>
			<c:when test="${i.OPEN=='friend' and (friend == true || id == sessionScope.id )}">
				<h3>${i.TITLE}</h3> 
				<br />
				공개설정 : ${i.OPEN }
				<br />
					<a id="reple" onclick="re(this)" accesskey="${i.UUID }"
						class="${i.NUM }"> <img src="/files/${i.UUID }"style="width: 200px; height: 300px" /><br />
					</a>
				조회수 : ${i.COUNT } <br />
				<input type="button" value="좋아요" onclick="goods(${i.NUM })" /> : <span id="ss${i.NUM }"> ${i.GOOD } </span>
				<br />
				${i.CONTENT } 
				<br />
			</c:when>
			<c:otherwise>
					해당 항목은 열람권한이 없습니다.
			</c:otherwise>
			</c:choose>
		</div>
		</c:forEach>
	</c:when>
	</c:choose>
</div>
<div class="w3-center w3-padding-32">
    <ul class="w3-pagination">
    <c:forEach var="i" begin="1" end="${size }">
      <li><a class="w3-black" onclick="pg(this)">${i }</a></li>
      <c:if test="${i>1 }">
      <li><a class="w3-hover-black" onclick="pg(this)">${i }</a></li>
      </c:if>
	</c:forEach>
    </ul>
  </div>
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
	
	function goods(num){
		$.ajax({
			"url" : "/picture/good?num="+num
		}).done(function(txt){
			$("#ss"+num).html(txt);
		});
	};
	
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
	};
</script>
</body>