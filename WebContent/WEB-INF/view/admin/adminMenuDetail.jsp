<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.Product_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<%
	Product_infoDTO pDTO = (Product_infoDTO)request.getAttribute("pDTO");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 상세 보기</title>
</head>
<body>
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	 <section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">메뉴 관리</h3>
			<ol class="breadcrumb">
				<li><i class="icon_house_alt"></i><a href="adminMain.do">메인 화면</a></li>
				<li><i class="icon_document_alt"></i><a href="adminMenuList.do">메뉴 관리</a></li>
				<li><i class="icon_document_alt"></i>메뉴 등록</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			메뉴 등록</header>
			<div class="panel-body">
					<!-- <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                  </div> -->
					<div class="col-lg-5">
						<center><span class="profile-ava"> <img alt=""
							src="<%= "menuImg/" + pDTO.getFile_name() %>"
							style="width: 400px" style="height:400px">
						</span>
					</center>
					</div>
					
					<div class="col-lg-7">
						<div class="form-group">
							<label class="control-label col-sm-4">상품명</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" value="<%=CmmUtil.nvl(pDTO.getPrdt_name()) %>" size="16"
									class="form-control" readonly >
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">가격</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" value="<%=CmmUtil.nvl(pDTO.getPrdt_price()) %>" size="16"
									class="form-control" readonly>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">kcal</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" value="<%=CmmUtil.nvl(pDTO.getPrdt_kcal() + "kcal") %>" size="16"
									class="form-control" readonly>
							</div>
						</div>
						
					
						<div class="form-group">
							<!-- <label class="control-label col-sm-2">상세 설명</label>
							<div class="col-sm-10">
								<textarea class="form-control ckeditor" name="editor1" rows="6"></textarea>
							</div> -->
							<label class="control-label col-sm-2">상세 설명</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="editor1" rows="6" readonly><%=CmmUtil.nvl(pDTO.getContents()) %></textarea>
							</div>
						</div> 
						<span style="float:right">
							<a class="btn btn-info" href="adminMenuUpdateView.do?pnum=<%=CmmUtil.nvl(pDTO.getPrdt_no()) %>" title="클릭하시면 수정 됩니다.">수정</a>
				<a class="btn btn-info" href="adminMenuDeleteOne.do?pnum=<%=CmmUtil.nvl(pDTO.getPrdt_no()) %>" title="클릭하시면 삭제됩니다.">삭제</a>
						</span>
					</div>
			</div>
			</section>
		</div>
	</div>
	</section> </section> </section>

	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>