<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjeEPKUNUAfmGw8M1UZ-Avgdhuoey0oQo&callback=initMap"
	async defer></script>


<h2>Navigation</h2>
lat : ${location.lat}
<br />
lng : ${location.lng}
<div id="map" style="min-height: 500px;"></div>

<script>
	function initMap() {
		var chicago = {
			lat : 41.85,
			lng : -87.65
		};
		var indianapolis = {
			lat : 39.79,
			lng : -86.14
		};

		var map = new google.maps.Map(document.getElementById('map'), {
			center : chicago,
			scrollwheel : true,
			zoom : 7
		});

		var directionsDisplay = new google.maps.DirectionsRenderer({
			map : map
		});

		// Set destination, origin and travel mode.
		var request = {
			destination : indianapolis,
			origin : chicago,
			travelMode : 'DRIVING'
		};

		// Pass the directions request to the directions service.
		var directionsService = new google.maps.DirectionsService();
		directionsService.route(request, function(response, status) {
			if (status == 'OK') {
				// Display the route on the map.
				directionsDisplay.setDirections(response);
			}
		});
	}
</script>