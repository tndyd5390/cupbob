<%@page import="com.cupbob.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String password = CmmUtil.nvl((String)request.getAttribute("resultPw"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%
	if(password.equals("")){
%>
		<script>
			alert("등록된 정보가 없습니다.");
			location.href="adminUserFindInfo.do";
		</script>
<%
	}else{
%>
<script>
	alert("이메일로 임시 비밀번호를 발급하였습니다. 임시비밀번호로 로그인후 비밀번호를 변경해 주세요.");
	location.href="adminLogin.do";
</script>
<%
}
%>
</head>
<body>
</body>
</html>