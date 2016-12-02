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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div class="w3-text-grey" style="padding: 20px; border-radius: 5px"
	align="center">
	<h2 class="w3-padding-64">Join</h2>
	<form>
		<div class="form-group">
			<div class="w3-hide-large">
				<label for="join_id_s" style="width: 30%"><font size="4">ID</font></label>
				<input type="text" id="join_id_s" name="join_id_s"
					class="form-control" style="width: 35%" placeholder="6자리 이상"
					value="${id }" /> <font id="idcheck_s"></font>
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="join_id" style="width: 15%"><font size="4">ID</font></label><br />
				<input type="text" id="join_id" name="join_id" class="form-control"
					style="width: 20%" placeholder="6자리 이상" value="${id }" /> <font
					id="idcheck"></font>
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="join_password_s" style="width: 30%"><font
					size="4">Password</font></label><br /> <input type="password"
					id="join_password_s" name="join_password_s" class="form-control"
					style="width: 35%" placeholder="8자리이상, 숫자 1개이상 포함">
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="join_password" style="width: 15%"><font size="4">Password</font></label><br />
				<input type="password" id="join_password" name="join_password"
					class="form-control" style="width: 20%"
					placeholder="8자리이상, 숫자 1개이상 포함" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="name_s" style="width: 30%"><font size="4">Name</font></label>
				<input type="text" id="name_s" name="name_s" class="form-control"
					style="width: 35%" placeholder="Name" value="${name }" />
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="name" style="width: 15%"><font size="4">Name</font></label>
				<input type="text" id="name" name="name" class="form-control"
					style="width: 20%" placeholder="Name" value="${name }" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="nickname_s" style="width: 30%"><font size="4">NickName</font></label>
				<input type="text" id="nickname_s" name="nickname_s" class="form-control"
					style="width: 35%" placeholder="NickName" value="${nickname }" />
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="nickname" style="width: 15%"><font size="4">NickName</font></label>
				<input type="text" id="nickname" name="nickname" class="form-control"
					style="width: 20%" placeholder="NickName" value="${nickname }" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="birth_s" style="width: 30%"><font size="4">Birth
						Day</font></label>
				<!-- 				<label><input type="checkbox" id="bdCheck_s"/></label><br/> -->
				<input type="date" id="birth_s" name="birth_s" class="form-control"
					style="width: 45%" placeholder="yyyymmdd" value="${birth }" />
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="birth" style="width: 15%"><font size="4">Birth
						Day</font></label>
				<!-- 				<label><input type="checkbox" id="bdCheck"/></label><br/> -->
				<input type="date" id="birth" name="birth" class="form-control"
					style="width: 20%" placeholder="yyyymmdd" value="${birth }" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="phone_s" style="width: 30%"><font size="4">Phone</font></label>
				<!-- 				<label><input type="checkbox" id="phoneCheck_s"/></label><br/> -->
				<input type="text" id="phone_s" name="phone_s" class="form-control"
					style="width: 45%" placeholder="01012345678" value=${phone } />
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="phone" style="width: 15%"><font size="4">Phone</font></label>
				<!-- 				<label><input type="checkbox" id="phoneCheck"/></label><br/> -->
				<input type="text" id="phone" name="phone" class="form-control"
					style="width: 20%" placeholder="01012345678" value="${phone }" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="email_s" style="width: 30%"><font size="4">Email</font></label><br />
				<!-- 				<label><input type="checkbox" id="mailCheck_s"/></label><br/> -->
				<input type="text" id="email_s" name="email_s"
					style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Email" value="${email }" readonly="readonly" /> <label>@</label>
				<input type="text"
					style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					id="email2_s" name="email2_S" placeholder="직접입력" value="${email2 }"
					readonly="readonly" /><br />
				<!-- 				<select style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px" id="selMail_s"> -->
				<!-- 					<option>직접입력</option> -->
				<!-- 					<option>네이버</option> -->
				<!-- 					<option>다음</option> -->
				<!-- 					<option>구글</option> -->
				<!-- 					<option>네이트</option> -->
				<!-- 					<option>야후</option> -->
				<!-- 				</select><br/><br/> -->
				<div>
					<input type="text" id="authPass_s" placeholder="인증번호"
						value="${key }"
						style="width: 25%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px" />
					<input type="button" class="btn btn-default" id="authCheck_s"
						value="인증완료" style="height: 33px" /> <font id="checkRst_s"></font>
				</div>
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="name" style="width: 15%"><font size="4">Email</font></label><br />
				<!-- 				<label><input type="checkbox" id="mailCheck"/></label><br/> -->
				<input type="text" id="email" name="email"
					style="width: 10%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Email" value="${email }" readonly="readonly" /> <label>@</label>
				<input type="text"
					style="width: 10%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					id="email2" name="email2" placeholder="직접입력" value="${email2 }"
					readonly="readonly" /><br />
				<!-- 				<select style="width: 7%; height: 33px; border: 1px solid #ccc; border-radius: 5px" id="selMail" > -->
				<!-- 					<option>직접입력</option> -->
				<!-- 					<option>네이버</option> -->
				<!-- 					<option>다음</option> -->
				<!-- 					<option>구글</option> -->
				<!-- 					<option>네이트</option> -->
				<!-- 					<option>야후</option> -->
				<!-- 				</select><br/><br/> -->
				<div>
					<input type="text" id="authPass" placeholder="인증번호" value="${key }"
						style="width: 10%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px" />
					<input type="button" class="btn btn-default" id="authCheck"
						value="인증완료" style="height: 33px" /><br /> <font id="checkRst"></font>
				</div>
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="address_s" style="width: 30%"><font size="4">Address</font></label><br />
				<!-- 				<label><input type="checkbox" id="addrCheck_s"/></label><br/> -->
				<input type="text" id="post_s" name="post_s"
					style="width: 40%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					readonly="readonly" placeholder="Post Number" /> <input
					type="button" class="btn btn-default" style="width: 40%"
					onclick="searchPost()" value="우편번호 찾기" /><br /> <input type="text"
					id="add01_s" name="add01_s"
					style="width: 45%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					readonly="readonly" placeholder="Address" /> <input type="text"
					id="add02_s" name="add02_s"
					style="width: 45%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Detailed Address" />
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="address" style="width: 15%"><font size="4">Address</font></label><br />
				<!-- 				<label><input type="checkbox" id="addrCheck"/></label><br/> -->
				<input type="text" id="post" name="post"
					style="width: 10%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					readonly="readonly" placeholder="Post Number" /> <input
					type="button" class="btn btn-default" style="width: 10%"
					onclick="searchPost()" value="우편번호 찾기" /><br /> <input type="text"
					id="add01" name="add01"
					style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					readonly="readonly" placeholder="Address" /> <input type="text"
					id="add02" name="add02"
					style="width: 15%; height: 33px; border: 1px solid #ccc; border-radius: 5px; padding-left: 10px"
					placeholder="Detailed Address" />
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<label for="recommender_s" style="width: 30%"><font size="4">Recommender</font></label><br />
				<input type="text" id="recommender_s" name="recommender_s"
					class="form-control" style="width: 35%; padding-left: 10px"
					placeholder="recommender" />
				<p>추천인 입력시 500 밤 증정
				<p>
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<label for="recommender" style="width: 15%"><font size="4">Recommender</font></label><br />
				<input type="text" id="recommender" name="recommender"
					class="form-control" style="width: 20%; padding-left: 10px"
					placeholder="recommender" />
				<p>추천인 입력시 500 밤 증정
				<p>
			</div>
		</div>
		<div class="form-group" align="center">
			<div class="w3-hide-large">
				<input type="button" id="submit_s" value="Join"
					style="width: 35%; background-color: #4CAF50; color: white; padding: 14px 20px; border: none; border-radius: 4px; cursor: pointer;" /><br />
				<font id="joinrst_s"></font>
			</div>
			<div class="w3-hide-small w3-hide-medium">
				<input type="button" id="submitM" value="Join"
					style="width: 15%; background-color: #4CAF50; color: white; padding: 14px 20px; border: none; border-radius: 4px; cursor: pointer;" /><br />
				<font id="joinrst"></font>
			</div>
		</div>
		<div class="w3-hide-large" style="height: 7%">
			<div id="result_s"></div>
		</div>
		<div class="w3-hide-small w3-hide-medium" style="height: 7%">
			<div id="result"></div>
		</div>
		<input type="hidden" name="hidden" id="hidden" value="0" />
	</form>
