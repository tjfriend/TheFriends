<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjeEPKUNUAfmGw8M1UZ-Avgdhuoey0oQo&callback=initMap"
	async defer></script>

<div class="w3-row" style="margin-top: 50px; min-height: 600px;">
	<h2>Navigation</h2>
	출발지(내주소) <input type="text" id="myhome" value="${my }" size="30" /> <br />
	찾을 친구이름 <input type="text" id="friend" list="rst" size="30" />
	<datalist id="rst" ></datalist>
	<br /> <input type="button" value="찾기" id="find" />
	<div id="map" style="min-height: 500px;"></div>
</div>
<script>
	var address;
	var name;
	$("#friend").keyup(function() {
		$.ajax({
			"url" : "/navi/find?friend=" + $("#friend").val()
		}).done(function(txt) {
			$("#rst").html(txt);
			
			$("#friend").on('input', function() {
				var con = $(this).val();
				
				
				alert(con);
				
				
				
			/*	
				$("#rst").find("option").each(function() {
					if ($(this).val() == con) {
						address = $(this).val();
						name = address.slice(0,address.indexOf(":"));
						var end = address.indexOf(":") + 1;
						address = address.slice(end);
						if (address.indexOf("(") != -1) {
							var s = address.indexOf("(");
							address = address.slice(0, s);
						}
					}
					if (address.length != 0)
						$("#friend").val(address);
				})
			*/
			})
		})
	});
			
	var dx;
	var dy;
	
	
	 $("#find").click(function(){
		$.ajax({
			"url" : "/navi/coordinate?name="+name+"&address="+address
		}).done(function(obj){
			 dx = obj.X;
			 dy = obj.Y;
			 initMap();
		})
	});  
	 
	 function initMap() {
			var chicago = {
				lat : ${x},
				lng : ${y}
			};
			var indianapolis = {
				lat : dx,
				lng : dy
			};

			var map = new google.maps.Map(document.getElementById('map'), {
				center : chicago,
				scrollwheel : true,
				zoom : 15
			});

			var directionsDisplay = new google.maps.DirectionsRenderer({
				map : map
			});

			// Set destination, origin and travel mode.
			var request = {
				destination : indianapolis,
				origin : chicago,
				travelMode : 'TRANSIT'
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

