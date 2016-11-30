<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<h2 class="w3-padding-64 w3-text-grey" style="margin-top: 50px"
	align="center">Friends</h2>
<div class="w3-row" style="padding-left: 30px; padding-right: 30px; padding-top: 40px">
	<ul class=" nav nav-tabs">
		<li class="active"><a data-toggle="tab" href="#friends">친구</a></li>
		<li><a data-toggle="tab" href="#add">친구요청</a></li>
	</ul>
	<div class="tab-content">
		<div class="tab-pane fade in active" id="friends">
			<div class="table-responsive">
				<div align="right" style="margin-right: 50px">
					<select id="range" style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
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
			</div>
		</div>
		<div class="tab-pane fade" id="add">
			<div class="table-responsive">
				<div align="right" style="margin-right: 50px">
					<select id="addRange" style="width: 7%; height: 25px; border: 1px solid #ccc; border-radius: 5px">
						<option>이름순</option>
						<option>방문자순</option>
						<option>날짜순</option>
					</select>
				</div>
				<table class="table">
					<thead align="center">
						<tr>
							<td><label>#</label></td>
							<td><label>Name</label></td>
							<td><label>Birth Day</label></td>
							<td><label>NickName</label></td>
							<td><label>Visitors</label></td>
							<td><label>Date</label></td>
							<td><label>Accept / Refuse</label>
						</tr>
					</thead>
					<tbody id="addBody" align="center"></tbody>
				</table>
				<div align="center">
					<label id="addPage"></label>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="w3-modal" style="display: none" id="acceptDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="accept">
		<input type="button" class="btn btn-success" value="수락하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="rejectDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="reject">
		<input type="button" class="btn btn-danger" value="거절하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	function endDiv(txt){
		$("#"+txt+"Div").fadeIn(300).delay(1000).fadeOut(300);
	}
	
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
				html += "<label><a onclick='page(this)'>"+(i+1)+"</label></a>";
			}
			$("#page").html(html);
		});
		$.ajax({
			"method" : "get",
			"url" : "/friends/request/${id}/이름순",
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td>"+txt[i].RNUM+"</td><td id='"+i+"'>"+txt[i].NAME+"</td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].VISIT+"</td><td>"+txt[i].ADDDATE+"</td>";
				html += "<td><input type='button' class='btn btn-info' value='Accept' onclick='accept("+i+")'/>&nbsp;&nbsp;";
				html += "<input type='button' class='btn btn-danger' value='Refuse' onclick='refuse("+i+")'/></tr>";
			}
			$("#addBody").html(html);
			html = "";
			for(var i=0; i<${size}; i++){
				html += "<label><a onclick='addPage(this)'>"+(i+1)+"</a></label>";
			}
			$("#addPage").html(html);
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
	
	function addPage(element){
		var page = element.innerHTML;
		$.ajax({
			"method" : "post",
			"url" : "/friends/request/${id}/"+$("#addRange").prop("value")+"/?page="+page,
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td>"+txt[i].RNUM+"</td><td id='"+i+"'>"+txt[i].NAME+"</td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].VISIT+"</td><td>"+txt[i].ADDDATE+"</td>";
				html += "<td><input type='button' class='btn btn-info' value='Accept' onclick='accept("+i+")'/>&nbsp;&nbsp;";
				html += "<input type='button' class='btn btn-danger' value='Reject' onclick='refuse("+i+")'/></tr>";
			}
			$("#addBody").html(html);
		});
	}

	function friends(element) {
		var name = element.innerHTML;
		$.ajax({
			"method" : "get",
			"url" : "/homepage/myhome/" + name,
			"async" : false
		}).done(function(txt) {
			window.open("/homepage/" + txt, "myHome", "width=1200, height=700, left=300, top=100, resizable=no");
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
	
	$("#addRange").change(function(){
		var val = $("#addRange").prop("value");
		$.ajax({
			"method" : "get",
			"url" : "/friends/request/${id}/"+val,
			"async" : false
		}).done(function(txt){
			var html = "";
			for(var i=0; i<txt.length; i++){
				html += "<tr><td>"+txt[i].RNUM+"</td><td id='"+i+"'>"+txt[i].NAME+"</td><td>"+txt[i].BIRTH+"</td>";
				html += "<td>"+txt[i].NICKNAME+"</td><td>"+txt[i].VISIT+"</td><td>"+txt[i].ADDDATE+"</td>";
				html += "<td><input type='button' class='btn btn-info' value='Accept' onclick='accept("+i+")'/>&nbsp;&nbsp;";
				html += "<input type='button' class='btn btn-danger' value='Refuse' onclick='refuse("+i+")'/></tr>";
			}
			$("#addBody").html(html);
		});
	});
	
	function accept(txt){
		var name = "";
		for(var i=0; i<10; i++){
			if(txt==i){
				name = $("#"+i).html();
				break;
			}
		}
		$.ajax({
			"method" : "get",
			"url" : "/friends/accept/"+name,
			"async" : false
		}).done(function(txt){
			if(txt==true){
// 				alert("수락되었습니다.");
				endDiv("accept");
				setTimeout(function(){location.href="/friends/${id}"}, 1600);
			}
		});
	}
	
	function refuse(txt){
		var name = "";
		for(var i=0; i<10; i++){
			if(txt == i){
				name = $("#"+i).html();
				break;
			}
		}
		$.ajax({
			"method" : "get",
			"url" : "/friends/refuse/"+name,
			"async" : false
		}).done(function(txt){
			if(txt == true){
// 				alert("거절되었습니다.");
				endDiv("reject");
				setTimeout(function(){location.href="/friends/${id}"}, 1600);
			}
		});
	}
</script>