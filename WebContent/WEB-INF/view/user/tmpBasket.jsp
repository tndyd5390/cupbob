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
	<div class="row" style="margin: 10px;">
		<form action="" method="post">
			<div class="tmpBasketHead">장바구니</div>
			<div class="col-xs-12">
				<input type="checkbox">
				<div class="tmpBasketText">참치마요 덮밥</div>
				<a href="#" class="tmpBasketPlMi">-</a> <input type="text" value="2"
					class="tmpBasketCount" maxlength="2" readonly> <a href="#"
					class="tmpBasketPlMi">+</a>
				<div class="tmpBasketPrice">2500원</div>
				<a href="#"><img src="bootstrap/navImage/recommend.png"
					class="tmpBasketDeleteImg"></a>
				<hr class="tmpBasketHr">
			</div>
			<div class="col-xs-12">
				<input type="checkbox">
				<div class="tmpBasketText">참치마요 덮밥</div>
				<a href="#" class="tmpBasketPlMi">-</a> <input type="text" value="2"
					class="tmpBasketCount" maxlength="2" readonly> <a href="#"
					class="tmpBasketPlMi">+</a>
				<div class="tmpBasketPrice">2500원</div>
				<a href="#"><img src="bootstrap/navImage/recommend.png"
					class="tmpBasketDeleteImg"></a>
				<hr class="tmpBasketHr">
			</div>
			<div class="col-xs-12">
				<input type="checkbox">
				<div class="tmpBasketText">참치마요 덮밥</div>
				<a href="#" class="tmpBasketPlMi">-</a> <input type="text" value="2"
					class="tmpBasketCount" maxlength="2" readonly> <a href="#"
					class="tmpBasketPlMi">+</a>
				<div class="tmpBasketPrice">2500원</div>
				<a href="#"><img src="bootstrap/navImage/recommend.png"
					class="tmpBasketDeleteImg"></a>
				<hr class="tmpBasketHr">
			</div>
			<div class="tmpBasketResult">
				<div class="tmpBasketResultPriceText">결제 예정금액</div>
				<div class="tmpBasketResultPrice">7500원</div>
			</div>
			<div class="col-xs-12">
				<div class="col-xs-6" style="padding: 0px 10px 0px 0px;">
					<button class="tmpBasketSelectDeleteButton">선택삭제</button>
				</div>
				<div class="col-xs-6" style="padding: 0px 0px 0px 10px;">
					<button class="tmpBasketKeepShopping">계속 쇼핑하기</button>
				</div>
			</div>
			<div class="col-xs-12">
				<button class="tmpBasketOrder">주문 하기</button>
			</div>
		</form>
		<br>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>