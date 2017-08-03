<%@page import="com.cupbob.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String email = CmmUtil.nvl((String)request.getAttribute("email"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소라네 컵밥</title>
<!-- 아이디찾기 결과 -->
<%
	if (email.equals("")) {
%>
	<script>
		alert("해당하는 아이디가 없습니다.");
		location.href="adminUserFindInfo.do";
	</script>
<%
	}else{
%>
<script>
	alert("회원님의 아이디는 <%=email%> 입니다");
	location.href = "adminLogin.do";
</script>
<%
	}
%>
</head>
<body>

</body>
</html>