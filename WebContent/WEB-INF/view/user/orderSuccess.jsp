<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<!-- Bootstrap theme -->
<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="bootstrap/css/footer.css" rel="stylesheet">
<link href="bootstrap/css/menu.css?ver=1" rel="stylesheet">
<link rel="stylesheet" href="bootstrap/css/nav.css?ver=1" />
<link rel="stylesheet" href="bootstrap/css/order.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
$(function(){
	$("#bcTarget").barcode("123456", "int25", {barWidth:1, barHeight:50});     
})
</script>
<title>결제 완료 화면</title>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row bottom-padding-20">
			<div align=center>
				<div id="bcTarget"></div>
				<div class="col-xs-12">
					<br> <span class="loginSpan1">정성을 다하는 스타벅스밥집</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="panel panel-default text-center">
				<div class="panel-body orderSuccessSpan">
					주문이 완료 되었습니다. <br>MENU - 주문내역에서 확인 하실 수 있습니다.
				</div>
			</div>
		</div>
		<div class="col-xs-12">
			<a href="NewFile.jsp"><button class="goMainP">메인화면으로 가기</button></a>
		</div>
		<div class="col-xs-12">
			<button class="detailSubmit">주문내역으로 가기</button>
		</div>
	</div>
	<br>
		<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>