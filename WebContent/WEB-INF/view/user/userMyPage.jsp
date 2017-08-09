<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@page import="com.cupbob.dto.MilHistoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String unum = request.getParameter("unum");
	User_infoDTO uDTO = (User_infoDTO) request.getAttribute("uDTO");
	List<MilHistoryDTO> mList = (List<MilHistoryDTO>) request.getAttribute("mList");
	String ss_user_no = (String) session.getAttribute("ss_user_no");
%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<script type="text/javascript">
	function logout() {
		if (confirm("로그아웃 하시겠습니까?")) {
			location.href = "logout.do";
			return true;
		} else {
			return false;
		}

	}
</script>
<title>소라네 컵밥 마이페이지</title>
</head>
<%
	if (ss_user_no == "" || !(ss_user_no.equals(unum))) {
		response.sendRedirect("userLogin.do");
	} else {
%>
<body>
	<div>
		<%@include file="/include/nav.jsp"%>
	</div>
	<br>
	<br>
	<br>
	<br>
	<form class="form"
		action="userUpdateCheck.do?uNum=<%=CmmUtil.nvl(uDTO.getUser_no())%>"
		method="post">
		<div class="orderHead">마이페이지</div>
		<div class="profileImg">
			<img src="http://via.placeholder.com/120x150" class="profileImg">
		</div>
		<h3 class="myPageName"><%=CmmUtil.nvl(uDTO.getUser_name())%></h3>
		<p class="myPageFont">
			이메일 :
			<%=CmmUtil.nvl(uDTO.getEmail())%></p>
		<p class="myPageFont">
			핸드폰 번호 :
			<%=CmmUtil.nvl(uDTO.getContact_addr())%></p>
		<p class="myPageFont">
			생 년 월 일 :
			<%=CmmUtil.nvl(uDTO.getBirthday())%></p>
		<button class="myPageButton01">회원 정보 수정</button>
		<hr class="myPageHr">
		<p class="myPageFont">
			현재 적립금 :
			<%=CmmUtil.nvl(CmmUtil.addComma(uDTO.getMileage()))%>
			원
		</p>
		<ul class="list-inline pointHead">
			<li class="myPageLeft">금액</li>
			<li class="myPageCenterHead">주문번호</li>
			<li class="myPageRight">적립 시기</li>
		</ul>
		<%
			if (mList.size()==0) {
		%>
			<h3 align="center">적립금액이 없습니다.</h3>
		<%
			} else {
		%>
		<%
			for (MilHistoryDTO mDTO : mList) {
		%>
		<ul class="list-inline">
			<%
				if (CmmUtil.nvl(mDTO.getSave()).equals("")) {
			%>
			<li class="myPageLeft">-<%=mDTO.getSpend()%> 사용
			</li>
			<%
				} else {
			%>
			<li class="myPageLeft">+<%=mDTO.getSave()%> 적립
			</li>
			<%
				}
			%>
			<li class="myPageCenter">주문번호 <%=CmmUtil.nvl(mDTO.getOrd_no())%></li>
			<li class="myPageRight"><%=CmmUtil.nvl(mDTO.getReg_dt())%></li>
		</ul>
		<hr class="myPageHr">
		<%
			}
		%>
		<%
			}
		%>
	</form>
	<button class="myPageButton01" onclick="return logout();">로그아웃</button>
	<br>
	<div align="center">
		<%@include file="/include/footer.jsp"%>
	</div>
</body>
<%
	}
%>
</html>