<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<title>The Friends</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<style>
body,h1,h2,h5 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
	background-image: url('/image/mainImage.png');
    min-height: 100%;
    background-position: center;
    background-size: cover;
}
</style>
<body>

<div class="bgimg w3-display-container">
  <div class="w3-display-topleft w3-padding-jumbo w3-xlarge">
    <p><button onclick="goMain()" style="width: 100px; border-radius: 15px; background-color: white" class="btn btn-default">Main</button></p>
    <p><button onclick="goJoin()" style="width: 100px; border-radius: 15px; background-color: white" class="btn btn-default">Join</button></p>
  </div>
  <div class="w3-display-bottomright w3-padding-jumbo">
    <h3><b><font style="color: yellow">Copyrighted by <font style="color: blue">&copy;The Friends</font> Corp.</font> <font style="color: black">copyright since 13 Nov. 2016</font></b></h3>
  </div>
</div>

<script>
	function goMain(){
		location.href="/index";
	}
	
	function goJoin(){
		location.href="/join";
	}
</script>

</body>
</html>