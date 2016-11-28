<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<img src="/files/${uuid }" style="width: 100px"><br /> <br/>
	
	<br/>
	댓글<br />
	<textarea name="content" id="content" rows="5" cols="50"></textarea>
	<input type="button" value="댓글등록" id="btr" onclick="reply(${num})" /><br/>
	<a href="/picture/pictureview/{id}">사진목록</a>
	<br/>

<div id="re">

<h3>댓글</h3>
<c:forEach items="${li }" var="i">
	작성자 : ${i.WRITER } <br/>
	<br/>
	내용 
	<br/>
	<span id="con${i.REPLYNUM }" >${i.CONTENT } </span><br/>
	<c:if test="${sessionScope.id == i.WRITER }">
		<textarea id="${i.REPLYNUM }" rows="3" cols="50" style="display: none" >${i.CONTENT }</textarea>
		<br/>
		<a onclick="modify(${i.REPLYNUM })" id="mo${i.REPLYNUM }" > 수정 </a>
		<a onclick="del(${i.REPLYNUM })" > 삭제 </a>
		<a onclick="newcon(${i.REPLYNUM })" id="new${i.REPLYNUM }" style="display: none ">수정하기</a>
	</c:if>
	<hr/>
</c:forEach>
</div>
<div align="center" id="pa">
	<label id="page">
		<c:forEach var="i" begin="1" end="${size }">
			<a id="pag" onclick="pg(this)">${i }</a>
		</c:forEach>
	</label>
</div>

<script>
	function newcon(element){
		$("#mo"+element).show();
		$("#"+element).hide();
		$("#new"+element).hide();
		$("#con"+element).show();
		$("#con"+element).html($("#"+element).val());
		$.ajax({
			"url" : "/picture/modify?replynum="+element+"&content="+$("#con").html()
		}).done(function(txt){
			
		});
	};
	
	function modify(element){
		$("#mo"+element).hide();
		$("#con"+element).hide();
		$("#"+element).show();
		$("#new"+element).show();
	};

	function reply(num){
		if($("#content").val()==""){
			$("#reply").disabled();
		}
		$.ajax({
			"method" : "get",
			"url" : "/picture/reup?num="+num+"&content="+$("#content").val()
		}).done(function(txt){
			$("#content").val("");
			var url = ""
			if($("#pag").val()!=null){
				url = "/picture/view?num="+num+"&p="+$("#pag").val();
			} else {
				url = "/picture/view?num="+num;
			}
			$.ajax({
				"method" : "get",
				"url" : url
			}).done(function(txt){
				$("#re").html(txt);
			});
		});                           
	};
	
	function pg(element){
		var url = "/picture/replyAll?p="+element.innerHTML+"&num="+${num};
		$.ajax({
			"url" : url
		}).done(function(txt){
			$("#re").html(txt);
		});
	};
	
	function del(element){
		$.ajax({
			"url" : "/picture/delete?replynum="+element
		}).done(function(txt){
			alert("삭제되었습니다");
			var url = ""
			if($("#pag").val()!=null){
				url = "/picture/view?num="+${num}+"&p="+$("#pag").val();
			} else {
				url = "/picture/view?num="+${num};
			}
			$.ajax({
				"method" : "get",
				"url" : url
			}).done(function(txt){
				$("#re").html(txt);
			});
		});
	};
	

</script>