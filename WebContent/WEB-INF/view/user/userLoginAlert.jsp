<%@page import="com.cupbob.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = CmmUtil.nvl((String)request.getAttribute("msg"));
	String url = CmmUtil.nvl((String)request.getAttribute("url"));
	String uNum = (String)session.getAttribute("ss_user_no");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
<% 
	if (!msg.equals("")){
%>
	alert("<%=msg%>");
<%
	}
%>
	location.href="<%=url%>";
</script>
</head>
</html>