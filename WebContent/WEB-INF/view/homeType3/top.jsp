<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Navbar -->
<div class="w3-top">
	<ul class="w3-navbar w3-theme-d2 w3-left-align w3-large">
		<li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
			<a class="w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()">
				<i class="fa fa-bars"></i>
			</a>
		</li>
		<li>
			<a class="w3-padding-large w3-hover-white w3-text-white">
				<i class="glyphicon glyphicon-home w3-margin-right"></i><label onclick="menu(this)">HOME</label>
			</a>
		</li>
		<li class="w3-hide-small">
			<a class="w3-padding-large w3-hover-white w3-text-white" title="News">
				<i class="glyphicon glyphicon-comment w3-margin-right"></i><label onclick="menu(this)">BOARD</label>
			</a>
		</li>
		<li class="w3-hide-small">
			<a class="w3-padding-large w3-hover-white w3-text-white" title="Account Settings">
				<i class="glyphicon glyphicon-picture w3-margin-right"></i><label onclick="menu(this)">PICTURE</label>
			</a>
		</li>
		<li class="w3-hide-small">
			<a class="w3-padding-large w3-hover-white w3-text-white" title="Messages">
				<i class="glyphicon glyphicon-pencil w3-margin-right"></i><label onclick="menu(this)">VISITORS</label>
			</a>
		</li>
		<li class="w3-hide-small">
			<a class="w3-padding-large w3-hover-white w3-text-white" title="Notifications">
				<i class="glyphicon glyphicon-wrench w3-margin-right"></i><label onclick="menu(this)">SETTING</label>
			</a>
		</li>
		<li class="w3-hide-small w3-right">
			<a href="#" class="w3-padding-large w3-hover-white" title="My Account">
				<img src="/w3images/avatar2.png" class="w3-circle" style="height: 25px; width: 25px" alt="Avatar">
			</a>
		</li>
	</ul>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium w3-top"
	style="margin-top: 51px">
	<ul class="w3-navbar w3-left-align w3-large w3-theme">
		<li><a class="w3-padding-large" href="#">Link 1</a></li>
		<li><a class="w3-padding-large" href="#">Link 2</a></li>
		<li><a class="w3-padding-large" href="#">Link 3</a></li>
		<li><a class="w3-padding-large" href="#">My Profile</a></li>
	</ul>
</div>

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
				url = "/homepage/setting/${id}";
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