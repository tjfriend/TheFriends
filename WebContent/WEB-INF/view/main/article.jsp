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

<div align="center" style="min-height: 550px; margin-top: 50px; border-radius: 25px">
	<div style="height: 114px"></div>
	<div class="w3-row" style="min-height: 100%">
		<ul class="nav nav-tabs" style="width: 80%">
			<li><a data-toggle="tab" href="#recommend">Recommend</a></li>
			<li><a data-toggle="tab" href="#visits">Visits</a></li>
			<li><a data-toggle="tab" href="#contents">Contents</a></li>
			<li class="active"><a data-toggle="tab" href="#contact" id="cc">Contact Us</a></li>
		</ul>
		<div class="tab-content w3-text-grey" style="width: 80%; height: 500px">
			<div id="recommend" class="tab-pane fade" style="height: 80%">
				<h2>Recommend</h2>
				<div class="w3-container w3-row" style="height: 100%">
					<div class="w3-half" style="height: 100%">
						<img src="/image/nature1.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
					</div>
					<div class="w3-half" style="height: 100%">
						<div class="w3-row" style="height: 50%">
							<img src="/image/nature2.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
						</div>
						<div class="w3-row" style="height: 50%">
							<div class="w3-half" style="height: 100%; width: 50%">
								<img src="/image/nature3.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
							</div>
							<div class="w3-half" style="width: 50%; height: 100%">
								<div class="w3-row" style="height: 100%">
									<div class="w3-row" style="height: 50%">
										<img src="/image/nature4.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
									</div>
									<div class="w3-row" style="height: 50%">
										<img src="/image/nature5.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="visits" class="tab-pane fade" style="height: 80%">
				<h2>Visits</h2>
				<div class="w3-container w3-row" style="height: 100%">
					<div class="w3-half" style="height: 100%">
						<img src="/image/nature1.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
					</div>
					<div class="w3-half" style="height: 100%">
						<div class="w3-row" style="height: 50%">
							<img src="/image/nature2.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
						</div>
						<div class="w3-row" style="height: 50%">
							<div class="w3-half" style="height: 100%; width: 50%">
								<img src="/image/nature3.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
							</div>
							<div class="w3-half" style="width: 50%; height: 100%">
								<div class="w3-row" style="height: 100%">
									<div class="w3-row" style="height: 50%">
										<img src="/image/nature4.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
									</div>
									<div class="w3-row" style="height: 50%">
										<img src="/image/nature5.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="contents" class="tab-pane fade" style="height: 80%">
				<h2>Contents</h2>
				<div class="w3-container w3-row" style="height: 100%">
					<div class="w3-half" style="height: 100%">
						<img src="/image/nature1.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
					</div>
					<div class="w3-half" style="height: 100%">
						<div class="w3-row" style="height: 50%">
							<img src="/image/nature2.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
						</div>
						<div class="w3-row" style="height: 50%">
							<div class="w3-half" style="height: 100%; width: 50%">
								<img src="/image/nature3.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
							</div>
							<div class="w3-half" style="width: 50%; height: 100%">
								<div class="w3-row" style="height: 100%">
									<div class="w3-row" style="height: 50%">
										<img src="/image/nature4.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
									</div>
									<div class="w3-row" style="height: 50%">
										<img src="/image/nature5.jpg" style="width: 100%; height: 100%" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="contact" class="tab-pane fade in active" style="height: 80%">
				<h2>Contact Us</h2>
				<div class="w3-container w3-row" style="height: 100%">
					<div class="w3-half" style="height: 100%">
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
	</div>
</div>

<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black w3-padding-0">
	<span
		class="w3-closebtn w3-text-white w3-opacity w3-hover-opacity-off w3-xxlarge w3-container w3-display-topright"
		onclick="modalClose()">×</span>
	<div
		class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
		<img id="img01" class="w3-image">
		<p id="caption"></p>
	</div>
</div>
<hr />

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
	
	function modalClose(){
		document.getElementById("modal01").style.display = "none";
	}
</script>