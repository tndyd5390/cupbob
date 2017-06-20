<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
				<form class="form-horizontal">
					<div class="col-lg-5">
						<center><span class="profile-ava"> <img alt=""
							src="http://placehold.it/400x400"
							style="width: 400px" style="height:400px">
						</span>
						
						<input type="file" id="exampleInputFile">
						<p class="help-block">현재 이미지 그대로 사용자 화면에 업로드 됩니다.</p>
					</center>
					</div>
					
					<div class="col-lg-7">
						<div class="form-group">
							<label class="control-label col-sm-4">상품명</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" placeholder="상품명" size="16"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">가격</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" placeholder="가격" size="16"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">kcal</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" placeholder="kcal" size="16"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">재료</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" placeholder="재료" size="16"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">날짜</label>
							<div class="col-sm-6">


								<div class="input-append date" id="dpYears"
									data-date="18-06-2013" data-date-format="dd-mm-yyyy"
									data-date-viewmode="years">
									<input class="form-control" size="16" type="text"
										value="28-06-2013" readonly> <span class="add-on"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<!-- <label class="control-label col-sm-2">상세 설명</label>
							<div class="col-sm-10">
								<textarea class="form-control ckeditor" name="editor1" rows="6"></textarea>
							</div> -->
							<label class="control-label col-sm-2">상세 설명</label>
							<div class="col-sm-10">
								<div id="editor" class="btn-toolbar" data-role="editor-toolbar"
									data-target="#editor"></div>
							</div>
						</div> 
						<span style="float:right">
							<a class="btn btn-info" href="adminMenuList.do" title="클릭하시면 등록 화면으로 이동합니다.">등록</a>
				<a class="btn btn-info" href="" title="클릭하시면 취소됩니다.">취소</a>
						</span>
					</div>
				</form>
			</div>
			</section>
		</div>
	</div>
	</section> </section> </section>
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>