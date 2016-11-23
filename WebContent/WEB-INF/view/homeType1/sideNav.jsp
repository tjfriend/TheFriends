<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<br>
<a href="#" onclick="w3_close()"
	class="w3-hide-large w3-right w3-padding" title="close menu" style="height: 30px">
	<i class="fa fa-remove"></i>
</a>
<div class="w3-container" style="height: 170px">
	<div class="w3-content" style="heidht: 60%">
		<img src="/image/nature1.jpg" style="width: 100%;" class="w3-round"><br>
	</div>
	<br/>
	<h4 class="w3-padding-0" align="center">
		<b>${id }</b>
	</h4>
</div>
<a class="w3-padding w3-text-teal">
	<i class="glyphicon glyphicon-home w3-margin-right"></i><label onclick="menu(this)">HOME</label>
</a>
<a class="w3-padding">
	<i class="glyphicon glyphicon-comment w3-margin-right"></i><label onclick="menu(this)">BOARD</label>
</a>
<a class="w3-padding">
	<i class="glyphicon glyphicon-picture w3-margin-right"></i><label onclick="menu(this)">PICTURE</label>
</a>
<a class="w3-padding">
	<i class="glyphicon glyphicon-pencil w3-margin-right"></i><label onclick="menu(this)">VISITORS</label>
</a>
<a class="w3-padding">
	<i class="glyphicon glyphicon-wrench w3-margin-right"></i><label onclick="menu(this)">SETTING</label>
</a>

<div class="w3-section w3-padding-top">
	<audio controls="controls" autoplay="autoplay" id="player" style="width: 100%"
		onended="nextPlay()">
		<source src="/music/alert.wav">
	</audio>
</div>

<div class="w3-section">
	<h3 align="center"><b>Friends</b></h3>
	<div class="w3-row w3-container" style="height: 150px">
		<div class="w3-content" style="height: 150px; overflow-y: auto;">
			<table class="table">
				<thead align="center">
					<tr>
						<td><label>이름</label></td>
						<td><label>닉네임</label></td>
					</tr>
				</thead>
				<tbody id="homeBody" align="center"></tbody>
			</table>
		</div>
	</div>
</div>

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
				url = "/homepage/home/${id}";
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
</script>