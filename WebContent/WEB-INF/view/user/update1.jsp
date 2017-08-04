<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="userBootstrap/css/tutle.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<title>소라네 컵밥 회원정보 수정</title>
</head>
<body>
	<div>
		<%@include file="/include/nav.jsp"%>
	</div>
	<br>
	<br>
	<br>
	<br>
	<form class="form">
		<div class="orderHead">회원 정보 수정</div>
		<p class="updateFont">
			고객님의 소중한 개인정보 보호를 위해<br> 비밀번호를 다시 한번 입력해주시기 바랍니다.
		</p>
		<input class="form-control updatePW" type="password"
			placeholder="비밀번호 입력">
		<button class="orderButton02">확인</button>
	</form>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>