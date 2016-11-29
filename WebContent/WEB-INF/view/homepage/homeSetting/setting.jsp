<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div class="w3-container" style="max-height: 700px" align="center">
	<h3 class="w3-padding-32 w3-text-grey" align="center">Setting</h3>
	<div class="w3-row">
		<div class="w3-col" style="width: 250px">
			<label>디자인</label>&nbsp;&nbsp;
			<select style="height: 25px; border: 1px solid #ccc; border-radius: 5px" id="layout">
				<option>기본</option>
				<option>사진</option>
				<option>SNS</option>
				<option>블로그</option>
			</select>
		</div>
		<div class="w3-rest" style="padding-left: 20px; padding-right: 20px">
			<img src="/image/default.png" style="border-radius: 25px; width: 100%" id="layoutImg"/><br/><br/>
			<input type="button" value="적용" id="commit" class="btn btn-default"/>
		</div>
	</div><hr style="border-color: black"/>
	<div class="w3-row">
		<table style="width: 100%">
			<thead>
				<c:if test="${list.size()!=0 }">
					<tr align="right">
						<td colspan="3">
							<input type="button" value="삭제" class="btn btn-default" id="delete"/>
							<input type="button" value="완료" class="btn btn-default" style="display: none" id="deleteCo"/>
							<input type="button" value="취소" class="btn btn-default" style="display: none" id="deleteCa"/>
						</td>
					</tr>
				</c:if>
			</thead>
			<tbody>
				<tr align="center">
					<td rowspan="${list.size()+1 }" style="width: 250px">
						<label>음악</label>
					</td>
					<td align="right" style="padding-right: 20px; width: 250px">
						<input type="checkbox" id="musicAll" class="musicCheck" style="display: none"/>
					</td>
					<c:choose>
						<c:when test="${list.size()!=0 }">
							<td align="left">
								<label>전체선택</label>
							</td>
						</c:when>
						<c:otherwise>
							<td align="left">
								<label>보유중인 음악이 없습니다.</label>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<c:if test="${list.size()!=0 }">
					<c:forEach begin="0" end="${list.size()-1 }" var="i">
						<tr>
							<td align="right" style="padding-right: 20px; width: 250px">
								<input type="checkbox" id="${i }" class="musicCheck" style="display: none"/>
							</td>
							<td align="left">
								<label id="music${i }">${list.get(i).TITLE }</label>
							</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div><hr style="border-color: black"/>
	<div class="w3-row">
		<table style="width: 100%">
			<thead>
				<tr align="right">
					<td colspan="3">
						<input type="button" value="초기화" class="btn btn-default" id="initial" />
						<input type="button" value="완료" class="btn btn-default" style="display: none" id="initialCo" />
						<input type="button" value="취소" class="btn btn-default" style="display: none" id="initialCa" />
					</td>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td rowspan="4" style="width: 250px">
						<label>초기화</label>
					</td>
					<td align="right" style="padding-right: 20px; width: 250px">
						<input type="checkbox" id="InitialAll" class="initialCheck" style="display: none"/>
					</td>
					<td align="left">
						<label>전체선택</label>
					</td>
				</tr>
				<tr>
					<td align="right" style="padding-right: 20px; width: 250px">
						<input type="checkbox" id="board" class="initialCheck" style="display: none"/>
					</td>
					<td align="left">
						<label>Board</label>
					</td>
				</tr>
				<tr>
					<td align="right" style="padding-right: 20px; width: 250px">
						<input type="checkbox" id="picture" class="initialCheck" style="display: none"/>
					</td>
					<td align="left">
						<label>Picture</label>
					</td>
				</tr>
				<tr>
					<td align="right" style="padding-right: 20px; width: 250px">
						<input type="checkbox" id="visitors" class="initialCheck" style="display: none"/>
					</td>
					<td align="left">
						<label>Visitors</label>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<script>
	$("#musicAll").change(function(){
		$(".musicCheck").prop("checked", $("#musicAll").prop("checked"));
	});
	
	$("#InitialAll").change(function(){
		$(".initialCheck").prop("checked", $("#InitialAll").prop("checked"));
	});

	$("#delete").click(function(){
		$("#delete").hide();
		$("#deleteCo").show();
		$("#deleteCa").show();
		$(".musicCheck").show();
	});
	
	$("#deleteCa").click(function(){
		$("#deleteCo").hide();
		$("#deleteCa").hide();
		$("#delete").show();
		$(".musicCheck").hide();
	});
	
	$("#initial").click(function(){
		$("#initial").hide();
		$("#initialCo").show();
		$("#initialCa").show();
		$(".initialCheck").show();
	});
	
	$("#initialCa").click(function(){
		$("#initialCo").hide();
		$("#initialCa").hide();
		$("#initial").show();
		$(".initialCheck").hide();
	});
	
	$("#deleteCo").click(function(){
		var music = "";
		for(var i=0; i<${list.size()}; i++){
			if($("#"+i).prop("checked")){
				music += $("#music"+i).html()+",";
			}
		}
		$.ajax({
			"method" : "get",
			"url" : "/settings/musicDelete/${id}?music="+music,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				alert("삭제완료");
			} else {
				alert("삭제실패");
			}
			location.reload();
		});
		$("#deleteCo").hide();
		$("#deleteCa").hide();
		$("#delete").show();
	});
	
	$("#initialCo").click(function(){
		$.ajax({
			"method" : "get",
			"url" : "",
			"async" : false
		}).done(function(txt){
			alert(txt);
		});
		$("#initialCo").hide();
		$("#initialCa").hide();
		$("#initial").show();
		$(".initialCheck").prop("checked", false);
	});

	$("#layout").change(function(){
		var layout = $("#layout").prop("value");
		switch(layout){
		case "기본":
			$("#layoutImg").prop("src", "/image/default.png");
			break;
		case "사진":
			$("#layoutImg").prop("src", "/image/picture.png");
			break;
		case "SNS":
			$("#layoutImg").prop("src", "/image/sns.png");
			break;
		case "블로그":
			$("#layoutImg").prop("src", "/image/blog.png");
			break;
		}
	});
	
	$("#commit").click(function(){
		var layout = $("#layoutImg").prop("src");
		layout = layout.substring(layout.indexOf('e')+2);
		layout = layout.substring(0, layout.indexOf('.'));
		$.ajax({
			"method" : "get",
			"url" : "/settings/${id}/"+layout,
			"async" : false
		}).done(function(){
			location.reload();
		});
	});
</script>