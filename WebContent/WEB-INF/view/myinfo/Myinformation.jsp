<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div align="center" style="margin-top: 50px">
	<table>
		<tr>
			<td><input type="button" value="회원정보수정" id="ChangeInfoButton" class="btn btn-default"
				onclick="ChangeInfoButton"></td>
			<td><input type="button" value="비밀번호변경" id="ChangePassButton" class="btn btn-default"
				onclick="ChangePassButton"></td>
			<td><input type="button" value="회원탈퇴" id="SecessionButton" class="btn btn-default"
				onclick="SecessionButton"></td>
		</tr>
	</table>
</div>

<div id="Secessiondiv" align="center" style="width: 100%">
	<br /> 회원탈퇴를 신청하기 전에 아래 사항을 꼭 확인해주세요. <br /> <br /> ●탈퇴 신청시 즉시 탈퇴
	처리됩니다.<br /> ●사용하고 계신 아이디와 닉네임은 탈퇴 후 재사용할 수 있습니다.<br /> ●탈퇴 후 즉시
	회원정보 및 서비스와 관련된 포인트가 모두 삭제됩니다.<br /> 
	<font color="red">●탈퇴 전 작성된 게시물이나 댓글 등은 탈퇴 후 즉시 삭제됩니다.</font><br /> <br />
	아래 확인 버튼을 누르면 탈퇴가 진행됩니다.<br /> <br /> <br />

	<div class="w3-row" style="width: 100%">
		<form action="/myinfo/myinfodelete" method="post">
			<input type="submit" name="Check" value="확인"
				style="height: 50px; width: 100px" class="btn btn-default">
			<input type="button" name="Cancell" value="취소"
				style="height: 50px; width: 100px" id="Cancell" onclick="Cancell" class="btn btn-default">
		</form>
	</div>
</div>

<div id="ChangePass">
	<br />
	<div align="center">
		<form action="/myinfo/Passchange" method="post" name="checkpass">
			<label style="width: 30%"><font size="4">변경할 비밀번호</font></label> <input
				type="password" class="form-control" style="width: 35%" name="pass" id="pass" required="required"/>
				<br/>
			<label style="width: 30%"><font size="4">변경할 비밀번호확인 </font></label> <input
				type="password" class="form-control" style="width: 35%" name="passcheck" id="passcheck"/>
			<br /> <input type="button" value="확인" name="passbu"  required="required" id="passbu" onclick="passbu" class="btn btn-default"
				style="margin: 0 auto; height: 50px; width: 150px">
		</form>
	</div>
</div>
<script>
	$("#passbu").click(function() {
		var pass = $('#pass').val();
		var passcheck = $('#passcheck').val();
		if(pass == passcheck){
			 alert("비밀번호가 성공적으로 변경되었습니다.");
			 window.close();
		}else{
			 alert("비밀번호를 다시 확인해주세요.");
		}
	});
</script>

