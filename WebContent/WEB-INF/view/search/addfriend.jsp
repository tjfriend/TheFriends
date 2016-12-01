<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="http://masonry.desandro.com/masonry.pkgd.js"></script>
<script src="/js/jquery.lazyload.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">

<style>
	body, h1, h2, h3, h4, h5 {
		font-family: "Raleway", sans-serif
	}
</style>

<div class="w3-light-grey w3-content w3-main" style="height: 95%">
	<h2 class="w3-text-grey" align="center">Add Friend</h2>
	<div align="center">
		<label for="point" style="width: 50%" class="w3-text-grey"><font size="3">내 아이디</font></label><br/>
		<input type="text" name="id" value="${id }" size="7" readonly="readonly" id="id"
					style="width: 50%; height: 25px; border: 1px solid #ccc; border-radius: 5px; text-align: center"/><br/>
		<label for="point" style="width: 50%" class="w3-text-grey"><font size="3">친구 아이디</font></label><br/>
		<input type="text" name="friend" value="${friend }" size="7" readonly="readonly" id="friend"
					style="width: 50%; height: 25px; border: 1px solid #ccc; border-radius: 5px; text-align: center"/><br/>
	</div>
	<div align="center">
		<input type="button" value="추가하기" id="add" class="btn btn-info"/>
		<input type="button" value="취소" id="cancel" class="btn btn-default"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="finishDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 30px" align="center" id="finish">
		<input type="button" class="btn btn-success" value="친구신청이 완료되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="failDiv">
	<div class="w3-modal-content" style="width: 150px; height: 50px; border-radius: 10px; margin-top: 30px" align="center" id="fail">
		<input type="button" class="btn btn-danger" value="친구신청에 실패하였습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	function endDiv(txt){
		$("#"+txt+"Div").fadeIn(300).delay(1000).fadeOut(300);
	}
	
	function winClose(){
		close();
	}

	$("#add").click(function(){
		var id = $("#id").val();
		var friend = $("#friend").val();
		$.ajax({
			"method" : "get",
			"url" : "/search/add/"+id+"/"+friend,
			"async" : false
		}).done(function(txt){
			if(txt==true){
				endDiv("finish");
// 				alert("친구신청이 완료되었습니다.");
			} else {
				endDiv("fail");
// 				alert("친구신청에 실패하였습니다.");
			}
			setTimeout(winClose, 1000);
		});
	});

	$("#cancel").click(function(){
		close();
	});
</script>