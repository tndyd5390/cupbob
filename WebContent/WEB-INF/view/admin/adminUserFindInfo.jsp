<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cupbob.util.CmmUtil" %>
<%

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%@include file="/include/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소라네 컵밥 회원 정보 찾기</title>
</head>

<body>
	<header class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
	</div>

	<a href="adminLogin.do" class="logo">SORA <span class="lite">CUPBOB</span></a>

	</header>

	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="icon_lock_alt"></i> 아이디 비밀번호 찾기
			</h3>
			<ol class="breadcrumb">
				<li><i class="icon_key_alt"></i><a href="adminLogin.do">Login</a></li>
				<li><i class="icon_lock_alt"></i>아이디 비밀번호 찾기</li>
			</ol>
		</div>
	</div>

	<div class="col-sm-6">
		<form class="login-form" action="adminUserFindEmail.do" method="post">
			<div class="login-wrap">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_profile"></i></span>
					<input type="text" name="user_name" class="form-control" placeholder="이름" autofocus>
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_calendar"></i></span>
					<input type="text" name="birthday" class="form-control"	placeholder="생년월일 ex)1994.08.08" onkeyup="return filterNumber(this);">
				</div>
				<br>
				<button class="btn btn-primary btn-lg btn-block" type="submit">아이디 찾기</button>
			</div>
		</form>
	</div>
	<div class="col-sm-6">
		<form class="login-form" action="adminUserFindPw.do" method="post" name="password1">
			<div class="login-wrap">
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_mail_alt"></i></span>
					<input type="text" name="email" class="form-control" placeholder="아이디">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_profile"></i></span>
					<input type="text" name="user_name" class="form-control" placeholder="이름">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_calendar"></i></span>
					<input type="text" name="birthday" class="form-control"	placeholder="생년월일 ex)1994.08.08" onkeyup="return filterNumber(this);">
				</div>
				<button class="btn btn-primary btn-lg btn-block" type="submit">비밀번호 찾기</button>
			</div>
		</form>
	</div>

	</section>
	</section>

	<script type="text/javascript">
    function filterNumber(obj) 
    {
        var key = event.keyCode;
        if(!(key==8||key==9||key==144||key==46||key==110||(key >= 48 && key <=57)||(key >= 96 && key <= 105))) 
        {
            alert("숫자만 입력 가능합니다.")
            document.password1.birthday.value=""; 
            event.returnValue = false;
        }
    	
/*         if (event.keyCode >= 48 && event.keyCode <= 57) { //only number
            return true;
        } else {
        	if(event.keyCode == 13){
        		action();
        	}
			event.returnValue = false;        	
            alert("숫자만 입력 가능합니다.")
        } */
    }
	</script>

	<%@include file="/include/bottomJavaScript.jsp"%>
</body>

</html>
