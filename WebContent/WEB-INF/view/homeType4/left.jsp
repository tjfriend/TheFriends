<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Introduction menu -->
<div class="w3-col">
	<!-- About Card -->
	<div class="w3-card-2 w3-margin w3-margin-top">
		<c:choose>
			<c:when test="${uuid!=null }">
				<img src="/profile/${uuid }" style="width: 100%">
			</c:when>
			<c:otherwise>
				<img src="/image/profile.jpg" style="width: 100%">
			</c:otherwise>
		</c:choose>
		<div class="w3-container w3-white" style="padding-top: 15px">
			<h4>
				<b>${id }</b>
			</h4>
		</div>
	</div>
	<hr>

	<!-- Posts -->
	<div class="w3-card-2 w3-margin">
		<audio controls="controls" autoplay="autoplay" id="player" onended="nextPlay()" style="width: 100%"></audio>
	</div>
	<hr>

	<!-- Labels / tags -->
	<h3 align="center"><b>Friends</b></h3>
	<div class="w3-card-2 w3-margin" style="height: 170px">
		<table class="table" style="overflow-y: auto; height: 170px">
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