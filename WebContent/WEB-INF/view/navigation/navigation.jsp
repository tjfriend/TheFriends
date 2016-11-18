<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBo6EuuRTLmQWGUzlcsROBpcu1tzZAceFE&callback=initMap"
	async defer></script>
	
<div class="w3-row" style="margin-top: 50px">
	<h2>Navigation</h2>

	출발지(내주소) <input type="text" id="myhome" value="${requestScope.my }" />
	<br /> 찾을 친구이름 <input type="text" id="friend" list="rst" size="30" />
	<datalist id="rst"></datalist>
	<br /> <input type="button" value="찾기" id="find" />
</div>

<a href="javascript:move(38.897818,-77.036583)">백악관</a> | 
<a href="javascript:move(39.916968, 116.396630)">자금성</a>
<div id="map" style="height: 600;"></div>

<script>
	$("#friend").keyup(function() {
		$.ajax({
			"url" : "/navi/find?friend=" + $("#friend").val()
		}).done(function(txt) {
			$("#rst").html(txt);
			$('#friend').on('input', function() {
				var con = $(this).val();
				var str;
				$("#rst").find("option").each(function() {
					if ($(this).val() == con) {
						str = $(this).val();
						var end = str.indexOf(":")+1;
						str = str.slice(end);
						if(str.indexOf("(") != -1){
							var s = str.indexOf("(");
							str = str.slice(0,s);
						}
					}
					$("#friend").val(str);
				})
			})
		})
	});
			
	function move(x, y) {
		var t = {
			"lat" : x,
			"lng" : y
		};
		map.setCenter(t);
	}
	var map;
	function initMap() {
		// Create a map object and specify the DOM element for display.
		map = new google.maps.Map(document.getElementById("map"), {
			"center" : {
				"lat" : ${target.locX},
				"lng" : ${target.locY}
			},
		//	"mapTypeId" : "satellite",
			"scrollwheel" : false,
			"zoom" : 15
		});
		// Create a marker and set its position.
		var marker = new google.maps.Marker({
			"map" : map,
			"position" : {
				"lat" : ${target.locX},
				"lng" : ${target.locY}
			},
			"title" : "${target.location}"
		});
	/*	map.setCenter({
			"lat" : 51.324222,
			"lng" : 0
		});
		map.setZoom(7);		*/
	}		
			
</script>

