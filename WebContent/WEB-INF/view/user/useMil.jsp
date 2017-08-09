<%@page import="com.cupbob.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userMil = CmmUtil.nvl((String)request.getAttribute("userMil"));
%>
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
<script type="text/javascript">
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	function addComma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	function useMilPop(){
		var limitMil = parseInt($('#limitMil').text());
		var useInputMil = parseInt($('#useInputMil').val());
		if(useInputMil % 100 != 0){
			alert("마일리지는 100원 단위로 사용가능합니다");
			return;
		}
		if(useInputMil > limitMil){
			alert("마일리지가 사용 한도를 넘습니다.");
			return;
		}
		var html = "";
		html += "<p class=\"orderDetailLeft\">사용 마일리지</p>";
		html += "<p class=\"orderDetailRight\" id=\"userUseMil\">" + useInputMil + "</p>";
		html += "<a href=\"#\" onclick=\"useMil();\"><div class=\"orderHead\">마일리지 사용</div></a>";
		var price = parseInt(uncomma(opener.$('#resultPrice').text()));
		price = price - useInputMil;
		opener.$('#resultPrice').text(addComma(price) + "원"); 
		opener.document.getElementById("mil").innerHTML = html;
		window.close();
	}
</script>
<title>마일리지 사용화면</title>
</head>
<body>
				
	<div class="orderHead">마일리지 사용</div>
	<p class="orderDetailLeft">사용 가능 마일리지</p>
	<p class="orderDetailRight" id="limitMil"><%=userMil %></p>
	<hr class="orderHr">
	<div class="orderGroup">
		<h4 class="orderLabel">사용 마일리지</h4>
	</div>
	<div class="orderGroup">
		<input class="form-control orderText" type="text" id="useInputMil">
	</div>
	<button class="orderButton02" onclick="useMilPop();">사용하기</button>
</body>
</html>