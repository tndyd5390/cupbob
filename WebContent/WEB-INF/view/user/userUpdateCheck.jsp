<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User_infoDTO uDTO = (User_infoDTO) request.getAttribute("uDTO");
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

<title>소라네 컵밥 회원정보 수정</title>
<script>
function doSubmit(){
	var password = $('#password').val();
	
	if(password.val().equals("")){
		alert("비밀번호를 입력하세요");
		password.focus();
		return false;
	}else{
		return true;
	}
}

</script>
</head>
<body>
	<div>
		<%@include file="/include/nav.jsp"%>
	</div>
	<br>
	<br>
	<br>
	<br>
	<form class="form" action="userUpdateCheckProc.do?uNum=<%=CmmUtil.nvl(uDTO.getUser_no())%>" method="post" onsubmit="return doSubmit();">
		<div class="orderHead">회원 정보 수정</div>
		<p class="updateFont">
			고객님의 소중한 개인정보 보호를 위해<br> 비밀번호를 다시 한번 입력해주시기 바랍니다.
		</p>
		<input class="form-control updatePW" type="password" name="password" id="password"
			placeholder="비밀번호 입력">
		<button class="orderButton02">확인</button>
	</form>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>