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

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Friends</h2>
<div class="w3-row" style="margin-top: 50px">
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Name</th>
					<th>Birth Day</th>
					<th>NickName</th>
					<th>Distance(m)</th>
					<th>Visitors</th>
					<th width="10%">
						<select id="range">
							<option>이름순</option>
							<option>방문자순</option>
							<option>거리순</option>
						</select>
					</th>
				</tr>
			</thead>
			<tbody id="tbody">
<%-- 						<c:forEach var="t" begin="0" end="${list.size()-1 }" step="1"> --%>
<!-- 							<tr> -->
<%-- 								<td>${t+1 }</td> --%>
<%-- 								<td><label onclick="friends(this)">${list.get(t).FRIEND }</label></td> --%>
<%-- 								<td>${list.get(t).BIRTH }</td> --%>
<%-- 								<td>${list.get(t).NICKNAME }</td> --%>
<%-- 								<td>${list.get(t).DISTANCE }</td> --%>
<%-- 								<td colspan="2">${list.get(t).VISIT }</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
			</tbody>
		</table>
	</div>
</div>

<script>
	window.onload = function(){
		$.ajax({
			"method" : "get",
			"url" : "/friends/${id}/이름순",
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td>"+txt[i].RNUM+"</td><td><label onclick='friends(this)'>"+txt[i].FRIEND+"</label></td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].DISTANCE+"</td><td colspan='2'>"+txt[i].VISIT+"</td></tr>";
			}
			$("#tbody").html(html);
		});
	};

	function friends(element) {
		var name = element.innerHTML;
		$.ajax({
			"method" : "get",
			"url" : "/homepage/myhome/" + name,
			"async" : false
		}).done(function(txt) {
			window.open("/homepage/" + txt, "myHome", "width=1200, height=800, left=300, top=100, resizable=no");
		});
	};
	
	$("#range").change(function(){
		var val = $("#range").prop("value");
		$.ajax({
			"method" : "get",
			"url" : "/friends/${id}/"+val,
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td>"+txt[i].RNUM+"</td><td><label onclick='friends(this)'>"+txt[i].FRIEND+"</label></td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].DISTANCE+"</td><td colspan='2'>"+txt[i].VISIT+"</td></tr>";
			}
			$("#tbody").html(html);
		});
	});
</script>