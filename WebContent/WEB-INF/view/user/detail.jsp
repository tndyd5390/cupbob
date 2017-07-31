<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.Product_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
	Product_infoDTO pDTO = (Product_infoDTO)request.getAttribute("pDTO");
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<link rel="stylesheet" href="userBootstrap/css/nav.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">

	function addItemCnt(){
		var qty = parseInt($('#itemQty').val());
		if(qty < 99){
			qty = qty +1;			
			$('#itemQty').val(qty);
			$('#itemPrice').text(qty * <%=CmmUtil.nvl(pDTO.getPrdt_price())%>);
		}
	}
	
	function minusItemCnt(){
		var qty = $('#itemQty').val();
		if(qty > 1){
			qty = qty -1;			
			$('#itemQty').val(qty);				
			$('#itemPrice').text(qty * <%=CmmUtil.nvl(pDTO.getPrdt_price())%>);
		}
	}
</script>
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
					<span class="detailNameKor"> <strong><%=CmmUtil.nvl(pDTO.getPrdt_name()) %></strong>
					</span>
				</div>
				<div>
					<span class="detailNameEng"> bulgogi cupbob 240g </span>
				</div>
				<div>
					<span class="detailTxt"><%=CmmUtil.nvl(pDTO.getContents()) %></span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="d-Img">
				<img
					src="<%="menuImg/" + CmmUtil.nvl(pDTO.getFile_name()) %>"
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
					<li><%=CmmUtil.nvl(pDTO.getPrdt_kcal()) + "kcal" %> / 0000g</li>
					<li>120g</li>
					<li>300mg</li>
				</ul>
			</div>
		</div>
		<br> <br> <br>
		<hr class="garo">
		<div style="padding-bottom: 50px;">
			<div class="col-xs-6">
				<span style="display: block;"> <a class="detailPlMi" onclick="minusItemCnt();">-</a> <input
					type="text" value="1" class="detailCount" maxlength="2" readOnly id="itemQty"> <a
					class="detailPlMi" onclick="addItemCnt();">+</a>
				</span>
			</div>
			<div class="col-xs-6" style="text-align: right;">
				<span class="detailPrice" id="itemPrice"><%=CmmUtil.nvl(pDTO.getPrdt_price()) %></span><span class="detailWon">원</span>
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