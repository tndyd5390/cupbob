<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	String ordNo = (String) request.getAttribute("ordNo");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
function closeWin(time) {
	setTimeout("window.close()", time); //1000 은 1초를 의미합니다.
	}
</script>
</head>
<body onLoad="closeWin('3000')">
	주문번호 <b><%=ordNo %></b> 처리 완료
	<br>
	3초후 닫힙니다.
</body>
</html>