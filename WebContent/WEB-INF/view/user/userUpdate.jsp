<%@ page language="java" contentType="text/html; charset=EUC-KR"
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
<link rel="stylesheet" href="/userBootstrap/css/tutle.min.css" />
<title>Insert title here</title>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<form class="form">
		<h4 class="formHead">필수 정보</h4>
		<div class="form-group">
			<input type="email" class="form-control email" id=""
				placeholder="이메일 입력"> <label>@</label> <input type="email"
				class="form-control email" id="">
			<p class="emailFont">e-mail은 변경이 불가능 합니다.</p>
		</div>
		<div class="form-group">
			<input type="password" class="form-control password" id=""
				placeholder="비밀번호"> <input type="password"
				class="form-control password" id="" placeholder="비밀번호 재확인">
			<p class="passwordFont">* 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.</p>
		</div>
		<div class="form-group">
			<input type="text" class="form-control name" id="" placeholder="이름">
			<select class="form-control selectSex">
				<option value="성별" selected>성별</option>
				<option value="Y">남</option>
				<option value="N">여</option>
			</select> <input type="text" class="form-control phone" id=""
				placeholder="휴대폰번호(ex01012345678)">
		</div>
		<div class="form-group">
			<select class="form-control selectYear">
				<option value="생년" selected>생년</option>
				<option value="1950">1950</option>
				<option value="1951">1951</option>
				<option value="1952">1952</option>
				<option value="1953">1953</option>
			</select> <select class="form-control selectMonth">
				<option value="월" selected>월</option>
				<option value="1950">1950</option>
				<option value="1951">1951</option>
				<option value="1952">1952</option>
				<option value="1953">1953</option>
			</select> <select class="form-control selectDay">
				<option value="일" selected>일</option>
				<option value="1950">1950</option>
				<option value="1951">1951</option>
				<option value="1952">1952</option>
				<option value="1953">1953</option>
			</select>
		</div>
		<button class="detailCart">회원탈퇴</button>
		<button class="detailSubmit">수정하기</button>
	</form>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>