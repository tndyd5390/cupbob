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
		contentType:"application/json",
		data: JSON.stringify(form),
		success:function(data){
			$('#json1').html(data);
		}
		
	})
	
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>commTest</h2>

	<input type="button" name="test" onclick="" value="테스트">
	
	<input type="text" id="json1" value="">
</body>
</html>