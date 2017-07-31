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
	<form class="form">
		<br> <br> <br>
		<div class="orderHead">주문 정보 입력</div>
		<div class="orderGroup">
			<h4 class="orderLabel">
				수령 시간
				<h4>
		</div>
		<div class="orderGroup">
			<select class="orderSelect form-control">
				<option value="12:00">12 : 00</option>
				<option value="12:10">12 : 10</option>
				<option value="12:20">12 : 20</option>
				<option value="12:30">12 : 30</option>
				<option value="12:40">12 : 40</option>
				<option value="12:50">12 : 50</option>
				<option value="13:00">13 : 00</option>
			</select>
		</div>
		<hr class="orderHr">
		<div class="orderGroup">
			<h4 class="orderLabel">
				주문 고객
				<h4>
		</div>
		<div class="orderGroup">
			<input class="form-control orderText" type="text" name="" value="">
		</div>
		<hr class="orderHr">
		<div class="orderGroup">
			<h4 class="orderLabel">
				연락처
				<h4>
		</div>
		<div class="orderGroup">
			<input class="form-control orderText" type="text" name="" value="">
		</div>
		<hr class="orderHr">
		<div class="orderGroupArea">
			<h4 class="orderLabel">
				요청 사항
				<h4>
					<textarea class="form-control orderTextArea" rows="6"></textarea>
		</div>
		<hr class="orderHr">
		<div class="checkbox icheck-asbestos">
			<input type="checkbox" id="asbestos" /> <label for="asbestos">
				<p class="checkboxFont">회원 정보와 동일 합니다.</p>
			</label>
		</div>
		<div class="orderHead">주문 내역</div>
	</form>
	<form class="form">
		<p class="orderDetailLeft">참치마요컵밥</p>
		<p class="orderDetailRight">금액</p>
		<p class="orderDetailLeft">수량 : 1개</p>
		<p class="orderDetailRight">2,500원</p>
		<hr class="orderHr">
		<p class="orderDetailLeft">소불고기컵밥</p>
		<p class="orderDetailRight">금액</p>
		<p class="orderDetailLeft">수량 : 1개</p>
		<p class="orderDetailRight">2,800원</p>
		<hr class="orderHr">
		<p class="orderDetailLeft">콜라</p>
		<p class="orderDetailRight">금액</p>
		<p class="orderDetailLeft">수량 : 1개</p>
		<p class="orderDetailRight">1,200원</p>
		<div class="orderTotalPrice">
			<p class="totalPriceLeft">결제 예정 금액</p>
			<p class="totalPriceRight">6,500원</p>
		</div>
		<div class="radio icheck-asbestos">
			<input type="radio" id="asbestos1" name="asbestos" /> <label
				for="asbestos1">휴대폰 소액 결제</label>
		</div>
		<div class="radio icheck-asbestos">
			<input type="radio" id="asbestos2" name="asbestos" /> <label
				for="asbestos2">신용카드(온라인 결제)</label>
		</div>
	</form>
		<a href="orderSuccess.jsp"><button class="orderButton02">결제 하기</button></a>

	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>