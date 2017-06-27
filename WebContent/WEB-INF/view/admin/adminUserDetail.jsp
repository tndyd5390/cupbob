<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@page import="com.cupbob.util.CmmUtil" %>
<%
	User_infoDTO udto = (User_infoDTO)request.getAttribute("udto");
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<script>
	function doUpdate(){
		var f = $('#f');
		if(confirm("수정하시겠습니까?")){
			return true
		}else{
			return false
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세 보기</title>
</head>
<body>
<%@include file="/include/naviBarAndasideBar.jsp"%>
	<section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="icon_profile"></i>회원 관리</h3>
					<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="orderList.do">메인 화면</a></li>
				<li><i class="icon_profile"></i><a href="adminUserList.do">회원 관리</a></li>
				<li><i class="icon_documents_alt"></i>회원 상세</li>
			</ol>
				</div>
			</div>
			<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			회원가입 </header>
			<div class="panel-body">
				<div class="form">
					<form class="form-validate form-horizontal " id="f" method="post" action="adminUserUpdateProc.do" onsubmit="return doUpdate();">
						<input type=hidden name="uNum" value="<%=CmmUtil.nvl(udto.getUser_no())%>">
						<div class="form-group ">
							<label for="fullname" class="control-label col-lg-2">성명 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class=" form-control" id="cname" name="user_name" type="text" value="<%=CmmUtil.nvl(udto.getUser_name())%>" />
							</div>
						</div>
						<div class="form-group ">
							<label for="email" class="control-label col-lg-2">이메일 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="email" name="email" type="email" value="<%=CmmUtil.nvl(udto.getEmail())%>" readonly/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-2" for="inputSuccess">성별</label>
							<div class="col-lg-10">
								<input class="form-control " id="gender" name="gender" type="gender" value="<%=CmmUtil.nvl(udto.getGender())%>"disabled/>
							</div>
						</div>
						<div class="form-group ">
							<label for="username" class="control-label col-lg-2">생년월일 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="username" name="birthday" type="text" value="<%=CmmUtil.nvl(udto.getBirthday())%>"/>
							</div>
						</div>
						<div class="form-group ">
							<label for="username" class="control-label col-lg-2">연락처 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="phone" name="phone" type="text" value="<%=CmmUtil.nvl(udto.getContact_addr())%>"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
							
							<div style = float:right>
								<button class="btn btn-primary" type="submit" >수정</button>
								<button class="btn btn-default" type="button" onclick = "location.href='adminUserDelete.do?unum=<%=CmmUtil.nvl(udto.getUser_no())%>'">삭제</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			</section>
		</div>
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>