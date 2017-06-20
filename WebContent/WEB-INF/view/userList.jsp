<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%
	List<User_infoDTO> list = (List<User_infoDTO>)request.getAttribute("userList");
%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<%
	for(User_infoDTO a : list){
		out.println(a.getUser_id());

	}
%>
</body>
</html>
