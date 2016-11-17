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
<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 20px">
	<div class="table-responsive">
		<div align="right">
			<select id="range" style="width: 8%; height: 33px; border: 1px solid #ccc; border-radius: 5px">
					<option>이름순</option>
					<option>방문자순</option>
					<option>거리순</option>
			</select>
		</div>
		<table class="table">
			<thead align="center">
				<tr>
					<td><label>#</label></td>
					<td><label>Name</label></td>
					<td><label>Birth Day</label></td>
					<td><label>NickName</label></td>
					<td><label>Distance(m)</label></td>
					<td><label>Visitors</label></td>
				</tr>
			</thead>
			<tbody id="tbody" align="center"></tbody>
		</table>
		<div align="center">
			<label id="page"></label>
		</div>
		<div align="center" style="border-radius: 5px">
			<select style="width: 8%; height: 33px; border: 1px solid #ccc; border-radius: 5px" id="selSearch">
				<option>이름</option>
				<option>닉네임</option>
			</select>&nbsp;&nbsp;
			<input type="text" id="search" name="search"
					style="width: 10%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Search" />&nbsp;&nbsp;
			<input type="button" class="btn btn-default" value="검색" style="width: 8%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
		</div>
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
				html += "<tr><td>"+txt[i].RNUM+"</td><td><font color='blue'><label onclick='friends(this)'>"+txt[i].NAME+"</label></font></td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].DISTANCE+"</td><td>"+txt[i].VISIT+"</td></tr>";
			}
			$("#tbody").html(html);
			html = "";
			for(var i=0; i<${size}; i++){
				html += "<a onclick='page(this)'>"+(i+1)+"</a>";
			}
			$("#page").html(html);
		});
	};
	
	function page(element){
		var page = element.innerHTML;
		$.ajax({
			"method" : "post",
			"url" : "/friends/${id}/"+$("#range").prop("value")+"/?page="+page,
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td>"+txt[i].RNUM+"</td><td><font color='blue'><label onclick='friends(this)'>"+txt[i].NAME+"</label></font></td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].DISTANCE+"</td><td>"+txt[i].VISIT+"</td></tr>";
			}
			$("#tbody").html(html);
		});
	}

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
				html += "<tr><td>"+txt[i].RNUM+"</td><td><font color='blue'><label onclick='friends(this)'>"+txt[i].NAME+"</label></font></td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].DISTANCE+"</td><td>"+txt[i].VISIT+"</td></tr>";
			}
			$("#tbody").html(html);
		});
	});
</script>