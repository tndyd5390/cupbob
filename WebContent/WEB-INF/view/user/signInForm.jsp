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
			<p class="emailFont">회원님의 이메일은 추후 아이디로 사용됩니다.</p>
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
			<p class="nameFont">휴대폰 번호는 아이디 또는 비밀번호를 찾기 위한 정보이므로 정확하게 입력해
				주세요.</p>
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
		<h4 class="formHead">서비스 이용약관 동의</h4>
		<div class="service">
			서비스이용약관 <br> 1조 <br> 2조 <br> 3조 <br> 4조 <br>
			<br> <br> <br> <br> <br> <br> <br>
		</div>

		<div class="checkbox">
			<label> <input type="checkbox">
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
			<label> <input type="checkbox">
			<p class="checkboxFont">개인정보 취급방침에 동의합니다.</p>
			</label>
		</div>
		<h4 class="formHead">개인정보 취급 위탁 안내</h4>
		<div class="service">
			개인정보 취급 위탁 안내 <br> 1조 <br> 2조 <br> 3조 <br> 4조 <br>
			<br> <br> <br> <br> <br> <br> <br>
		</div>

		<div class="checkbox">
			<label> <input type="checkbox">
			<p class="checkboxFont">개인정보 취급 위탁에 대해 동의합니다.</p>
			</label>
		</div>
		<button class="detailCart">취소</button>
		<button class="detailSubmit">회원가입</button>
	</form>

	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>