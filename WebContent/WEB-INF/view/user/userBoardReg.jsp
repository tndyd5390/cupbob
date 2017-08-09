<%@page import="com.cupbob.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userNo = (String)session.getAttribute("ss_user_no");
	if(CmmUtil.nvl(userNo).equals("")){
		response.sendRedirect("userLogin.do");
	}
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<link rel="stylesheet" href="userBootstrap/css/nav.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	function doUpdate(f){
		if(f.title.value == ""){
			alert("제목을 입력하세요.");
			f.title.focus();
			return false;
		}
		if(f.detail.value == ""){
			alert("내용을 입력 하세요.");
			f.detail.focus();
			return false;
		}
		if(calBytes(f.detail.value) > 4000){
			alert("최대 4000Bytes까지 입력 가능합니다.");
			f.detail.focus();
			return false;
		}	
	}
	function calBytes(str){
		var tcount = 0;
		var tmpStr = new String(str);
		var strCnt = tmpStr.length;

		var onechar;
		for (i=0;i<strCnt;i++){
			onechar = tmpStr.charAt(i);
			
			if (escape(onechar).length > 4){
				tcount += 2;
			}else{
				tcount += 1;
			}
		}
		return tcount;
	}
</script>

<title>소라네 컵밥 커뮤니티</title>

</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div id="recommMenu">
		<div class="container-fluid">
			<div class="col-xs-12">
				<form action="userBoardProc.do" method="post"
					onsubmit="return doUpdate(this);">
					<div class="saBox" align="center">커 뮤 니 티</div>
					<br /> <input type="text" class="title2" id="title2" name="title"
						placeholder="제목을 입력해 주세요."> <br />
					<hr class="blackHr">
					<textarea class="detail2" id="detail2" placeholder=" 내용을 입력해 주세요."
						name="detail"></textarea>
					<br /> <input type="submit" class="boButton" value="등록">
				</form>
			</div>
		</div>
		<br />
	</div>
	<br>
	<div align="center">
		<%@include file="/include/footer.jsp"%>
	</div>


</body>
</html>