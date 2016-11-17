<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tile"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<title>The Friends</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}

.w3-third img {
	margin-bottom: -6px;
	opacity: 0.8;
	cursor: pointer
}

.w3-third img:hover {
	opacity: 1
}
</style>
<body class="w3-light-grey w3-content" style="max-width: 1600px">

	<!-- Sidenav/menu -->
	<nav
		class="w3-sidenav w3-white w3-center w3-text-grey w3-collapse w3-top"
		style="z-index: 3; width: 300px; font-weight: bold" id="mySidenav">
		<tile:insertAttribute name="sideNav" />
	</nav>

	<!-- Top menu on small screens -->
	<header
		class="w3-container w3-top w3-hide-large w3-white w3-xlarge w3-padding-16">
		<span class="w3-left w3-padding">The Friends</span> <a
			href="javascript:void(0)" class="w3-right w3-btn w3-white"
			onclick="w3_open()">☰</a>
	</header>

	<!-- Overlay effect when opening sidenav on small screens -->
	<div class="w3-overlay w3-hide-large w3-animate-opacity"
		onclick="w3_close()" style="cursor: pointer" title="close side menu"
		id="myOverlay"></div>

	<!-- ------------------------------End SideNav------------------------------ -->

	<!-- !PAGE CONTENT! -->
	<div class="w3-main" style="margin-left: 300px">
		<div style="min-height: 860px">
			<tile:insertAttribute name="article"/><hr/>
		</div>

	<!-- ------------------------------End Article------------------------------ -->

		<div class="w3-black w3-center">
			<tile:insertAttribute name="bottom" />
		</div>
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
	
		// Modal Image Gallery
		function onClick(element) {
			document.getElementById("img01").src = element.src;
			document.getElementById("modal01").style.display = "block";
			var captionText = document.getElementById("caption");
			captionText.innerHTML = element.alt;
		}
		
		function onClickHome(id){
// 			$.ajax({
// 				"method" : "get",
// 				"url" : "/homepage/"+id,
// 				"async" : false
// 			}).done(function(txt){
				window.open("/homepage/"+id, "myHome", "width=1200, height=800, left=300, top=100, resizable=no");
// 			});
		}
	</script>
</body>
</html>