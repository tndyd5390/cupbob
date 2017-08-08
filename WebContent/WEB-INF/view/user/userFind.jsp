<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<title>소라네 컵밥 아이디/비밀번호 찾기</title>
<script>
function doFind(){
	var user_name = $('#name');
	var gender = $('#gender');
	var contact_addr = $('#contact_addr');
	var year = $('#year');
	var month = $('#month');
	var day = $('#day');
	
	 if (user_name.val() == "") {
		alert("성명을 입력하세요");
		user_name.focus();
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
	} else {
		if (confirm("아이디를 찾으시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
}

function doFind2() {
	var email1 = $('#email1');
	var email2 = $('#email2');
	var user_name = $('#name2');
	var gender = $('#gender2');
	var contact_addr = $('#contact_addr2');
	var year = $('#year2');
	var month = $('#month2');
	var day = $('#day2');
	
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
	} else {
		if (confirm("비밀번호를 찾으시겠습니까?")){
			return true;
		}else{
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
</script>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
		<form class="form" action="userFindEmail.do" method="post" onsubmit="return doFind();">
			<h4 class="formHead">아이디 찾기</h4>
			<div class="form-group">
				<input type="text" class="form-control name" name="name" id="name" placeholder="이름">
				<select class="form-control selectSex" name="gender" id="gender">
					<option value="" selected>성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select> <input type="text" class="form-control phone" id="contact_addr"
					placeholder="휴대폰번호(ex01012345678)" name="contact_addr" onKeyUp="return doKeyOnlyNumberPhone(event);">
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
			<button class="detailSubmit" type="submit">아이디 찾기</button>
		</form>
		<form class="form formPadding" method="post" action="userFindPw.do" onsubmit="return doFind2();">
			<h4 class="formHead">비밀번호 찾기</h4>
			<div class="form-group">
				<input type="text" class="form-control email" id="email1"
					placeholder="이메일 입력" name="email1"> <label>@</label> <input type="text"
					class="form-control email" id="email2" name="email2">
			</div>
			<div class="form-group">
				<input type="text" class="form-control name" name="name" id="name2" placeholder="이름">
				<select class="form-control selectSex" name="gender" id="gender2">
					<option value="" selected>성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
				</select> <input type="text" class="form-control phone" id="contact_addr2"
					placeholder="휴대폰번호(ex01012345678)" name="contact_addr" onKeyUp="return doKeyOnlyNumberPhone(event);">
			</div>
			<div class="form-group">
				<select class="form-control selectYear" name="year" id="year2">
				<option value="" selected>생년</option>
				<% for(int i=1900;i<=2017;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
				</select> 
				<select class="form-control selectMonth" name="month" id="month2">
				<option value="" selected>월</option>
				<% for(int i=1;i<=12;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select> <select class="form-control selectDay" name="day" id="day2">
				<option value="" selected>일</option>
				<% for(int i=1;i<=31;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select>
			</div>
			<button class="detailSubmit">비밀번호 찾기</button>
		</form>

		<br>
			<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>