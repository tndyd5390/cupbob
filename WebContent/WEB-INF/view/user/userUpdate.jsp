<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User_infoDTO uDTO = (User_infoDTO)request.getAttribute("uDTO");
	String[] email = uDTO.getEmail().split("@");
	String[] birthday = uDTO.getBirthday().split("\\W+");
%> 
    
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
<title>소라네 컵밥 회원정보수정</title>
<script>
function doUpdate() { 
		if(confirm("수정하시겠습니까?")){
			return true;
		}else{
			return false;
		}
}

function pwCheck() {
	if($('#password').val() != $('#confirm_password').val()){
		$('#passwordFonts').html('* 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.').css("color","red");
	}else{
		$('#passwordFonts').html('* 비밀번호가 일치합니다.').css("color", "skyblue");
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

function doDelete(){
	if(confirm("탈퇴하시겠습니까?")){
		location.href="userDelete.do?unum=<%=CmmUtil.nvl(uDTO.getUser_no())%>";
	}
}


</script>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<form class="form" method="post" action="userUpdateProc.do?unum=<%=CmmUtil.nvl(uDTO.getUser_no()) %>" onsubmit="return doUpdate();">
		<input type=hidden name="uNum" value="<%=CmmUtil.nvl(uDTO.getUser_no())%>">
		<h4 class="formHead">필수 정보</h4>
		<div class="form-group">
			<input type="text" name="email1" class="form-control email" id=""
				placeholder="이메일 입력" disabled="disabled" value="<%=CmmUtil.nvl(email[0])%>"> <label>@</label> <input type="text" name="email2"
				value="<%=CmmUtil.nvl(email[1]) %>" class="form-control email" id="" disabled="disabled">
			<p class="emailFont">e-mail은 변경이 불가능 합니다.</p>
		</div>
		<div class="form-group">
			<input type="password" class="form-control password" id="password" name="password"
				placeholder="비밀번호" onkeyup="pwCheck()"> <input type="password"
				class="form-control password" id="confirm_password" placeholder="비밀번호 재확인"  onkeyup="pwCheck()">
			<p class="passwordFont" id="passwordFonts">* 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p>
		</div>
		<div class="form-group">
			<input type="text" class="form-control name" id="name" placeholder="이름" name="name" value="<%=CmmUtil.nvl(uDTO.getUser_name())%>">
			<select class="form-control selectSex" name="gender" id="gender">
				
				<%
					if(CmmUtil.nvl(uDTO.getGender()).equals("남자")){ 
				%>
						<option value="">성별</option>
						<option value="남자" selected>남자</option>
						<option value="여자">여자</option>
				<%
					}else if(CmmUtil.nvl(uDTO.getGender()).equals("여자")){
				%>
						<option value="">성별</option>
						<option value="남자">남자</option>
						<option value="여자" selected>여자</option>
				<%
					}else{
				%>
						<option value="" selected>성별</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
				<%		
					}
				%>
			</select> <input type="text" class="form-control phone" id="contact_addr" name="contact_addr"
				placeholder="휴대폰번호(ex01012345678)" onKeyDown="return doKeyOnlyNumberPhone(event);" value="<%=CmmUtil.nvl(uDTO.getContact_addr())%>">
		</div>
			<div class="form-group">
			<select class="form-control selectYear" name="year" id="year">
				<option value="<%=CmmUtil.nvl(birthday[0])%>" selected><%=CmmUtil.nvl(birthday[0])%></option>
				<% for(int i=1900;i<=2017;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%
					}
				%>
				</select> 
				<select class="form-control selectMonth" name="month" id="month">
				<option value="<%=CmmUtil.nvl(birthday[1]) %>" selected><%=CmmUtil.nvl(birthday[1]) %></option>
				<% for(int i=1;i<=12;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select> <select class="form-control selectDay" name="day" id="day">
				<option value="<%=CmmUtil.nvl(birthday[2])%>" selected><%=CmmUtil.nvl(birthday[2])%></option>
				<% for(int i=1;i<=31;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select>
		</div>
		<button type="button" class="detailCart" onclick="doDelete();">회원탈퇴</button>
		<button class="detailSubmit">수정하기</button>
	</form>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>