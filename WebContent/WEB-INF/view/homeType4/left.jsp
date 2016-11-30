<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Introduction menu -->
<div class="w3-col">
	<!-- About Card -->
	<div class="w3-card-2 w3-margin w3-margin-top">
		<img src="/image/nature1.jpg" style="width: 100%">
		<div class="w3-container w3-white" style="padding-top: 15px">
			<h4>
				<b>${id }</b>
			</h4>
		</div>
	</div>
	<hr>

	<!-- Posts -->
	<div class="w3-card-2 w3-margin">
		<audio controls="controls" autoplay="autoplay" id="player" onended="nextPlay()" style="width: 100%">
			<source src="/music/alert.wav">
		</audio>
	</div>
	<hr>

	<!-- Labels / tags -->
	<div class="w3-card-2 w3-margin" style="height: 160px">
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

	<!-- END Introduction Menu -->
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
</script>