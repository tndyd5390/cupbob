<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="/userBootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<!-- Bootstrap theme -->
<link href="/userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/userBootstrap/css/turtle.min.css" />
<link rel="stylesheet" href="/userBootstrap/css/nav.css"/>
<title>Insert title here</title>

</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<div id="recommMenu">
		<div class="container-fluid">
			<div class="row">
				<div class="recommTitle">
					<img
						src="https://ncache.ilbe.com/files/attach/new/20141018/377678/90262281/4510097791/a02a9ae58726212e724f45663c21883c.PNG"
						width="30px;"> <span><strong>추천메뉴</strong></span>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6 col-sm-3" style="text-align: center">
					<div id="menuImg">
						<span><a href="detail.jsp" ><img
							src="http://cfile28.uf.tistory.com/image/2523734855749E632F7982"
							class="menuImg"></a>  </span><br>
					</div>
					<div id="menuTxt">
						<span class="menuName">밥</span> <br> <span class="menuPrice"><strong>2,100</strong></span><span
							class="menuWon">원</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>