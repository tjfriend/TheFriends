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

<div class="w3-text-grey" style="padding: 20px; border-radius: 5px"
	align="center">
	<h2 class="w3-padding-64">Friends</h2>
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
						<th width="10%"><select>
								<option>이름순</option>
								<option>방문자순</option>
								<option>거리순</option>
						</select></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="t" begin="0" end="${list.size()-1 }" step="1">
						<tr>
							<td>${t+1 }</td>
							<td><label id="friends">${list.get(t).NAME }</label></td>
							<td><label onclick="friends(this)">${list.get(t).NAME }</label></td>
							<td>${list.get(t).BIRTH }</td>
							<td>${list.get(t).NICKNAME }</td>
							<td>1000</td>
							<td colspan="2">100</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<script>
	function friends(element){
		var name = element.innerHTML;
		$.ajax({
			"method" : "get",
			"url" : "/homepage/myhome/"+name,
			"async" : false
		}).done(function(txt){
			window.open("/homepage/"+txt, "myHome", "width=1200, height=800, left=300, top=100, resizable=no");
		});
	}
</script>