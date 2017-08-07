<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<title>소라네 컵밥 회원가입</title>
<script>
var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var ovlapE = false;
function overlapEmail() {
	$.ajax({
		type : "POST",
		dataType : 'text',
		url : "overlapEmail.do",
		data : {
			"email" : $('#email1').val() + "@" + $("#email2").val()
		},
		success : function(data) {
			 if ($.trim(data) == 1) {
				$('p.emailFont').html("이미 존재하는 아이디입니다")
				ovlapE = false;
			}   else if(!regExp.test($('#email1').val()+"@"+$('#email2').val())){
				$('p.emailFont').html("이메일을 입력해주세요")
				ovlapE = false;
			}   else if($('#email1').val() == "" || $('#email2').val() == ""){
				$('p.emailFont').html("이메일을 입력해주세요")
				ovlapE = false;
			}  else{
				$('p.emailFont').html("가능합니다")
				ovlapE = true;
			}
			console.log(ovlapE)
		}
	})
};

function pwCheck() {
	if($('#password').val() != $('#confirm_password').val()){
		$('#passwordFonts').html('* 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.').css("color","red");
	}else{
		$('#passwordFonts').html('* 비밀번호가 일치합니다.').css("color", "skyblue");
	}
}

function doJoin() {
	var email1 = $('#email1');
	var email2 = $('#email2');
	var password = $('#password');
	var confirmPassword = $('#confirm_password');
	var user_name = $('#name');
	var gender = $('#gender');
	var contact_addr = $('#contact_addr');
	var year = $('#year');
	var month = $('#month');
	var day = $('#day');
	var checkBox1 = $('#checkBox1');
	var checkBox2 = $('#checkBox2');
	var checkBox3 = $('#checkBox3');

	if (email1.val() == "") {
		alert("이메일을 입력하세요")
		email1.focus();
		return false;
	} else if(email2.val() == ""){
		alert("이메일을 입력하세요")
		email2.focus();
		return false;
	} else if (user_name.val() == "") {
		alert("성명을 입력하세요");
		user_name.focus();
		return false;
	} else if (password.val() == "") {
		alert("비밀번호를 입력하세요");
		password.focus();
		return false;
	} else if (confirmPassword.val() == "") {
		alert("비밀번호 재확인을 입력하세요");
		confirmPassword.focus();
		return false;
	} else if (password.val() != confirmPassword.val()) {
		alert("비밀번호가 일치하지 않습니다");
		confirmPassword.focus();
		return false;
	}else if(gender.val() == ""){
		alert("성별을 선택해주세요");
		gender.focus();
		return false;
	}else if(contact_addr.val() == ""){
		alert("휴대폰번호를 입력해주세요");
		contact_addr.focus();
		return false;
	}
	else if (year.val() == "") {
		alert("생년을 선택해 주세요");
		year.focus();
		return false;
	}else if (month.val() == "") {
		alert("월을 선택해 주세요");
		month.focus();
		return false;
	}else if (day.val() == "") {
		alert("일을 선택해 주세요");
		day.focus();
		return false;
	}else if($('input:checkbox[id="checkBox1"]').is(":checked")==false){
		alert("서비스 이용약관을 읽어보신 후 동의가 필요합니다");
		checkBox1.focus();
		return false;
	}else if($('input:checkbox[id="checkBox2"]').is(":checked")==false){
		alert("개인정보 수집 및 이용 동의 안내를 읽어보신 후 개인정보 취급방침에 동의가 필요합니다");
		checkBox2.focus();
		return false;
	}else if($('input:checkbox[id="checkBox3"]').is(":checked")==false){
		alert("개인정보 취급 위탁 안내를 읽어보신 후 개인정보 취급 위탁에 대해 동의가 필요합니다");
		checkBox3.focus();
		return false;
	}else if(ovlapE == false) {
		alert("아이디 중복확인이 필요합니다");
		email.focus();
		return false;
	}  else {
		if (confirm("가입하시겠습니까?")) {
			alert("가입 되었습니다")
			return true;
		} else {
			return false;
		}
	}
}

