<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tile" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<title>${id }'s HomePage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<style>
body, h1, h2, h3, h4, h5, h6 {
	font-family: "Raleway", sans-serif
}

.w3-sidenav a, .w3-sidenav h4 {
	font-weight: bold
}
</style>
<body class="w3-light-grey w3-content" style="max-width: 1200px">

	<!-- Sidenav/menu -->
	<nav class="w3-sidenav w3-collapse w3-white"
		style="z-index: 3; width: 300px;" id="mySidenav">
		<tile:insertAttribute name="sideNav" />
	</nav>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px" id="homeMain">

		<tile:insertAttribute name="article" />
		<!-- End page content -->
	</div>

	<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

function nextPlay(){		// ajax로 db에서 해당 아이디로 저장된 음악들 가져와서 순차재생
	document.getElementById('player').src = "/music/mozart.mp3"; 
	var media = document.getElementById('player');
	media.currentTime = 0;
	media.play();
}
</script>

</body>
</html>

