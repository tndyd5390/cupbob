<%@page import="com.cupbob.dto.TmpBasketDTO"%>
<%@page import="java.util.Map"%>
<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.Product_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userNo = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
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
<title>소라네 컵밥 메뉴 상세보기</title>
<script type="text/javascript">

	function addComma(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	function addItemCnt(){
		var qty = parseInt($('#itemQty').val());
		if(qty < 99){
			qty = qty +1;			
			$('#itemQty').val(qty);
			$('#itemPrice').text(addComma(qty * <%=CmmUtil.nvl(pDTO.getPrdt_price())%>));
		}
	}
	
	function minusItemCnt(){
		var qty = $('#itemQty').val();
		if(qty > 1){
			qty = qty -1;			
			$('#itemQty').val(qty);				
			$('#itemPrice').text(addComma(qty * <%=CmmUtil.nvl(pDTO.getPrdt_price())%>));
		}
	}
	
	function addTmpBasket(){
		$.ajax ({
			url : "userAddTmpBasket.do",
			method : "post",
			data : {
				'prdtNo' : <%=CmmUtil.nvl(pDTO.getPrdt_no())%>,
				'prdtPrice' : <%=CmmUtil.nvl(pDTO.getPrdt_price())%>,
				'prdtQty' : $('#itemQty').val(),
				'prdtName' : "<%=CmmUtil.nvl(pDTO.getPrdt_name())%>"
			},
			success : function(data){
				alert('장바구니에 추가되었습니다.');
			},
			error:function(x,e){
				if(x.status==0){
		            alert('네트워크가 정상적으로 동작하지 않습니다.');
		            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
		            }else if(x.status==404){
		            alert('페이지를 찾을수가 없습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
		            }else if(x.status==500){
		            alert('서버에서 오류가 발생했습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
		            }else if(e=='parsererror'){
		            alert('json파싱에 실패했습니다.');
		            }else if(e=='timeout'){
		            alert('응답 요청 시간이 지났습니다.');
		            }else {
		            alert('Unknow Error.n'+x.responseText);
		            }
		    }
		});
	}
	var ss_userNo = "<%=userNo%>";

	function orderDirect(){
		console.log(ss_userNo);
	if(ss_userNo==""){
		alert("로그인이 필요합니다");
		location.href="userLogin.do";
		return false;
	}else{
		var f = document.getElementById('f');
		f.qty.value = document.getElementById('itemQty').value;
		f.submit();		
		return true
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
					<span class="detailNameEng"> <%=CmmUtil.nvl(pDTO.getPrdt_name()) %> </span>
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
					class="menuIconImg">
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
				<span class="detailPrice" id="itemPrice"><%=CmmUtil.nvl(CmmUtil.addComma(pDTO.getPrdt_price())) %></span><span class="detailWon">원</span>
			</div>
		</div>
		<div class="row">
			<div>
				<div class="col-xs-6">
					<button class="detailCart" onclick="addTmpBasket();">상품담기</button>
				</div>
				<div class="col-xs-6">
				<form action="userOrderDirect.do" method="post" id="f">
					<input type="hidden" name="prdtNo" value="<%=CmmUtil.nvl(pDTO.getPrdt_no()) %>">
					<input type="hidden" name="qty" id="qty">
					<input type="hidden" name="price" value="<%=CmmUtil.nvl(pDTO.getPrdt_price()) %>">
					<input type="hidden" name="prdtName" value="<%=CmmUtil.nvl(pDTO.getPrdt_name())%>">
					<a href="#"><button class="detailSubmit" onclick="return orderDirect();">바로결제</button></a>
				</form>
				</div>
			</div>
		</div>
	</div>
	<br>
		<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>