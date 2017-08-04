<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.cupbob.util.CmmUtil"  %>
<%@ page import = "com.cupbob.dto.User_infoDTO"  %>

<% 
	String ss_user_email = CmmUtil.nvl((String) session.getAttribute("ss_user_email"));
	String ss_user_name = CmmUtil.nvl((String) session.getAttribute("ss_user_name"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소라네 컵밥</title>
</head>
<body>

<%= ss_user_email %>
<%= ss_user_name %>
<%= ss_user_no %>
<form name="f" method="post" action="adminLogout.do">
<input type="submit" value="로그아웃">
</form>
</body>
</html>