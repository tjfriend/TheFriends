<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<br>
<div class="w3-container">
	<a href="#" onclick="w3_close()"
		class="w3-hide-large w3-right w3-jumbo w3-padding" title="close menu">
		<i class="fa fa-remove"></i>
	</a> <img src="/image/nature1.jpg" style="width: 100%;" class="w3-round"><br>
	<br>
	<h4 class="w3-padding-0">
		<b>${id }</b>
	</h4>
</div>
<a href="#portfolio" onclick="w3_close()"
	class="w3-padding w3-text-teal"> <i
	class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO
</a>
<a href="#about" onclick="w3_close()" class="w3-padding"> <i
	class="fa fa-user fa-fw w3-margin-right"></i>ABOUT
</a>
<a href="#contact" onclick="w3_close()" class="w3-padding"> <i
	class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT
</a>

<div class="w3-section w3-padding-top w3-large">
	<a href="#"
		class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i
		class="fa fa-facebook-official"></i></a> <a href="#"
		class="w3-hover-white w3-hover-text-purple w3-show-inline-block"><i
		class="fa fa-instagram"></i></a> <a href="#"
		class="w3-hover-white w3-hover-text-yellow w3-show-inline-block"><i
		class="fa fa-snapchat"></i></a> <a href="#"
		class="w3-hover-white w3-hover-text-red w3-show-inline-block"><i
		class="fa fa-pinterest-p"></i></a> <a href="#"
		class="w3-hover-white w3-hover-text-light-blue w3-show-inline-block"><i
		class="fa fa-twitter"></i></a> <a href="#"
		class="w3-hover-white w3-hover-text-indigo w3-show-inline-block"><i
		class="fa fa-linkedin"></i></a>
</div>
<div class="w3-section w3-padding-top">
	<audio controls="controls" autoplay="autoplay" id="player"
		onended="nextPlay()">
		<source src="/music/alert.wav">
	</audio>
</div>