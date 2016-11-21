<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
img {
	border-radius: 25px;
}
</style>

<div align="center" style="min-height: 900px; margin-top: 50px; border-radius: 25px">
	<div class="w3-row" style="min-height: 100%">
		<ul class="nav nav-tabs" style="width: 80%">
			<li class="active"><a data-toggle="tab" href="#recommend">Recommend</a></li>
			<li><a data-toggle="tab" href="#visits">Visits</a></li>
			<li><a data-toggle="tab" href="#contents">Contents</a></li>
			<li><a data-toggle="tab" href="#contact">Contact Us</a></li>
		</ul>
		<div class="tab-content w3-text-grey" style="width: 80%; height: 800px">
			<div id="recommend" class="tab-pane fade in active" style="height: 700px">
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
				<table style="width: 90%; height: 90%">
					<tr>
						<td rowspan="3" style="width: 50%; background-color: blue">aaaa</td>
						<td colspan="2" style="height: 50%; background-color: red">bbbb</td>
					</tr>
					<tr>
						<td rowspan="2" style="background-color: green">cccc</td>
						<td style="background-color: grey">dddd</td>
					</tr>
					<tr>
						<td style="background-color: aqua">eeee</td>
					</tr>
				</table>
			</div>
			<div id="contents" class="tab-pane fade" style="height: 80%">
				<h2>Contents</h2>
			</div>
			<div id="contact" class="tab-pane fade" style="height: 80%">
				<h2>Contact Us</h2>
			</div>
		</div>
	</div>
</div>

<!-- Photo grid -->
<!-- <div class="w3-row" style="margin-top: 20px">

	<div class="w3-third">
		<label style="float: left; margin-left: 5px; margin-top: 5px">The
			Most Recommend</label> <label
			style="float: right; margin-right: 5px; margin-top: 5px"><a
			href="#">More ▷</a></label> <img src="/image/nature1.jpg"
			style="width: 100%; height: 450px" onclick="onClick(this)"
			alt="A boy surrounded by beautiful nature"> <img
			src="/image/nature2.jpg" style="width: 100%; height: 450px"
			onclick="onClick(this)" alt="What a beautiful scenery this sunset">
		<img src="/image/nature3.jpg" style="width: 100%; height: 450px"
			onclick="onClick(this)" alt="The Beach. Me. Alone. Beautiful">
	</div>

	<div class="w3-third">
		<label style="float: left; margin-left: 5px; margin-top: 5px">The
			Most Visits</label> <label
			style="float: right; margin-right: 5px; margin-top: 5px"><a
			href="#">More ▷</a></label> <img src="/image/nature4.jpg"
			style="width: 100%; height: 450px" onclick="onClick(this)"
			alt="Quiet day at the beach. Cold, but beautiful"> <img
			src="/image/nature5.jpg" style="width: 100%; height: 450px"
			onclick="onClick(this)" alt="Waiting for the bus in the desert">
		<img src="/image/nature6.jpg" style="width: 100%; height: 450px"
			onclick="onClick(this)" alt="Nature again.. At its finest!">
	</div>

	<div class="w3-third">
		<label style="float: left; margin-left: 5px; margin-top: 5px">The
			Most Contents</label> <label
			style="float: right; margin-right: 5px; margin-top: 5px"><a
			href="#">More ▷</a></label> <img src="/image/nature7.jpg"
			style="width: 100%; height: 450px" onclick="onClick(this)"
			alt="Canoeing again"> <img src="/image/nature8.jpg"
			style="width: 100%; height: 450px" onclick="onClick(this)"
			alt="A girl, and a train passing"> <img
			src="/image/nature9.jpg" style="width: 100%; height: 450px"
			onclick="onClick(this)" alt="What a beautiful day!">
	</div>
</div> -->

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

<div class="w3-row-padding">
	<!-- 	<tile:insertAttribute name="footer" /> -->
	<c:import url="/WEB-INF/view/main/footer.jsp" />
</div>
<hr />

<script>
	function modalClose(){
		document.getElementById("modal01").style.display = "none";
	}
</script>