</div>

<div class="w3-modal" style="display: none" id="finishDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="finish">
		<input type="button" class="btn btn-success" value="가입되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="emailComDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="emailCom">
		<input type="button" class="btn btn-success" value="인증되었습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="failDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="fail">
		<input type="button" class="btn btn-danger" value="입력하지 않은 항목이 있습니다." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="numChkDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="numChk">
		<input type="button" class="btn btn-danger" value="인증번호를 확인해주세요." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="comChkDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="comChk">
		<input type="button" class="btn btn-danger" value="인증 확인을 해주세요." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<div class="w3-modal" style="display: none" id="joinFailDiv">
	<div class="w3-modal-content" style="width: 15%; height: 5%; border-radius: 10px; margin-top: 100px" align="center" id="joinFail">
		<input type="button" class="btn btn-danger" value="잠시후에 다시 시도해주세요." style="width: 100%; height: 100%; border-radius: 10px"/>
	</div>
</div>

<script>
	function endDiv(txt){
		$("#"+txt+"Div").fadeIn(300).delay(1000).fadeOut(300);
	}
	
	$("#authCheck").click(function(){
		var id = $("#join_id");
		var authPass = $("#authPass");
		if(authPass.val()=="${ranKey}"){
			$("#hidden").prop("value", "1");
			endDiv("emailCom");
			$("#emailSend").prop("hidden", "hidden");
		} else {
			endDiv("numChk");
		}
	});
	
	$("#authCheck_s").click(function(){
		var id = $("#join_id_s");
		var authPass = $("#authPass");
		if(authPass.val()=="${ranKey}"){
			$("#hidden").prop("value", "1");
			endDiv("emailCom");
			$("#emailSend_s").prop("hidden", "hidden");
		} else {
			endDiv("numChk");
		}
	});
	
	$("#join_id").keyup(function(){
		$.ajax({
			"method" : "get",
			"url" : "/member/idcheck/"+$("#join_id").val(),
			"async" : true
		}).done(function(txt){
			if($("#join_id").val().length<6 || $("#join_id").val()==""){
				$("#idcheck").prop("color", "red");
				$("#idcheck").text("사용할 수 없는 아이디입니다.");
			} else {
				if(txt==0){
					$("#idcheck").prop("color", "green");
					$("#idcheck").text("사용할 수 있는 아이디입니다.");
				} else {
					$("#idcheck").prop("color", "red");
					$("#idcheck").text("이미 사용중인 아이디입니다.");
				}
			}
		});
	});
	
	$("#join_id_s").keyup(function(){
		$.ajax({
			"method" : "get",
			"url" : "/member/idcheck/"+$("#join_id_s").val(),
			"async" : true
		}).done(function(txt){
			if($("#join_id").val().length<6 || $("#join_id_s").val()==""){
				$("#idcheck_s").prop("color", "red");
				$("#idcheck_s").text("사용할 수 없는 아이디입니다.");
			} else {
				if(txt==0){
					$("#idcheck_s").prop("color", "green");
					$("#idcheck_s").text("사용할 수 있는 아이디입니다.");
				} else {
					$("#idcheck_s").prop("color", "red");
					$("#idcheck_s").text("이미 사용중인 아이디입니다.");
				}
			}
		});
	});

	$("#submitM").click(function(){
		console.log("11111");
		var id = $("#join_id");
		var password = $("#join_password");
		var name = $("#name");
		var birthday = $("#birth");
		var phone = $("#phone");
		var post = $("#post");
		var add01 = $("#add01");
		var add02 = $("#add02");
		var email = $("#email");
		var email2 = $("#email2");
		var nickname = $("#nickname");
		var reco = $("#recommender");
		var authPass = $("#authPass");
		var url = "/member/join/"+id.val()+"/"+password.val()+"/"+name.val()+"/"+birthday.val()+"/"+phone.val()+"/"+post.val()+"/"+
							add01.val()+"/"+add02.val()+"/"+email.val()+"/"+email2.val()+"/"+nickname.val()+"/"+authPass.val();
		if(reco.val()!=""){
			url += "/"+reco.val();
		}
		if(id.val()!="" && password.val()!="" && name.val()!="" && birthday.val()!="" && phone.val()!="" && add01.val()!="" && post.val()!="" &&
				add02.val()!="" && email.val()!="" && email2.val()!="" && nickname.val()!=""){
			if($("#hidden").val()=="1"){
				console.log("aaaa");
				$.ajax({
					"method" : "get",
					"url" : url,
					"async" : false
				}).done(function(txt){
					if(txt==true){
						endDiv("finish");
// 						$("#result").prop("class", "alert alert-success");
// 						$("#result").html(
// 							"<strong>Success!</strong> Enjoy The Friends!<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
// 						);
						window.setTimeoutl(goIndex, 1600);
					} else {
						endDiv("joinFail");
// 						$("#result").prop("class", "alert alert-danger");
// 						$("#result").html(
// 							"<strong>Fail!</strong> Please check any blank about all items!<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
// 						);
					}
				});
			} else {
				endDiv("comChk");
// 				$("#emailSend").prop("color", "red");
// 				$("#emailSend").text("인증 확인을 해주세요.");
			}
		} else {
			endDiv("fail");
// 			$("#joinrst").prop("color", "red");
// 			$("#joinrst").text("입력되지 않은 항목이 있습니다.");
		}
	});
	
	$("#submit_s").click(function(){
		var id = $("#join_id_s");
		var password = $("#join_password_s");
		var name = $("#name_s");
		var birthday = $("#birth_s");
		var phone = $("#phone_s");
		var add01 = $("#add01_s");
		var add02 = $("#add02_s");
		var email = $("#email_s");
		var email2 = $("#email2_s");
		var post = $("#post_s");
		var nickname = $("#nickname");
		var reco = $("#recommender_s");
		var authPass = $("#authPass_s");
		var url = "/member/join/"+id.val()+"/"+password.val()+"/"+name.val()+"/"+birthday.val()+"/"+phone.val()+"/"+post.val()+"/"+
							add01.val()+"/"+add02.val()+"/"+email.val()+"/"+email2.val()+"/"+nickname.val()+"/"+authPass.val();
		if(reco.val()!=""){
			url += "/"+reco.val();
		}
		if(id.val()!="" && password.val()!="" && name.val()!="" && birthday.val()!="" && phone.val()!="" && add01.val()!="" && post.val()!="" &&
				add02.val()!="" && email.val()!="" && email2.val()!="" && nickname.val()!=""){
			if($("#hidden").val()=="1"){
				$.ajax({
					"method" : "get",
					"url" : url,
					"async" : false
				}).done(function(txt){
					if(txt==true){
						endDiv("finish");
// 						$("#result_s").prop("class", "alert alert-success");
// 						$("#result_s").html(
// 							"<strong>Success!</strong> Enjoy The Friends!<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
// 						);
						window.setTimeout(goIndex, 1600);
					} else {
						endDiv("joinFail");
// 						$("#result_s").prop("class", "alert alert-danger");
// 						$("#result_s").html(
// 							"<strong>Fail!</strong> Please check any blank about all items!<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
// 						);
					}
				});
			} else {
				endDiv("comChk");
// 				$("#emailSend_s").prop("color", "red");
// 				$("#emailSend_s").text("인증 확인을 해주세요.");
			}
		} else {
			endDiv("fail");
// 			$("#joinrst_s").prop("color", "red");
// 			$("#joinrst_s").text("입력되지 않은 항목이 있습니다.");
		}
	});

	$("#selMail").change(function(){
		var sel = $("#selMail").prop("value");
		var email = $("#email2");
		if(sel=="직접입력"){
			email.val("");
			email.prop("readonly", null);
		} else if(sel=="네이버"){
			email.val("naver.com");
			email.prop("readonly", "readonly");
		} else if(sel=="다음"){
			email.val("daum.net");
			email.prop("readonly", "readonly");
		} else if(sel=="구글"){
			email.val("gmail.com");
			email.prop("readonly", "readonly");
		} else if(sel=="네이트"){
			email.val("nate.com");
			email.prop("readonly", "readonly");
		} else if(sel=="야후"){
			email.val("yahoo.com");
			email.prop("readonly", "readonly");
		}
	});
	
	$("#selMail_s").change(function(){
		var sel = $("#selMail_s").prop("value");
		var email = $("#email2_s");
		if(sel=="직접입력"){
			email.val("");
			email.prop("readonly", null);
		} else if(sel=="네이버"){
			email.val("naver.com");
			email.prop("readonly", "readonly");
		} else if(sel=="다음"){
			email.val("daum.net");
			email.prop("readonly", "readonly");
		} else if(sel=="구글"){
			email.val("gmail.com");
			email.prop("readonly", "readonly");
		} else if(sel=="네이트"){
			email.val("nate.com");
			email.prop("readonly", "readonly");
		} else if(sel=="야후"){
			email.val("yahoo.com");
			email.prop("readonly", "readonly");
		}
	});

	function searchPost() {
	    new daum.Postcode({
	        oncomplete: function(data) {
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
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('post_s').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('add01').value = fullAddr;
	            document.getElementById('add01_s').value = fullAddr;
	
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('add02').focus();
	            document.getElementById('add02_s').focus();
	        }
	    }).open();
	}
	
	function goIndex(){
		location.href="/";
	}
</script>