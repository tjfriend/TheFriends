<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
img {
	border-radius: 25px;
}
</style>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px" align="center">Contact Us</h2>
<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px; border-radius: 25px">
	<div id="contact" style="height: 80%">
		<div class="w3-container w3-row" style="height: 100%">
			<div class="w3-half" style="height: 100%" align="center">
				<h3>오시는길</h3>
				<label>주변 지하철역</label><br/>
				<p>
				신분당선(강남)<br/>
				2호선(강남)
				</p><br/>
				<label>주변 버스정류장</label><br/>
				<p>
				강남역나라빌딩앞<br/>
				신분당선강남역 (22-009)<br/>
				강남역서초현대타워앞 (22-652)
				</p><br/>
				<label>주소</label><br/>
				<p>
				서울 강남구 강남대로84길 16 제이스타워 11, 12층<br/>
				(서울 강남구 역삼동 826-27 제이스타워 11, 12층)
				</p><br/>
				<label>Contact</label><br/>
				<span class="glyphicon glyphicon-envelope"></span> : admin@friends.com<br/>
				<span class="glyphicon glyphicon-phone"></span> : 02-3673-3200
			</div>
			<div class="w3-half" style="height: 100%">
				<div id="map" style="height: 450px; border-radius: 25px"></div>
			</div>
		</div>
	</div>
</div>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCDR-huxTUPDmTznn7No15RNAOKOW9xHoY&callback=initMap" async defer>
</script>
<script>
	function initMap() {
		// Create a map object and specify the DOM element for display.
		var map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : 37.496943,
				lng : 127.030053
// 				lat : 37.499,
// 				lng : 127.027
			},
			scrollwheel : true,
			zoom : 17,
		});
		
		// Create a marker and set its position.
	    var marker = new google.maps.Marker({
	      map: map,
	      position: {
				lat : 37.496943,
				lng : 127.030053
			},
	      title: "The Friends"
	    });
	}
</script>