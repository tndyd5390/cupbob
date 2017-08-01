<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="userBootstrap/css/tutle.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=OtsTFLJcXGVYGVcEbrwy&submodules=geocoder"></script>

<title>Insert title here</title>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div align=center>
	<div class="orderHead" style="width:80%;">매장위치</div>
		<div id="map" style="width: 80%; height: 300px;"></div>
		<script>
			var mapOptions = {
				center : new naver.maps.LatLng(37.3595704, 127.105399),
				zoom : 10
			};
			var map = new naver.maps.Map('map', mapOptions);
		</script>
	</div>
	<hr class="garo">
	<div align=center>
	<div class="panel panel-default" style="width:80%; border-width:4px">
		<div class="panel-body mapSpan text-left">스타벅스 밥집<br>서울시 강서구 우장산로 00길 0000<br>02-0000-0000</div>
	</div>
	<br>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>