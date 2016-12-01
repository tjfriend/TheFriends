<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<br>
<h3 class="w3-padding-64">
	<label onclick="goMain()"><b>The<br>Friends</b></label>
</h3>
<c:choose>
	<c:when test="${login == null }">
		<form action="/member/login" method="post">
			<div class="form-group" align="center">
				<label for="id">ID:</label>
				<c:choose>
					<c:when test="${remember != null }">
						<input type="text" class="form-control" id="id" style="width: 50%" name="id" value=${remember }>
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control" id="id" style="width: 50%" name="id">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="form-group" align="center">
				<label for="password">Password:</label> <input type="password"
					class="form-control" id="password" style="width: 50%" name="password">
			</div>
			<div class="checkbox">
				<label><input type="checkbox" name="remember">
					Remember me</label>
			</div>
			<button type="button" class="btn btn-default" onclick="loginMenu(this)" value="join">Join</button>
			&nbsp;
			<button type="submit" class="btn btn-default">Submit</button><br/>
			<c:if test="${fail != null }">
				<br/>
					<div class="alert alert-danger" style="margin-left: 5px; margin-right: 5px">
						<strong>Login Failed!</strong><br/> Please check your 'ID' or 'PASSWORD'
					</div>
			</c:if>
		</form>
		<hr />
	</c:when>
	<c:otherwise>
		<form action="/member/logout">
			<div class="form-group" align="center">
				${id } 님 안녕하세요!
			</div>
			<div class="form-group" align="center">
				보유 밤 :
				${point } 밤
			</div>
			<br />
			<button type="button" class="btn btn-default"onclick="javascript:Passcertification()" value="myinfo">My Info</button>
			&nbsp;
			<button type="button" class="btn btn-default" onclick="loginMenu(this)" value="myhome">My Home</button>
			<br />
			<br />
			<button type="button" class="btn btn-default" onclick="loginMenu(this)" value="friends">Friends</button>
			&nbsp;
			<button type="button" class="btn btn-default" onclick="loginMenu(this)" value="charge">Charge</button>
			&nbsp;
			<button type="submit" class="btn btn-default">Logout</button>
		</form>
		<hr />
	</c:otherwise>
</c:choose>
<a href="javascript:void(0)" onclick="w3_close()"
	class="w3-padding w3-hide-large">CLOSE</a>
<a href="/index" onclick="w3_close()" class="w3-padding">Home</a>
<a href="/notice/list" onclick="w3_close()" class="w3-padding">Notice</a>
<a href="/event/list" onclick="w3_close()" class="w3-padding">Event</a>
<a href="/search" onclick="w3_close()" class="w3-padding">Search</a>
<a href="/navigation" onclick="w3_close()" class="w3-padding">Navigation</a>
<a href="/board/list?p=1" onclick="w3_close()" class="w3-padding">Free Board</a>
<a href="/shop/list?p=1" onclick="w3_close()" class="w3-padding">Shop</a>
<a href="/qna/list?p=1" onclick="w3_close()" class="w3-padding">QnA</a>

<div class="w3-modal" style="display: none;" id="infoDiv">
	<div class="w3-modal-content" style="width: 400px; height: 150px; border-radius: 10px; padding-top: 5px" align="center" id="info">
		<span onclick="$('#infoDiv').hide()" class="w3-closebtn" style="margin-right: 15px">&times;</span>
		<h3>My Info</h3>
		<p>개인정보 보호를 위해 비밀번호를 입력해주세요.</p>
		<input type="password" id="password" placeholder="비밀번호" style="width: 100px; height: 30px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"/>
		<input type="button" class="btn btn-success" value="확인" style="width: 100px; height: 30px" id="submit"/><br/>
		<label id="rst" style="display: none; width: 250px; height: 30px"><font style="color: red" id="rst2">비밀번호가 일치하지 않습니다.</font></label>
	</div>
</div>

<script>
	function loginMenu(element){
		var val = element.value;
		if(val=="myinfo"){
			location.href="/myinfo";
		} else if(val=="myhome"){
			onClickHome("${id}");
		} else if(val=="charge"){
			location.href="/charge";
		} else if(val=="join"){
			location.href="/join";
		} else if(val=="friends"){
			location.href="/friends/${id}";
		}
	}
	
	function goMain(){
		location.href = "/index";
	}
	
	LeftPosition = (screen.width - 900) / 2;
	TopPosition = (screen.height - 700) / 2;

	function Passcertification() {
		$("#infoDiv").fadeIn(500);
	}
	
	$("#submit").click(function(){
		$.ajax({
			"method" : "get",
			"url" : "/myinfo/PassConfirm?pass="+$("#password").val(),
			"async" : false
		}).done(function(txt){
			if(txt==true){
				window.open("/myinfo/passConfirm2?pass="+$("#password").val(), "", "width=600, height=600,left=" + LeftPosition	+ ",top=" + TopPosition);
				$("#infoDiv").fadeOut(500);
				$("#password").val("");
			} else {
				$("#rst").show();
			}
		});
	});
</script>