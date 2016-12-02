<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Left Column -->
<div class="w3-col">
	<!-- Profile -->
	<div class="w3-card-2 w3-round w3-white">
		<div class="w3-container">
			<h4 class="w3-center">My Profile</h4>
			<p class="w3-center">
				<c:choose>
					<c:when test="${uuid!=null }">
						<img src="/profile/${uuid }" style="width: 100%" class="w3-circle">
					</c:when>
					<c:otherwise>
						<img src="/image/profile.jpg" style="width: 100%" class="w3-circle">
					</c:otherwise>
				</c:choose>
			</p>
			<hr>
			<p>
				<i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i>
				${id }
			</p>
		</div>
	</div>
	<br>

	<!-- Music -->
	<div class="w3-card-2 w3-round">
		<audio controls="controls" autoplay="autoplay" id="player" style="width: 100%"
			onended="nextPlay()"></audio>
	</div>
	<br>

	<!-- Friends -->
	<div class="w3-card-2 w3-round w3-white w3-hide-small">
		<h3 align="center"><b>Friends</b></h3>
		<div class="w3-row w3-container" style="height: 190px">
			<div class="w3-content" style="height: 190px; overflow-y: auto;">
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
	<!-- End Left Column -->
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