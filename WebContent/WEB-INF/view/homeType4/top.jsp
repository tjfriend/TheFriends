<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Header -->
<header class="w3-container w3-center w3-padding-32">
	<h1>
		<b>${id }</b>
	</h1>
	<div class="w3-btn-bar w3-border w3-show-inline-block">
		<a class="w3-btn" onclick="menu(this)">HOME</a>
		<a class="w3-btn" onclick="menu(this)">BOARD</a>
		<a class="w3-btn" onclick="menu(this)">PICTURE</a>
		<a class="w3-btn" onclick="menu(this)">VISITORS</a>
		<a class="w3-btn" onclick="menu(this)">SETTING</a>
	</div>
</header>

<script>
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