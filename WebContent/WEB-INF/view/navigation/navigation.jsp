<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjeEPKUNUAfmGw8M1UZ-Avgdhuoey0oQo&callback=initMap"
	async defer></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Navigation</h2>

<div class="w3-form" align="center">
	<label>출발지(내주소)</label>&nbsp;&nbsp;
	<input type="text" id="myhome" value="${my }" size="50px" readonly="readonly"/>&nbsp;&nbsp;
	<label>도착지(친구주소)</label>&nbsp;&nbsp;
	<input type="text" name="friend" id="friend" list="rst" size="50px" />&nbsp;&nbsp;
	<input type="button" class="btn btn-default" value="찾기" id="find" disabled="disabled"/>
	<datalist id="rst"></datalist>
</div>
<div align="center">
	<div id="map"
		style="width: 1000px; min-height: 500px; border-radius: 25px"></div>
</div>

<script>
	var name;
	var address;
	$("#friend").on("input", function() {
		$.ajax({
			"url" : "/navi/find?friend=" + $("#friend").val()
		}).done(function(txt){
			$("#rst").html(txt);
// 			$("#friend").on('input', function() {
// 				var con = $(this).val();
// 			})
		});
		
		var old = $(this).val();
    	$("#rst").find("option").each(function() {
    		if($(this).val() == old) {
    			var temp = $(this).val();
    			name = temp.slice(0, temp.indexOf(":"));
    			address = temp.slice(temp.indexOf(":")+1);
    			if(address=="비공개" || $("#myhome").val()=="비공개"){
    				$("#find").prop("disabled", "disabled");
    			} else {
    				$("#find").prop("disabled", null);
    			}
    			$("#friend").val(address);
      		}
    	});
  	});
			
	 var dx;
	 var dy;
	 $("#find").click(function(){
		$.ajax({
			"url" : "/navi/coordinate?name="+name+"&address="+address.slice(0, 5)
		}).done(function(obj){
			 dx = obj.X;
			 dy = obj.Y;
			 navi();
		})
	});  
	 
	 function initMap() {
		 	var x = ${x};
		 	var y = ${y};
	        var myLatLng = {lat: x, lng: y};

	        // Create a map object and specify the DOM element for display.
	        var map = new google.maps.Map(document.getElementById('map'), {
	          center: myLatLng,
	          scrollwheel: false,
	          zoom: 16
	        });

	        // Create a marker and set its position.
	        var marker = new google.maps.Marker({
	          map: map,
	          position: myLatLng,
	          title: 'Home'
	        });
	      }
	 
	 function navi() {
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
			
			var marker = new google.maps.Marker({
		          map: map,
		          position: chicago,
		          title: 'Home'
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

