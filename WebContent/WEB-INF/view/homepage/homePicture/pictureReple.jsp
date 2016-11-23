<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<form action="/picture/reple">
	<img src="/files/${uuid }" style="width: 100px"><br /> 댓글<br />
	<textarea name="content" rows="10" cols="30"></textarea>
	<input type="button" value="댓글등록" id="btr"/><br/>
	<a href="/picture/up">사진목록</a>
</form>
<h2>댓글</h2>
<div id="reple"></div>

<script>
	$("#btr").click(function(){
		$.ajax({
			"url" : ""
		}).done(function(txt){
			$("#homeMain").html(txt);
		});
	});
</script>