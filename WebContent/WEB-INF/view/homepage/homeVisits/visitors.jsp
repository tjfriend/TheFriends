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

<c:choose>
	<c:when test="${owner!=sessionScope.id}">
		<c:import url="/WEB-INF/view/homepage/homeVisits/guest.jsp"/>
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/view/homepage/homeVisits/owner.jsp"/>
	</c:otherwise>
</c:choose>

<script>
	$("#modify").click(function(){
		$("#modify").hide();
		$("#delete").hide();
		$("#commit").show();
		$("#cancel").show();
	});
	
	$("#cancel").click(function(){
		$("#modify").show();
		$("#delete").show();
		$("#commit").hide();
		$("#cancel").hide();
	})

	$("#submit").click(function(){
		$.ajax({
			"method" : "get",
			"url" : "/visitors/${id}/"+$("#memo").val()+"/"+$("#mode").prop("checked")
		}).done(function(txt){
			if(txt==true){
				$("#addDiv").fadeIn(300).delay(1000).fadeOut(300);
				setTimeout(function(){location.href="/homepage/${id}"}, 1600);
			} else {
				$("#addFailDiv").fadeIn(300).delay(1000).fadeOut(300);
				setTimeout(function(){location.href="/homepage/${id}"}, 1600);
			}
		});
	});
</script>