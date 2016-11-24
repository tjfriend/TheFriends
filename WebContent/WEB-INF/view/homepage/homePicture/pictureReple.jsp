<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<img src="/files/${uuid }" style="width: 100px"><br /> 댓글<br />
	<textarea name="content" id="content" rows="10" cols="30"></textarea>
	<input type="button" value="댓글등록" id="btr" onclick="reply(${num})" /><br/>
	<a href="/picture/up">사진목록</a>
	<br/>

<div id="re">

<h3>댓글</h3>

<c:forEach items="${li }" var="i">
	작성자 : ${i.WRITER } <br/>
	내용 : ${i.CONTENT } <br/>
	<hr/>
</c:forEach>
</div>
<div align="center">
	<label id="page">
		<c:forEach var="i" begin="1" end="${size }">
			<a "/picture/replyAll?p=${i }&num=${num}" id="pg">${i }</a>
		</c:forEach>
	</label>
</div>

<script>
	function reply(num){
		if($("#content").val()==""){
			$("#reply").disabled();
		}
		$.ajax({
			"method" : "get",
			"url" : "/picture/reup?num="+num+"&content="+$("#content").val()
		}).done(function(txt){
			$("#content").val("");
			$.ajax({
				"method" : "get",
				"url" : "/picture/view?num="+num+"&p="+$("#pg").val()
			}).done(function(txt){
				$("#re").html(txt);
			});
		});
	};
	
</script>