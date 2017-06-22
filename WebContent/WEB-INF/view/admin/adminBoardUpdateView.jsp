<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User_boardDTO bdto = (User_boardDTO)request.getAttribute("bdto");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<script type="text/javascript">
	function doSubmit(){
		document.getElementById("f").submit();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	<!-- 회원가입 폼 시작-->
	<!--main content start-->
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-table"></i> 게시판
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="adminMain.do">메인 화면</a></li>
				<li><i class="fa fa-table"></i><a href="adminBoardList.do">게시판 관리</a></li>
				<li><i class="fa fa-th-list"></i>게시글 상세</li>
			</ol>
		</div>
	</div>
	<!-- page start-->
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			게시글 상세 </header>
			<div class="panel-body">
			<form action="adminBoardUpdate.do" method="post" id="f">
				<input type="hidden" name="bnum" value="<%=CmmUtil.nvl(bdto.getPost_no()) %>">
				<table class="table table-striped table-advance table-hover">
					<tbody>
						<tr>
							<th width="10%"><center>
									</i>제목
								</center></th>
							<th width="45%"><input class="form-control" name="title" type="text" value="<%=CmmUtil.nvl(bdto.getTitle()) %>"></th>
							<th width="20%"><center><%=CmmUtil.nvl(bdto.getReg_dt()) %></center></th>
							<th width="20%"><center>
									<i class="icon_profile"></i> <%=CmmUtil.nvl(bdto.getUser_id()) %>
								</center></th>
						</tr>
					</tbody>
				</table>
				<div class="form-group ">
					<div class="col-lg-12">
						<textarea class="form-control " id="contents" name="contents"
							rows="10"><%=CmmUtil.nvl(bdto.getContents()) %></textarea>
					</div>
				</div>
				</form>
			</div>
			</section>
			<div style="float: right">
				<a class="btn btn-info" href="#" title="선택하신게 수정됩니다." onclick="doSubmit()">수정</a>
				<a class="btn btn-info" href="adminBoardDetailDelete.do?bnum=<%=CmmUtil.nvl(bdto.getPost_no()) %>" title="선택하신게 삭제됩니다.">삭제</a>
			</div>
		</div>

	</div>
	</section> <!-- page end--> </section>
	</section>
	<!-- page end-->
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>