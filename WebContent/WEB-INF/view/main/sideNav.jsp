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
	<b>The<br>Friends
	</b>
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
				보유 잣 :
				${point } 잣
			</div>
			<br />
			<button type="button" class="btn btn-default"onclick="loginMenu(this)" value="myinfo">My Info</button>
			&nbsp;
			<button type="button" class="btn btn-default" onclick="loginMenu(this)" value="myhome">My Home</button>
			<br />
			<br />
			<button type="button" class="btn btn-default" onclick="loginMenu(this)" value="charge">Charge</button>
			&nbsp;
			<button type="submit" class="btn btn-default">Logout</button>
		</form>
		<hr />
	</c:otherwise>
</c:choose>
<a href="javascript:void(0)" onclick="w3_close()"
	class="w3-padding w3-hide-large">CLOSE</a>
<a href="/" onclick="w3_close()" class="w3-padding">Home</a>
<a href="/notice" onclick="w3_close()" class="w3-padding">Notice</a>
<a href="/event" onclick="w3_close()" class="w3-padding">Event</a>
<a href="/search" onclick="w3_close()" class="w3-padding">Search</a>
<a href="/navigation" onclick="w3_close()" class="w3-padding">Navigation</a>
<a href="/board" onclick="w3_close()" class="w3-padding">Free	Board</a>
<a href="/shop" onclick="w3_close()" class="w3-padding">Shop</a>
<a href="/qna" onclick="w3_close()" class="w3-padding">QnA</a>

<script>
	function loginMenu(element){
		var val = element.value;
		if(val=="myinfo"){
			location.href="/myinfo";
		} else if(val=="myhome"){
			location.href="/myhome";
		} else if(val=="charge"){
			location.href="/charge";
		} else if(val=="join"){
			location.href="/join";
		}
	}
</script>