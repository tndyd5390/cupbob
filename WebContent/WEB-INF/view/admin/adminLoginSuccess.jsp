<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.cupbob.util.CmmUtil"  %>
<%@ page import = "com.cupbob.dto.User_infoDTO"  %>

<% 
	String ss_user_id = CmmUtil.nvl((String) session.getAttribute("ss_user_id"));
	String ss_user_name = CmmUtil.nvl((String) session.getAttribute("ss_user_name"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%= ss_user_id %>
<%= ss_user_name %>
</body>
</html>