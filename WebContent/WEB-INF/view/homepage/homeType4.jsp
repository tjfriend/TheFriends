<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tile" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
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
	<div class="w3-content" style="max-width: 1400px">

		<!-- Header -->
		<header class="w3-container w3-center w3-padding-32">
			<h1>
				<b>MY BLOG</b>
			</h1>
			<p>
				Welcome to the blog of <span class="w3-tag">unknown</span>
			</p>
		</header>

		<!-- Grid -->
		<div class="w3-row">

			<tile:insertAttribute name="article"/>

			<tile:insertAttribute name="right"/>
			<!-- END GRID -->
		</div>
		<br>

		<!-- END w3-content -->
	</div>

</body>
</html>
