<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<link rel="stylesheet" href="userBootstrap/css/nav.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	.input-group > input.listText{
		height:40px;
		width:75%;
	}
	.input-group{
	width:100%;
	}
	.listGroup{
		padding: 0px 0px;
		width:25%;
	}
	select.listSelect{
		height:39px;
		font-size: 11px;
		font-weight:bold;
		padding:0px 0px 0px 0px;
		text-align:center;
	}
	.searchButton{
		margin-left:3px;
		background-color:#FFFFFF;
		border: 4px #595959 solid;
		width:23%;
		height:40px;
		font-weight:bold;
		text-align:center;
		font-size:14px;
	}
	.input-group .form-control:not(:first-child):not(:last-child), .input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child) {
     	border-radius: 4px; 
	}
	
	table.tableFont > thead > tr > th{
		text-align:center;
		font-size:10px;
	}
	table.tableFont > tbody > tr > td{
		text-align:center;
		font-size:1px;
	}
	
	.moreButton{
		background-color:#3C3C3C;
		height:40px;
		color:#FFFFFF;
		text-align:center;
		width:100%;
		border : 0px;
		font-size : 20px;
		font-weight:bold;
		
	}
	/* 350px 이하 (아이폰5)*/
@media screen and (max-width: 350px) {

}
/* 351px 이상 370px 이하(갤럭시5) */
@media screen and (min-width: 351px) and (max-width: 370px){
	.searchButton{
			margin-left:3px;
			background-color:#FFFFFF;
			border: 4px #595959 solid;
			width:23.5%;
			height:40px;
			font-weight:bold;
			text-align:center;
			font-size:14px;
	}
	.input-group > input.listText{
		height:40px;
		width:75%;
	}
	.listGroup{
		padding: 0px 0px;
		width:28%;
	}
}
/* 371px 이상 400px 이하(아이폰6) */
@media screen and (min-width: 371px) and (max-width: 400px){
	.listGroup{
		padding: 0px 0px;
		width:31%;
	}
}
/* 401px 이상 700px 이하 (아이폰6플러스,넥서스)*/
@media screen and (min-width: 401px) and (max-width: 700px){
	.input-group > input.listText{
		height:40px;
	}
}

}
@media screen and (min-width: 701px) and (max-width: 1500px){

}
	
</style>
</head>
<body>
<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form class="form">
		<div class="orderHead">주문 내역</div>
		<div class="input-group">
			<div class="input-group-addon listGroup">
				<select class="form-control listSelect">
					<option>선택</option>
					<option>주문 번호</option>
					<option>날짜</option>
					<option>결제 금액</option>
					<option>주문 상태</option>
				</select>
			</div>
		<input type="text" class="form-control listText">
		<button class="searchButton">검색</button>
		</div>
		<table class="table table-hover tableFont table-relative">
			<thead>
				<th width=10%>주문번호</th>
				<th width=25%>주문내역</th>
				<th width=20%>날짜</th>
				<th width=20%>결제금액</th>
				<th width=20%>주문상태</th>
			</thead>
			<tbody>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			<tr>
				<td>10000000</td>
				<td>참치마요컵밥 외 3</td>
				<td>2017-05-08</td>
				<td>9500원</td>
				<td>조리대기</td>
			<tr>
			</tbody>
		</table>
		<button class="moreButton">더 보 기</button>
	</form>
	<br>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>