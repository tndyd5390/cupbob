<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.Order_itemDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userNo = (String)session.getAttribute("ss_user_no");
	List<Order_itemDTO> otList = (List<Order_itemDTO>)request.getAttribute("otList");


	if(CmmUtil.nvl(userNo).equals("")){
		response.sendRedirect("userLogin.do");
	}
	String ordNo = CmmUtil.nvl((String)request.getAttribute("ordNo"));
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
<script>
$(function(){
	$("#bcTarget").barcode('<%=ordNo%>', "code128", {barWidth:2, barHeight:60});     
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
					<br> 
					<%
							if(otList.size()>1){%>
						<span class="loginSpan1"><%=CmmUtil.nvl(otList.get(0).getPrdt_name())%> 외 <%=otList.size()-1%>건</span>
							<%
							}else{
							%>	
						<span class="loginSpan1"><%=CmmUtil.nvl(otList.get(0).getPrdt_name())%></span>
							<%
							}
							%>
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
			<a href="userMenuList.do"><button class="goMainP">메인화면으로 가기</button></a>
		</div>
		<div class="col-xs-12">
			<a href="userOrderList.do?uNum=<%=userNo%>"><button class="detailSubmit">주문내역으로 가기</button></a>
		</div>
	</div>
	<br>
		<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>