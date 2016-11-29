<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://masonry.desandro.com/masonry.pkgd.js"></script>
<script>
	$(".grid").masonry({
		itemSelector: ".grid-item",
		columnWidth: ".grid-sizer",
		percentPosition: true
	});
	$(function(){
		$('img.item').lazyload({
			threshold : 200
		});
	});
</script>

<style>
	.grid-item-reply{
		float: left;
		width: 20%;
		height: 100px;
	}
	.grid-sizer, .grid-item{
		float: left;
		width: 20%;
		height: 100px;
		border: 2px solid hsla(0, 0%, 0%, 0.5);
		border-radius: 15px;
		margin-top: 40px;
		margin-left: 5px;
		margin-right: 5px;
	}
	.grid-item-width2{
		width: 40%;
	}
	.grid-item-height2{
		height: 200px;
	}
	.grid-item-gigante{
		width: 35%;
		height: 200px;
		margin-bottom: 60px;
		margin-top: 40px;
	}
</style>

<div class="w3-container" align="center">
	<h3 class="w3-padding-32 w3-text-grey" align="center">Picture</h3>
	<div align="right">
		<c:if test="${sessionScope.id == id }">
			<input type="button" value="등록" id="add" class="btn btn-default"/>
		</c:if>
	</div>
	<div class="grid">
		<c:forEach var="t" items="${list }">
			<div class="grid-item" id="grid-item${t.NUM }">
				<img src="/files/${t.UUID }" style="width: 100%; height: 100%; border-radius: 15px" class="item" id="item${t.NUM }" onclick="grid(this)"/><br/><br/>
				<div class="w3-row" style="display: none" id="span${t.NUM }">
					<div class="w3-col" style="width: 90%">
						<label>${t.TITLE }</label>&nbsp;&nbsp;
					</div>
					<div class="w3-col" style="width: 10%">
						<b class="glyphicon glyphicon-thumbs-up" onclick="good(this)" id="good${t.NUM }">${t.GOOD }</b>
					</div>
				</div>
				<input type="text" placeholder="댓글" id="text${t.NUM }" hidden="hidden" style="width: 55%;  height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
				<input type="button" class="btn btn-default" value="등록" style="width: 20%; display: none" id="submit${t.NUM }" onclick="submit(this)"/>
				<input type="button" class="btn btn-default" value="댓글" style="width: 20%; display: none" id="reply${t.NUM }" onclick="reply(this)"/>
			</div>
		</c:forEach>
	</div>
</div>

<div class="w3-modal" style="display: none" id="replyDiv">
	<div class="w3-modal-content w3-animate-zoom" style="width: 70%; height: 70%">
		<header class="w3-container w3-teal"> 
			<span onclick="document.getElementById('replyDiv').style.display='none'" class="w3-closebtn">&times;</span>
			<h3 align="center">Reply</h3>
		</header>
		<div class="w3-container w3-padding-32" style="height: 80%; overflow-y: auto" id="replyComment"></div>
	</div>
</div>

<div class="w3-modal" style="display: none" id="upload">
	<div class="w3-modal-content w3-animate-top" style="width: 20%; height: 20%" align="center" id="uploadDiv">
		<span onclick="document.getElementById('replyDiv').style.display='none'" class="w3-closebtn">&times;</span>
	</div>
</div>

<script>
	window.onload = function(){
		if(${a==1}){
			$("#uploadDiv").html($("#uploadDiv").html()+"<h3>업로드 성공</h3>");
			$("#upload").show();
		} else if(${a==0}){
			$("#uploadDiv").html($("#uploadDiv").html()+"<h3>업로드 실패</h3>");
			$("#upload").show();
		}
		window.close();
	}
	
	function good(element){
		var id = element.id;
		id = id.slice(id.indexOf('d')+1);
		$.ajax({
			"method" : "get",
			"url" : "/picture/good?num="+id,
			"async" : false
		}).done(function(txt){
			$("#good"+id).html(txt);
		});
	}
	
	function submit(element){
		var id = element.id;
		id = id.slice(id.indexOf('t')+1);
		$.ajax({
			"method" : "get",
			"url" : "/picture/reup?num="+id+"&content="+$("#text"+id).val(),
			"async" : false
		}).done(function(txt){
			if(txt=="1"){
				$("#item"+id).trigger("click");
			}
		});
	}

	function reply(element){
		var id = element.id;
		id = id.slice(id.indexOf('y')+1);
		var url = "/picture/replyAll?num="+id;
		$.ajax({
			"method" : "get",
			"url" : url,
			"async" : false
		}).done(function(txt){
			$("#replyComment").html(txt);
		});
		$("#replyDiv").show();
	}

	function grid(element){
		var id = element.id;
		id = id.slice(id.indexOf('m')+1);
		$("#grid-item"+id).toggleClass("grid-item-gigante");
		if($("#text"+id).prop("hidden")){
			$("#text"+id).prop("hidden", null);
			$("#submit"+id).show();
			$("#reply"+id).show();
			$("#span"+id).show()
		} else {
			$("#text"+id).prop("hidden", "hidden");
			$("#text"+id).val("");
			$("#submit"+id).hide();
			$("#reply"+id).hide();
			$("#span"+id).hide();
		}
		$(".grid").marsonry();
	};
	
	$("#add").click(function(){
		window.open("/picture/up/${id}", "picup", "width= 500px, height= 500px");
	});
</script>