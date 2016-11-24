<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tile" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<title>${id }'s HomePage</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body, h1, h2, h3, h4, h5 {
	font-family: "Raleway", sans-serif
}
</style>
<body class="w3-light-grey">

	<!-- w3-content defines a container for fixed size centered content,
and is wrapped around the whole page content, except for the footer in this example -->
	<div class="w3-content" style="max-width: 1200px">

	<tile:insertAttribute name="header"/>

		<!-- Grid -->
		<div class="w3-row">
			<div class="w3-col" style="width: 350px">
				<tile:insertAttribute name="left"/>
			</div>
			<div id="homeMain" class="w3-col" style="width: 800px">
				<tile:insertAttribute name="article"/>
			</div>
			<!-- END GRID -->
		</div>
		<br>

		<!-- END w3-content -->
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

