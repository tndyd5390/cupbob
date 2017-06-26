<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.cupbob.util.CmmUtil"  %>
	

<% 
	String ss_user_name = CmmUtil.nvl((String) session.getAttribute("ss_user_name"));
%>
<script type="text/javascript">
	function logOut(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="adminLogout.do";
		}
	}


</script>
<section id="container" class=""> <header
		class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips"
			data-original-title="Toggle Navigation" data-placement="bottom">
			<i class="icon_menu"></i>
		</div>
	</div>

	<!--logo start--> <a href="orderList.do" class="logo">sora<span
		class="lite">cupbob</span></a> <!--logo end-->

	<div class="nav search-row" id="top_menu">
		<!--  search form start -->
		<ul class="nav top-menu">
			<li>
				<!-- <form class="navbar-form">
					<input class="form-control" placeholder="Search" type="text">
				</form> -->
			</li>
		</ul>
		<!--  search form end -->
	</div>

	<div class="top-nav notification-row">
		<!-- notificatoin dropdown start-->
		<ul class="nav pull-right top-menu">

			<!-- task notificatoin start -->
			<!-- <li id="task_notificatoin_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="icon-task-l"></i> <span class="badge bg-important">6</span>
			</a> -->
				<!-- <ul class="dropdown-menu extended tasks-bar">
					<div class="notify-arrow notify-arrow-blue"></div>
					<li>
						<p class="blue">You have 6 pending letter</p>
					</li>
					<li><a href="#">
							<div class="task-info">
								<div class="desc">Design PSD</div>
								<div class="percent">90%</div>
							</div>
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-success"
									role="progressbar" aria-valuenow="90" aria-valuemin="0"
									aria-valuemax="100" style="width: 90%">
									<span class="sr-only">90% Complete (success)</span>
								</div>
							</div>
					</a></li>
					<li><a href="#">
							<div class="task-info">
								<div class="desc">Project 1</div>
								<div class="percent">30%</div>
							</div>
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-warning"
									role="progressbar" aria-valuenow="30" aria-valuemin="0"
									aria-valuemax="100" style="width: 30%">
									<span class="sr-only">30% Complete (warning)</span>
								</div>
							</div>
					</a></li>
					<li><a href="#">
							<div class="task-info">
								<div class="desc">Digital Marketing</div>
								<div class="percent">80%</div>
							</div>
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-info" role="progressbar"
									aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"
									style="width: 80%">
									<span class="sr-only">80% Complete</span>
								</div>
							</div>
					</a></li>
					<li><a href="#">
							<div class="task-info">
								<div class="desc">Logo Designing</div>
								<div class="percent">78%</div>
							</div>
							<div class="progress progress-striped">
								<div class="progress-bar progress-bar-danger" role="progressbar"
									aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"
									style="width: 78%">
									<span class="sr-only">78% Complete (danger)</span>
								</div>
							</div>
					</a></li>
					<li><a href="#">
							<div class="task-info">
								<div class="desc">Mobile App</div>
								<div class="percent">50%</div>
							</div>
							<div class="progress progress-striped active">
								<div class="progress-bar" role="progressbar" aria-valuenow="50"
									aria-valuemin="0" aria-valuemax="100" style="width: 50%">
									<span class="sr-only">50% Complete</span>
								</div>
							</div>

					</a></li>
					<li class="external"><a href="#">See All Tasks</a></li>
				</ul></li> -->
			<!-- task notificatoin end -->
			<!-- inbox notificatoin start-->
			<li id="mail_notificatoin_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="icon-envelope-l"></i> <span class="badge bg-important">5</span>
			</a>
				<ul class="dropdown-menu extended inbox">
					<div class="notify-arrow notify-arrow-blue"></div>
					<li>
						<p class="blue">You have 5 new messages</p>
					</li>
					<li><a href="#">See all messages</a></li>
				</ul></li>
			<!-- inbox notificatoin end -->
			<!-- alert notification start-->
			<li id="alert_notificatoin_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="icon-bell-l"></i> <span class="badge bg-important">7</span>
			</a>
				<ul class="dropdown-menu extended notification">
					<div class="notify-arrow notify-arrow-blue"></div>
					<li>
						<p class="blue">You have 4 new notifications</p>
					</li>
					<li><a href="#"> <span class="label label-primary"><i
								class="icon_profile"></i></span> Friend Request <span
							class="small italic pull-right">5 mins</span>
					</a></li>
					<li><a href="#"> <span class="label label-warning"><i
								class="icon_pin"></i></span> John location. <span
							class="small italic pull-right">50 mins</span>
					</a></li>
					<li><a href="#"> <span class="label label-danger"><i
								class="icon_book_alt"></i></span> Project 3 Completed. <span
							class="small italic pull-right">1 hr</span>
					</a></li>
					<li><a href="#"> <span class="label label-success"><i
								class="icon_like"></i></span> Mick appreciated your work. <span
							class="small italic pull-right"> Today</span>
					</a></li>
					<li><a href="#">See all notifications</a></li>
				</ul></li>
			<!-- alert notification end-->
			<!-- user login dropdown start-->
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <span class="profile-ava">
				</span> <span class="username"><%=ss_user_name%></span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<div class="log-arrow-up"></div>
					<li class="eborder-top"><a href="#"><i
							class="icon_profile"></i> 프로필</a></li>
					<!-- <li><a href="#"><i class="icon_mail_alt"></i> My Inbox</a></li>
					<li><a href="#"><i class="icon_clock_alt"></i> 타임라인</a></li>
					<li><a href="#"><i class="icon_chat_alt"></i> 차트</a></li> -->
					<li><a href="#" onclick="logOut();"><i class="icon_key_alt"></i> 로그아웃</a></li>
					<!-- <li><a href="documentation.html"><i class="icon_key_alt"></i>
							Documentation</a></li>
					<li><a href="documentation.html"><i class="icon_key_alt"></i>
							Documentation</a></li> -->
				</ul></li>
			<!-- user login dropdown end -->
		</ul>
		<!-- notificatoin dropdown end-->
	</div>
	</header> <!--header end--> <!--sidebar start--> <aside>
	<div id="sidebar" class="nav-collapse ">
		<!-- sidebar menu start-->
		<ul class="sidebar-menu">
			<li class="active"><a class="" href="orderList.do"> <i
					class="icon_house_alt"></i> <span>메인 화면</span>
			</a></li>
			<li><a class="" href="adminMenuList.do"> <i
					class="icon_document_alt"></i> <span>메뉴 관리</span>
			</a></li>
			<li><a class="" href="adminUserList.do"> <i
					class="icon_profile"></i> <span>회원 관리</span>
			</a></li>
			<!-- <li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_document_alt"></i> <span>메뉴 관리</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_desktop"></i> <span>회원 관리</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
			</li> -->
			<li><a class="" href="adminBoardList.do"> <i class="icon_genius"></i>
					<span>게시판 관리</span>
			</a></li>
			<li><a class="" href="adminChart.do"> <i
					class="icon_piechart"></i> <span>분석 차트</span>

			</a></li>

			<!-- <li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_table"></i> <span>Tables</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="basic_table.html">Basic Table</a></li>
				</ul></li>

			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_documents_alt"></i> <span>Pages</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
				<ul class="sub">
					<li><a class="" href="profile.html">Profile</a></li>
					<li><a class="" href="login.html"><span>Login Page</span></a></li>
					<li><a class="" href="blank.html">Blank Page</a></li>
					<li><a class="" href="404.html">404 Error</a></li>
				</ul></li> -->

		</ul>
		<!-- sidebar menu end-->
	</div>
	</aside>