<div id="ChangeInfodiv" align="center">
	<br />
	<form action="/myinfo/changeoff" method="post">
		<div class="w3-hide-large">
			<label style="width: 30%"><font size="4">ID</font></label> <input
				type="text" class="form-control" style="width: 35%"
				value="${info.ID }" disabled="disabled"  />

		</div>
		<div class="w3-hide-large">
			<label for="name" style="width: 30%"><font size="4">Name</font></label>
			<input type="text" id="name" name="name" class="form-control"
				style="width: 35%" value="${info.NAME }" disabled="disabled" />
		</div>
		<div class="w3-hide-large">
			<label for="nickname" style="width: 30%"><font size="4">NickName</font></label>
			<input type="text" id="nickname" name="nickname" class="form-control"
				style="width: 35%" value="${info.NICKNAME }" disabled="disabled" />
		</div>
		
			<div class="w3-hide-large">
				<label for="phone" style="width: 30%"><font size="4">Phone</font></label>비공개 :&nbsp;
				<input type="checkbox" name="checkbox" 
				${info.PHONE eq '비공개'?'checked':'' } value="phoneoff">
				
				<input type="text" id="phone" name="phone" class="form-control" value="${infomy.PHONE }"
					style="width: 45%" placeholder="01012345678" required="required" />
			</div>
		
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="email" style="width: 30%"><font size="4">Email</font></label><font
					size="2">비공개 : &nbsp;</font><input type="checkbox" name="checkbox" ${fn:split(info.EMAIL,'@')[0] eq '비공개'?'checked':'' }
					value="Emailoff" id="Emailoff" ><br /> <input type="text" id="email" required="required"
					name="email"
					style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Email" value="${fn:split(infomy.EMAIL,'@')[0] }" /> <label>@</label>
				<input type="text" required="required" value="${fn:split(infomy.EMAIL,'@')[1] }"
					style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					id="email2" name="email2" placeholder="직접입력" /> <select
					style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px"
					id="selMail">
					<option>직접입력</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
					<option>yahoo.com</option>
				</select><br /> <br />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="birth" style="width: 30%"><font size="4">Birth
						Day</font></label><font size="2">비공개 : &nbsp;</font><input type="checkbox" ${info.BIRTH eq infomy.BIRTH  ?'':'checked' }
				id="Birthoff"	name="checkbox" value="Birthoff"> <input type="date" required="required"
					id="birth" name="birth" class="form-control" style="width: 45%"
					placeholder="yyyymmdd"
					value="${fn:split(infomy.BIRTH,'-')[0]}-${fn:split(infomy.BIRTH,'-')[1]}-${fn:split(fn:split(infomy.BIRTH,'-')[2],' ')[0]}" />
			</div>
		</div>

		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="address" style="width: 30%"><font size="4">Address</font></label><font
					size="2">비공개 : &nbsp;</font><input type="checkbox" ${fn:split(info.ADD01,'@')[0] eq '비공개'?'checked':'' }
				id="Addressoff"	name="checkbox" value="Addressoff"><br /> <input
					type="text" id="post" name="post"  required="required"
					style="width: 40%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					readonly="readonly" placeholder="Post Number" value="${info.POST }"/> <input
					type="button"  class="btn btn-default" style="width: 40%"
					onclick="searchPost()" value="우편번호 찾기" /><br /> <input
					type="text" id="add01" name="add01" value="${infomy.ADD01}" required="required"
					style="width: 45%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					readonly="readonly" placeholder="Address" /> <input type="text"
					id="add02" name="add02" value="${infomy.ADD02}" required="required"
					style="width: 45%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Detailed Address" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<input type="submit" id="submit" value="수정완료"
					style="width: 35%; background-color: #4CAF50; color: white; padding: 14px 20px; border: none; border-radius: 4px; cursor: pointer;" /><br />
				<font id="joinrst"></font>
			</div>
		</div>
	</form>
</div>

<script>
	$(document).ready(function() {
		$("#ChangePass").hide();
		$("#Secessiondiv").hide();
		$("#ChangeInfodiv").show();
	});
	$("#ChangeInfoButton").click(function() {
		$("#ChangeInfodiv").show();
		$("#Secessiondiv").hide();
		$("#ChangePass").hide();
	});
	$("#Cancell").click(function() {
		$("#ChangeInfodiv").show();
		$("#Secessiondiv").hide();
		$("#ChangePass").hide();
	});
	$("#SecessionButton").click(function() {
		$("#Secessiondiv").show();
		$("#ChangeInfodiv").hide();
		$("#ChangePass").hide();
	});
	$("#ChangePassButton").click(function() {
		$("#Secessiondiv").hide();
		$("#ChangeInfodiv").hide();
		$("#ChangePass").show();
	});
	$("#selMail").change(function() {
		var sel = $("#selMail").prop("value");
		var email = $("#email2");
		if (sel == "직접입력") {
			email.val("");
			email.prop("readonly", null);
		} else {
			email.val(sel);
			email.prop("readonly", "readonly");
		}
	});
	$("#selMail_s").change(function() {
		var sel = $("#selMail_s").prop("value");
		var email = $("#email2_s");
		if (sel == "직접입력") {
			email.val("");
			email.prop("readonly", null);
		} else {
			email.val(sel);
			email.prop("readonly", "readonly");
		}
	});
	function searchPost() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('add01').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('add02').focus();
					}
				}).open();
	}
</script> 	