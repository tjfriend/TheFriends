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
			<label>프로필</label>
		</div>
		<div class="w3-rest" style="padding-left: 20px; padding-right: 20px">
			<input type="button" class="btn btn-default" value="사진 선택" onclick="picChoose()"/>
		</div>
	</div><hr style="border-color: black"/>
	<div class="w3-row">
		<div class="w3-col" style="width: 250px">
			<label>디자인</label><br/>
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

<div class="w3-modal" style="display: none" id="profileDiv" align="center">
	<div class="w3-modal-content" style="width: 200px; height: 150px; border-radius: 10px" align="center">
		<form action="/settings/profile" method="post" enctype="multipart/form-data">
			<label style="width: 100px; margin-top: 30px"><font size="3">사진 선택</font></label><br/>
			<input type="file" name="profile" style="width: 200px"/><br/>
			<input type="submit" class="btn btn-default" value="변경"/>
			<input type="button" class="btn btn-default" value="취소" onclick="$('#profileDiv').fadeOut(300)"/>
		</form>
	</div>
</div>

<div class="w3-modal" style="display: none" id="delDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="del">
		<input type="button" class="btn btn-success" value="삭제되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="delFailDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="delFail">
		<input type="button" class="btn btn-danger" value="삭제에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="initDiv">
	<div class="w3-modal-content" style="width: 250px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="init">
		<input type="button" class="btn btn-success" value="해당 항목이 초기화되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="initFailDiv">
	<div class="w3-modal-content" style="width: 250px; height: 50px; border-radius: 10px; margin-top: 100px" align="center" id="initFail">
		<input type="button" class="btn btn-danger" value="초기화에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	function endDiv(txt){
		$("#"+txt+"Div").fadeIn(300).delay(1000).fadeOut(300);
	}

	function picChoose(){
		$("#profileDiv").fadeIn(300);
	}

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
				music += $("#music"+i).html()+"#";
			}
		}
		console.log(${list.size()});
		$.ajax({
			"method" : "get",
			"url" : "/settings/musicDelete/${id}?music="+music,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				endDiv("del");
			} else {
				endDiv("delFail");
			}
			setTimeout(function(){location.href="/homepage/${id}"}, 1600);
		});
		$("#deleteCo").hide();
		$("#deleteCa").hide();
		$("#delete").show();
		$(".musicCheck").hide();
		$(".musicCheck").prop("checked", false);
	});
	
	$("#initialCo").click(function(){
		var board = $("#board").prop("checked");
		var picture = $("#picture").prop("checked");
		var visitors = $("#visitors").prop("checked");
		var url = "/settings/initial/${id}?";
		var ar = [];
		if(board){
			ar.push("board=board");
		}
		if(picture){
			ar.push("picture=picture");
		}
		if(visitors){
			ar.push("visitors=visitors");
		}
		url += ar.join("&");
		$.ajax({
			"method" : "get",
			"url" : url,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				endDiv("init");
			} else {
				endDiv("initFail");
			}
			setTimeout(function(){location.href="/homepage/${id}"}, 1600);
		});
		$("#initialCo").hide();
		$("#initialCa").hide();
		$("#initial").show();
		$(".initialCheck").prop("checked", false);
		$(".initialCheck").hide();
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