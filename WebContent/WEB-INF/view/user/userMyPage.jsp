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
<title>유저 마이페이지</title>
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
		<div class="orderHead">마이페이지</div>
		<div class="profileImg">
		<img
						src="http://via.placeholder.com/120x150"
						class="profileImg">
		</div>
		<h3 class="myPageName">최한용 님</h3>
		<p class="myPageFont">이메일 : rambo0228@naver.com</p> 
		<p class="myPageFont">핸드폰 번호 : 01051776537</p> 
		<p class="myPageFont">생 년 월 일 : 1993 년 12월 10일</p>
		<button class="myPageButton01">회원 정보 수정</button>
		<hr class="myPageHr">
		<p class="myPageFont">현재 적립금 : 12000원</p>
		<ul class="list-inline pointHead">
		  <li class="myPageLeft">적립 금액</li>
		  <li class="myPageCenterHead">구분</li>
		  <li class="myPageRight">적립 시기</li>
		</ul>
		<ul class="list-inline">
		  <li class="myPageLeft">300원</li>
		  <li class="myPageCenter">숙주 나물 컵밥 외 3건 주문</li>
		  <li class="myPageRight"> 2017년 10월 31일</li>
		</ul>
		<hr class="myPageHr">
		<ul class="list-inline">
		  <li class="myPageLeft">300원</li>
		  <li class="myPageCenter">숙주 나물 컵밥 외 3건 주문</li>
		  <li class="myPageRight"> 2017년 10월 31일</li>
		</ul>
		<hr class="myPageHr">
		<ul class="list-inline">
		  <li class="myPageLeft">300원</li>
		  <li class="myPageCenter">숙주 나물 컵밥 외 3건 주문</li>
		  <li class="myPageRight"> 2017년 10월 31일</li>
		</ul>
		<hr class="myPageHr">
		<ul class="list-inline">
		  <li class="myPageLeft">300원</li>
		  <li class="myPageCenter">숙주 나물 컵밥 외 3건 주문</li>
		  <li class="myPageRight"> 2017년 10월 31일</li>
		</ul>
		<hr class="myPageHr">
		<ul class="list-inline">
		  <li class="myPageLeft">300원</li>
		  <li class="myPageCenter">숙주 나물 컵밥 외 3건 주문</li>
		  <li class="myPageRight"> 2017년 10월 31일</li>
		</ul>
		<hr class="myPageHr">
	</form>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>