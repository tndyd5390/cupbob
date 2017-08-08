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

<title>소라네 컵밥에 오신걸 환영합니다 !!</title>
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
						src="http://meiz.me/wp-content/uploads/2015/07/sta01-1024x682.jpg"
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
		<form class="form-horizontal">
			<div class="form-group">
				<div class="col-xs-12">
					<input type="email" class="form-control" id=""
						placeholder="이메일을 입력하세요">
				</div>
			</div>
			<div class="form-group">
				<div class="col-xs-12">
					<input type="password" class="form-control" id="" placeholder="암호">
				</div>
			</div>
			<button class="detailSubmit">로그인</button>
		</form>
		<br>
		<div class="col-xs-6 text-center">
			<a href="userFind.jsp" class="loginA">아이디/비밀번호 찾기</a>
		</div>
		<div class="col-xs-6 text-center">
			<a href="userReg.jsp" class="loginA">회원가입</a>
		</div>

	</div>
	<br>
		<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>