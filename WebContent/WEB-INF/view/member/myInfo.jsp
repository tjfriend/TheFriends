<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="w3-row" style="margin-top: 50px">
	<h2>My Info</h2>
</div>
<style>
hre {
	display: block;
	margin-top: 0.5em;
	margin-bottom: 0.5em;
	margin-left: 100px;
	margin-right: 100px;
	border-style: inset;
	border-width: 1px;
}
</style>
</head>
<div>
	<table class="table">
		<tr>
			<td align="center"><a id="MyPage" onclick="MyPage">회원정보수정</a></td>
			<td align="left"><a id="Retire" onclick="Retire">회원탈퇴</a></td>
		</tr>
		<tr>
			<th align="center"><a id="ChangeInfo" onclick="ChangeInfo">기본정보변경</a>
				<a id="ChangePass" onclick="ChangePass">비밀번호변경</a></th>
			<th align="left"><a id="Secession" onclick="Secession">회원탈퇴</a></th>
	</table>

	<div id="DivChangeInfo">
		<h3 style="margin-left: 100px;">○ 기본정보변경</h3>
		<hre></hre>
		<input type="hidden" name="div" value="ChangeInfo">
		<input type="button" height="100px" width="50px" value="비밀번호 인증"
			onclick="javascript:Passcertification()" style="margin-left: 200px;">
	</div>

	<div id="DivChangePass">
		<h3 style="margin-left: 100px;">○ 비밀번호변경</h3>
		<hre></hre>
		<input type="hidden" name="div" value="ChangePass">
		<input type="button" height="100px" width="50px" value="비밀번호 인증"
			onclick="javascript:Passcertification()" style="margin-left: 200px;">
	</div>
	
	<div id="DivSecession">
		<h3 style="margin-left: 100px;">○ 회원탈퇴</h3>
		<hre></hre>
		<input type="hidden" name="div" value="Secession">
		<input type="button" height="100px" width="50px" value="비밀번호 인증"
			onclick="javascript:Passcertification()" style="margin-left: 200px;">
	</div>


	<script>
		$(document).ready(function() {
			$("#Secession").hide();
			$("#DivChangePass").hide();
			$("#DivSecession").hide();
			$("#DivChangeInfo").show();
			
			$("#Retire").click(function() {
				$("#Secession").show();
				$("#DivSecession").show();
				$("#ChangeInfo").hide();
				$("#ChangePass").hide();	
				$("#DivChangePass").hide();
				$("#DivChangeInfo").hide();
			});
			$("#MyPage").click(function() {
				$("#Secession").hide();
				$("#ChangeInfo").show();
				$("#ChangePass").show();
				$("#DivChangeInfo").show();
				$("#DivSecession").hide();
				$("#DivChangePass").hide();
			});
			$("#ChangeInfo").click(function() {
				$("#Secession").hide();
				$("#DivChangePass").hide();
				$("#DivSecession").hide();
				$("#DivChangeInfo").show();
			});
			
			$("#ChangePass").click(function() {
				$("#Secession").hide();
				$("#DivChangePass").show();
				$("#DivSecession").hide();
				$("#DivChangeInfo").hide();
			});
			
			$("#Secession").click(function() {
				$("#Secession").show();
				$("#DivChangePass").hide();
				$("#DivSecession").show();
				$("#DivChangeInfo").hide();
			});
		}); 
		
		LeftPosition = (screen.width - 900) / 2;
		TopPosition = (screen.height - 700) / 2;

		function Passcertification() {
			window.open("/myinfo/Passcertification", "",
					"width=800, height=600,left=" + LeftPosition
							+ ",top=" + TopPosition);

		}
	</script>
	
</div>
