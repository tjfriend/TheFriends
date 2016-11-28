<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Header -->
<header class="w3-panel w3-center w3-opacity w3-row" style="height: 400px">
	<div class="w3-col" style="width: 20%; margin-top: 130px">
		　
	</div>
	<div class="w3-col" align="center" style="width: 60%; margin-top: 130px">
		<h1>${id }</h1>
		<div class="w3-padding-32">
			<div class="w3-btn-bar w3-border w3-show-inline-block">
				<a class="w3-btn" onclick="menu(this)">HOME</a>
				<a class="w3-btn" onclick="menu(this)">BOARD</a>
				<a class="w3-btn" onclick="menu(this)">PICTURE</a>
				<a class="w3-btn" onclick="menu(this)">VISITORS</a>
				<a class="w3-btn" onclick="menu(this)">SETTING</a>
			</div>
		</div>
		<div class="w3-section w3-padding-top">
			<audio controls="controls" autoplay="autoplay" id="player" style="width: 100%"
				onended="nextPlay()">
				<source src="/music/alert.wav">
			</audio>
		</div>
	</div>
	<div class="w3-col" style="width: 20%; height: 270px; margin-top: 130px">
		<h3 align="center"><b>Friends</b></h3>
		<table class="table" style="overflow-y: auto;">
			<thead align="center">
				<tr>
					<td><label>이름</label></td>
					<td><label>닉네임</label></td>
				</tr>
			<tbody id="homeBody" align="center"></tbody>
		</table>
	</div>
</header>

<script>
	window.onload = function(){
		$.ajax({
			"method" : "get",
			"url" : "/friends/home/${id}",
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td><label onclick='friends(this)'>"+txt[i].NAME+"</label></td><td>"+txt[i].NICKNAME+"</td></tr>";
			}
			$("#homeBody").html(html);
		});
	};
	
	function menu(element){
		var menu = element.innerHTML;
		var url = "";
		switch(menu){
			case "HOME":
				url = "/homepage/home/${id}";
				break;
			case "BOARD":
				url = "/homepage/board/${id}";
				break;
			case "PICTURE":
				url = "/homepage/picture/${id}";
				break;
			case "VISITORS":
				url = "/homepage/visitors/${id}";
				break;
			case "SETTING":
				url = "/homepage/setting/${id}";
				break;
		}
		$.ajax({
			"method" : "get",
			"url" : url,
			"async" : false
		}).done(function(txt){
			$("#homeMain").html(txt);
		});
	}
	
	function friends(element) {
		var name = element.innerHTML;
		$.ajax({
			"method" : "get",
			"url" : "/homepage/myhome/" + name,
			"async" : false
		}).done(function(txt) {
			location.href = "/homepage/"+txt;
		});
	};
</script>