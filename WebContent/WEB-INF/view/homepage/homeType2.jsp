<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tile" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<title>${id }'s HomePage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/image/logo.ico"/>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body, h1 {
	font-family: "Raleway", Arial, sans-serif
}

h1 {
	letter-spacing: 6px
}

.w3-row-padding img {
	margin-bottom: 12px
}
</style>
<body>
	
	<tile:insertAttribute name="header"/>

	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 1200px" id="homeMain">

		<tile:insertAttribute name="article"/>
		<!-- End Page Content -->
	</div>

<script>
	function nextPlay(){		// ajax로 db에서 해당 아이디로 저장된 음악들 가져와서 순차재생
		document.getElementById('player').src = "/music/mozart.mp3"; 
		var media = document.getElementById('player');
		media.currentTime = 0;
		media.play();
	}
</script>
</body>
</html>