<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>

$(function(){
});

function testJson(){
	$.ajax({
		url:"commJson.do",
		method:"post",
		type:"json",
		success:function(data){
			var content = "";
			$.each(data, function(key, value){
					content +="<p>"+ value+ "</p>"
					content +="<p>"+ key+ "</p>"
					
					$("#wewe").html(content)
			})
		}
		
	})
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>commTest</h2>

	<input type="button" name="test" onclick="testJson()" value="테스트">
	
	<input type="text" id="json1" value="">
	<div id="wewe"></div>
</body>
</html>