<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	img {
	    border-radius: 40px;
	}
</style>

<!-- Push down content on small screens -->
<div class="w3-hide-large" style="margin-top: 83px"></div>

<!-- Photo grid -->
<div class="w3-row" style="margin-top: 50px">

	<div class="w3-third">
		<label style="float: left; margin-left: 5px; margin-top: 5px">The Most Recommend</label>
		<label style="float: right; margin-right: 5px; margin-top: 5px"><a href="#">More ▷</a></label>
		<img src="/image/nature1.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="A boy surrounded by beautiful nature">
		<img src="/image/nature2.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="What a beautiful scenery this sunset">
		<img src="/image/nature3.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="The Beach. Me. Alone. Beautiful">
	</div>

	<div class="w3-third">
		<label style="float: left; margin-left: 5px; margin-top: 5px">The Most Visits</label>
		<label style="float: right; margin-right: 5px; margin-top: 5px"><a href="#">More ▷</a></label>
		<img src="/image/nature4.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="Quiet day at the beach. Cold, but beautiful">
		<img src="/image/nature5.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="Waiting for the bus in the desert">
		<img src="/image/nature6.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="Nature again.. At its finest!">
	</div>

	<div class="w3-third">
		<label style="float: left; margin-left: 5px; margin-top: 5px">The Most Contents</label>
		<label style="float: right; margin-right: 5px; margin-top: 5px"><a href="#">More ▷</a></label>
		<img src="/image/nature7.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="Canoeing again">
		<img src="/image/nature8.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="A girl, and a train passing">
		<img src="/image/nature9.jpg" style="width: 100%; height: 450px" onclick="onClick(this)" alt="What a beautiful day!">
	</div>
</div>

<!-- Modal for full size images on click-->
<div id="modal01" class="w3-modal w3-black w3-padding-0"
	onclick="this.style.display='none'">
	<span
		class="w3-closebtn w3-text-white w3-opacity w3-hover-opacity-off w3-xxlarge w3-container w3-display-topright">×</span>
	<div
		class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
		<img id="img01" class="w3-image">
		<p id="caption"></p>
	</div>
</div>
<hr />

<div class="w3-row-padding">
<!-- 	<tile:insertAttribute name="footer" /> -->
	<c:import url="/WEB-INF/view/main/footer.jsp"/>
</div>
<hr />