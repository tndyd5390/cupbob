<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<User_boardDTO> bList = (List<User_boardDTO>)request.getAttribute("userBoardList");
%>
	
<!DOCTYPE html>
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

</head>
<body>
	<%@include file="/include/nav.jsp"%>
		<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<ul class="list-group list-group-none-line">
				<%
					for (User_boardDTO bDTO : bList) {
				%>
				<li class="list-group-item list-none-line">
					<div class="contentsArea">
						<h4>
							<a href="userBoardDetail.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>"class="contentsLink"><%=CmmUtil.nvl(bDTO.getTitle())%></a>
						</h4>
						<span style="vaerical-align: middle;"></span>
					</div>
					<div class="contentsInfo">
						<span><%=CmmUtil.nvl(bDTO.getUser_name())%></span> | <span><%=CmmUtil.nvl(bDTO.getReg_dt()) %></span> | <span>조회수</span> | <span><%=CmmUtil.nvl(bDTO.getView_cnt()) %></span>
					</div>
				</li>
				<%
					}
				%>
			</ul>
			<div class="col-xs-12">
			<button class="saButton2" border-radius= "5px" onclick="location.href='userBoardReg.do'">글작성</button>
			</div>
			<br /><br />
				<div class="col-xs-12">
					<button class="moreContents" >더보기</button>
				</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>