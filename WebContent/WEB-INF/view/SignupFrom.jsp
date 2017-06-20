<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
			<h3 class="page-header">
				<i class="fa fa-files-o"></i> Form Validation
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
				<li><i class="icon_document_alt"></i>Forms</li>
				<li><i class="fa fa-files-o"></i>Form Validation</li>
			</ol>
		</div>
	</div>
	
	<!-- 회원가입 폼 시작-->
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			회원가입 </header>
			<div class="panel-body">
				<div class="form">
					<form class="form-validate form-horizontal " id="register_form" method="get" action="">
						<div class="form-group ">
							<label for="fullname" class="control-label col-lg-2">성명 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class=" form-control" id="cname" name="fullname" type="text" placeholder="이름을 입력해주세요." />
							</div>
						</div>
						
						<div class="form-group ">
							<label for="email" class="control-label col-lg-2">Email <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="email" name="email" type="email" placeholder="이메일을 입력해주세요."/>
							</div>
						</div>

						<div class="form-group ">
							<label for="password" class="control-label col-lg-2">비밀번호 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="password" name="password" type="password" placeholder="비밀번호를 입력해주세요."/>
							</div>
						</div>
						<div class="form-group ">
							<label for="confirm_password" class="control-label col-lg-2">비밀번호 재확인<span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="confirm_password" name="confirm_password" type="password" placeholder="비밀번호를 다시 입력해주세요."/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-lg-2" for="inputSuccess">성별</label>
							<div class="col-lg-10">
								<select class="form-control m-bot15">
									<option>남자</option>
									<option>여자</option>
								</select>

							</div>
						</div>
						<div class="form-group ">
							<label for="username" class="control-label col-lg-2">생년월일 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="username" name="username" type="text" placeholder="생년월일을 입력해주세요. ex)940808"/>
							</div>
						</div>
						<div class="form-group ">
							<label for="username" class="control-label col-lg-2">연락처 <span class="required">*</span>
							</label>
							<div class="col-lg-10">
								<input class="form-control " id="phone" name="phone" type="text" placeholder="연락처를 입력해주세요. ex)01012345678"/>
							</div>
						</div>


						<div class="form-group">
							<div class="col-lg-offset-2 col-lg-10">
							<div style = float:right>
							
								<button class="btn btn-primary" type="submit">가입</button>
								<button class="btn btn-default" type="button">취소</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			</section>
			
		</div>
	</div>
				</section>
				<!-- 회원가입 폼 끝 -->
				
	<!-- page end--> </section> </section> <%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>