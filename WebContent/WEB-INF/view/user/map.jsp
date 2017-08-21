<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

<title>소라네 컵밥 매장위치</title>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div align=center>
		<div class="orderHead" style="width: 80%;">매 장 위 치</div>
		<br>

		<div id="daumRoughmapContainer1502676261626" class="root_daum_roughmap root_daum_roughmap_landing" style="width: 80%"></div>

		<script charset="UTF-8" class="daum_roughmap_loader_script"	src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

		<script charset="UTF-8">
			new daum.roughmap.Lander({
				"timestamp" : "1502676261626",
				"key" : "j57u",
			}).render();
		</script>
	</div>
	<br /><br />
	<div align="center"><%@include file="/include/footer.jsp"%></div>
</body>
</html>