<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery.min.js"></script>
<script>
	$(function() {
		var flag = 1;
		$("#spinner-form").click(function() {
			if (flag == 1) {
				$(".cloudy").show();
				flag = 0;
			} else {
				$(".cloudy").css('display', 'none');
				flag = 1;
			}
		});
	});
</script>
<div class="nav_wrapper" style="z-index: 2;">
		<!--<a class="menu-link" href="#menu"></a>-->
		<div class="spinner-master" >
			<input type="checkbox" id="spinner-form" /> <label
				for="spinner-form" class="spinner-spin">
				<div class="spinner diagonal part-1"></div>
				<div class="spinner horizontal"></div>
				<div class="spinner diagonal part-2"></div>
			</label>
		</div>
		<a href="NewFile.jsp"><img src="userBootstrap/navImage/title.png" style="width: 150px; height:75px;" class="titleImg"></a>
		<a href="tmpBasket.jsp"><img src="userBootstrap/navImage/basket.png" class="imgicon"></a><a href="login.jsp"><img src="userBootstrap/navImage/mypage.png" class="imgicon"></a>
		<nav id="menu" class="menu">
			<ul class="dropdown">
				<li><a href="#" class="nav-font">메뉴</a>
					<ul>
						<li><a href="NewFile.jsp"><img src="/userBootstrap/navImage/recommend.png" class="menuIcon"></a><a href="#">추천메뉴</a></li>
						<li><a href="#"><img src="userBootstrap/navImage/rice.png" class="menuIcon"></a><a href="#">컵밥</a></li>
						<li><a href="#"><img src="userBootstrap/navImage/noodle.png" class="menuIcon"></a><a href="#">면류</a></li>
						<li><a href="#"><img src="userBootstrap/navImage/drinks.png" class="menuIcon"></a><a href="#">음료</a></li>
					</ul></li>
				<li><a href="list.jsp" title="Link" class="nav-font">커뮤니티</a></li>
				<li><a href="#" title="Link" class="nav-font">주문내역</a></li>
				<li><a href="map.jsp" title="Link" class="nav-font">매장위치</a></li>
			</ul>
		</nav>
</div>
<div id="cloudy" class="cloudy"></div>