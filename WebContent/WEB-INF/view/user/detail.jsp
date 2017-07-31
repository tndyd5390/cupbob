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
	<div class="container-fluid">
		<div class="row">
			<div class="detailTitle">
				<div>
					<span class="detailNameKor"> <strong>햇반 컵밥 불고기 덮밥
							240g</strong>
					</span>
				</div>
				<div>
					<span class="detailNameEng"> bulgogi cupbob 240g </span>
				</div>
				<div>
					<span class="detailTxt"> 쇠고기를 얇게 저며 양념하여 재었다가 불에 구운 환상의 맛! </span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="d-Img">
				<img
					src="http://costco.co.kr/medias/sys_master/h1e/hde/9173694775326.jpg"
					class="detailImg">
			</div>
		</div>
		<div>
			<div class="col-xs-6">
				<ul class="detailListKal">
					<li>총 칼로리</li>
					<li>나트륨</li>
					<li>단백질</li>
				</ul>
			</div>
			<div class="col-xs-6">
				<ul class="detailListUnstyle">
					<li>0000kal / 0000g</li>
					<li>120g</li>
					<li>300mg</li>
				</ul>
			</div>
		</div>
		<br> <br> <br>
		<hr class="garo">
		<div style="padding-bottom: 50px;">
			<div class="col-xs-6">
				<span style="display: block;"> <a class="detailPlMi">-</a> <input
					type="text" value="2" class="detailCount" maxlength="2" readOnly> <a
					class="detailPlMi">+</a>
				</span>
			</div>
			<div class="col-xs-6" style="text-align: right;">
				<span class="detailPrice">3,150</span><span class="detailWon">원</span>
			</div>
		</div>
		<div class="row">
			<div>
				<div class="col-xs-6">
					<button class="detailCart">상품담기</button>
				</div>
				<div class="col-xs-6">
					<a href="order.jsp"><button class="detailSubmit">바로결제</button></a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>