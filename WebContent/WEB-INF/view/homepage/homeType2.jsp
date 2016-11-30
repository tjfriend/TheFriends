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
	
	<div class="w3-modal" style="display: none" id="profileDiv">
		<div class="w3-modal-content" style="width: 180px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="profile">
			<input type="button" class="btn btn-success" value="변경되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
		</div>
	</div>
	
	<div class="w3-modal" style="display: none" id="profileFailDiv">
		<div class="w3-modal-content" style="width: 180px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="profileFail">
			<input type="button" class="btn btn-danger" value="변경에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
		</div>
	</div>

<script>
	var music;
	var i = 0;
	window.onload = function(){
		if(${profile!=null}){
			if(${profile==true}){
				$("#profileDiv").fadeIn(300).delay(1000).fadeOut(300);
			} else {
				$("#profileFailDiv").fadeIn(300).delay(1000).fadeOut(300);
			}
			setTimeout(function(){location.href="/homepage/${id}"}, 1600);
		}
		
		$.ajax({
			"method" : "get",
			"url" : "/homepage/music/${id}",
			"async" : false
		}).done(function(txt){
			music = txt;
			nextPlay();
		});
		
		$.ajax({
			"method" : "get",
			"url" : "/friends/home/${id}",
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td><label onclick='friends(this)'>"+txt[i].NAME+"</label></td><td>"+txt[i].NICKNAME+"</td></tr>";
			}
			$("#homeBody").html(html);
		});
	};
	
	function nextPlay(){		// ajax로 db에서 해당 아이디로 저장된 음악들 가져와서 순차재생
		if(music.length>0){
			document.getElementById('player').src = "/music/"+music[i].TITLE; 
			var media = document.getElementById('player');
			media.currentTime = 0;
			media.play();
			if(i!=music.length-1){
				i = i+1;
			} else {
				i = 0;
			}
		}
	}
</script>
</body>
</html>