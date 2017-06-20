<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<User_infoDTO> uList = (List<User_infoDTO>) request.getAttribute("UserList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<%@include file="/include/head.jsp"%>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>소라네 밥집 </title>

</head>

<body>

	<%@include file="/include/naviBarAndasideBar.jsp"%>
	
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-table"></i> 회원 목록
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="adminMain.do">메인 화면</a></li>
				<li><i class="fa fa-th-list"></i>회원 목록</li>
			</ol>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-12">
			<section class="panel">
				<header class="panel-heading"> 회원 목록  </header>
			<div class="table-responsive">
				<table class="table" align="center">
					<thead>
						<tr>
							<th><input type="checkbox" id="inlineCheckbox1"	value="option1"></th>
							<th>회원번호</th>
							<th>아이디</th>
							<th>회원이름</th>
							<th>가입일</th>
							<th>연락처</th>
						</tr>
					</thead>
					
					<tbody>
						<%
							for (User_infoDTO udto : uList) {
						%>
						<tr>
							<td><input type="checkbox" id="inlineCheckbox1"	value="option2"></td>
							<td><%=udto.getUser_no()%></td>
							<td><a href="#"><%=udto.getUser_id()%></a></td>
							<td><%=udto.getUser_name()%></td>
							<td><%=udto.getReg_dt()%></td>
							<td><%=udto.getContact_addr()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				
				<div style="float: right">
					<a class="btn btn-info" href="#" title="클릭하시면 선택항목이 삭제됩니다.">삭제</a>
				</div>
			</div>
<<<<<<< HEAD
=======
                 <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              	회원 목록	
                          </header>
                          <div class="table-responsive">
                            <table class="table">
                              <thead>
                                <tr>
                                  <th>
                                  	<input type="checkbox" id="inlineCheckbox1" value="option1"> 
                                  </th>
                                  <th>회원번호</th>
                                  <th>아이디</th>
                                  <th>회원이름</th>
                                  <th>가입일</th>
                                  <th>연락처</th>
                                </tr>
                              </thead>
                              <tbody>
                                <tr>
                                  <td><input type="checkbox" id="inlineCheckbox1" value="option2"></td>
                                  <td>20170003</td>
                                  <td><a href="adminUserDetail1.do">1158816@naver.com</a></td>
                                  <td>김상훈</td>
                                  <td>20171107</td>
                                  <td>01095989408</td>
                                </tr>
                                <tr>
                                  <td><input type="checkbox" id="inlineCheckbox1" value="option2"></td>
                                  <td>20170002</td>
                                  <td><a href="adminUserDetail2.do">tndyd5390@naver.com</a></td>
                                  <td>박수용</td>
                                  <td>20171107</td>
                                  <td>01057907883</td>
                                </tr>
                                <tr>
                                  <td><input type="checkbox" id="inlineCheckbox1" value="option2"></td>
                                  <td>20170001</td>
                                  <td><a href="adminUserDetail3.do">rambo@naver.com</a></td>
                                  <td>최한용</td>
                                  <td>20171107</td>
                                  <td>01012345678</td>
                                </tr>
                           
                              </tbody>
                            </table>
									<div style = float:right>
									<a class="btn btn-info" href="#" title="클릭하시면 선택하신것들이 삭제됩니다.">삭제</a>
									</div>
                          </div>
>>>>>>> refs/remotes/origin/psytestbranch

			</section>
		</div>
	</div>


	</section>
	</section>
	
	<%@ include file="/include/bottomJavaScript.jsp" %>
	
</body>

</html>