function doKeyOnlyNumberPhone(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;

	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 109 || keyID == 189 || keyID == 16
			|| keyID == 20 || keyID == 9 || keyID == 13) {
		return true;
	} else {
		alert("숫자만 입력가능 합니다");
		var val = document.getElementById("phone");
		val.value = val.value.subString(0,val.value.length-1);
		return false;
	}
}

function doCancel(){
	if(confirm("취소 하시겠습니까?")){
		location.href("userSignIn.do")
	}
}
</script>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<form class="form" method="post" action="userSignInProc.do" onsubmit="return doJoin();">
		<h4 class="formHead">필수 정보</h4>
		<div class="form-group">
			<input type="text" class="form-control email" id="email1"
				placeholder="이메일 입력" name="email1" onkeyup="overlapEmail()"> <label>@</label> <input type="text"
				class="form-control email" id="email2" name="email2" onkeyup="overlapEmail()">
			<p class="emailFont">회원님의 이메일은 추후 아이디로 사용됩니다.</p>
		</div>
		<div class="form-group">
			<input type="password" class="form-control password" id="password"
				placeholder="비밀번호" onkeyup="pwCheck()"> <input type="password"
				class="form-control password" id="confirm_password" name="password" placeholder="비밀번호 재확인" onkeyup="pwCheck()">
			<p class="passwordFont" id="passwordFonts"></p>
		</div>
		<div class="form-group">
			<input type="text" class="form-control name" id="name" placeholder="이름" name="name">
			<select class="form-control selectSex" id="gender" name="gender">
				<option value="" selected>성별</option>
				<option value="남자">남</option>
				<option value="여자">여</option>
			</select> <input type="text" class="form-control phone" id="contact_addr"
				placeholder="휴대폰번호(ex01012345678)" name="contact_addr" onKeyDown="return doKeyOnlyNumberPhone(event);">
			<p class="nameFont">휴대폰 번호는 아이디 또는 비밀번호를 찾기 위한 정보이므로 정확하게 입력해
				주세요.</p>
		</div>
		<div class="form-group">
			<select class="form-control selectYear" name="year" id="year">
				<option value="" selected>생년</option>
				<% for(int i=1900;i<=2017;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
				</select> 
				<select class="form-control selectMonth" name="month" id="month">
				<option value="" selected>월</option>
				<% for(int i=1;i<=12;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select> <select class="form-control selectDay" name="day" id="day">
				<option value="" selected>일</option>
				<% for(int i=1;i<=31;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select>
		</div>
		<h4 class="formHead">서비스 이용약관 동의</h4>
		<div class="service">
			서비스이용약관 <br> 1조 <br> 2조 <br> 3조 <br> 4조 <br>
			<br> <br> <br> <br> <br> <br> <br>
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="checkBox1" id="checkBox1">
			<p class="checkboxFont">서비스 이용약관에 동의합니다.</p>
			</label>
		</div>
		<h4 class="formHead">개인정보 수집 및 이용동의 안내</h4>
		<div class="service">
			개인정보 수집 및 이용동의 안내 <br> 1조 <br> 2조 <br> 3조 <br> 4조
			<br> <br> <br> <br> <br> <br> <br>
			<br>
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="checkBox2" id="checkBox2">
			<p class="checkboxFont">개인정보 취급방침에 동의합니다.</p>
			</label>
		</div>
		<h4 class="formHead">개인정보 취급 위탁 안내</h4>
		<div class="service">
			개인정보 취급 위탁 안내 <br> 1조 <br> 2조 <br> 3조 <br> 4조 <br>
			<br> <br> <br> <br> <br> <br> <br>
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="checkBox3" id="checkBox3">
			<p class="checkboxFont">개인정보 취급 위탁에 대해 동의합니다.</p>
			</label>
		</div>
		<button type="button" class="detailCart" onclick="doCancel();">취소</button>
		<button type="submit" class="detailSubmit">회원가입</button>
	</form>

	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
