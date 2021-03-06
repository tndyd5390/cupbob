<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<title>소라네 컵밥 로그인</title>
</head>
<body>
	<div>
		<%@include file="/include/nav.jsp"%>
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row bottom-padding-20">
			<div class="text-center">
				<div class="col-xs-12">
					<img
						src="menuImg/front.png"
						class="loginImg">
				</div>
				<div class="col-xs-12">
					<br> <span class="loginSpan1">정성을 다하는 소라네 밥집</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="panel panel-default text-center">
				<div class="panel-body loginSpan2">회원 로그인</div>
			</div>
		</div>
		<form class="form-horizontal" action="userLoginProc.do" method="post" id="form">
			<div class="form-group">
				<div class="col-xs-12">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="이메일을 입력하세요">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<input type="password" class="form-control" id="password" placeholder="암호" name="password">
				</div>
			</div>
			<button class="detailSubmit" id="userLoginButton">로그인</button>
		</form>
		<br>
		<div class="col-xs-6 text-center">
			<a href="userFind.do" class="loginA">아이디/비밀번호 찾기</a>
		</div>
		<div class="col-xs-6 text-center">
			<a href="userSignIn.do" class="loginA">회원가입</a>
		</div>
	</div>
	<br>
		<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
	<script>
$( "#userLoginButton" ).click(function() {
	  if($('#email').val() == ""){
		  alert("이메일을 입력하세요")
		  email.focus();
		  return false;
	  }else if($('#password').val() == ""){
		  alert("비밀번호를 입력하세요")
		  password.focus();
		  return false;
	  }
});

</script>
</body>
</html>