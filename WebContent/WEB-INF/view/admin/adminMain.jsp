<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이번에는 순조롭게 해보자aaa</title>
<title>sang!!</title>
</head>
<body>
<%@include file="/include/naviBarAndasideBar.jsp"%>
	<!-- <section id="container" class=""> <header
		class="header dark-bg">
	<div class="toggle-nav">
		<div class="icon-reorder tooltips"
			data-original-title="Toggle Navigation" data-placement="bottom">
			<i class="icon_menu"></i>
		</div>
	</div>

	logo start <a href="index.html" class="logo">Nice <span
		class="lite">Admin</span></a> logo end

	<div class="nav search-row" id="top_menu">
		 search form start
		<ul class="nav top-menu">
			<li>
				<form class="navbar-form">
					<input class="form-control" placeholder="Search" type="text">
				</form>
			</li>
		</ul>
		 search form end
	</div>

	<div class="top-nav notification-row">
		notificatoin dropdown start
		<ul class="nav pull-right top-menu">

			task notificatoin start
			<li id="task_notificatoin_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="icon-task-l"></i> <span class="badge bg-important">6</span>
			</a>
				<ul class="dropdown-menu extended tasks-bar">
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
				</ul></li>
			task notificatoin end
			inbox notificatoin start
			<li id="mail_notificatoin_bar" class="dropdown"><a
				data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
					class="icon-envelope-l"></i> <span class="badge bg-important">5</span>
			</a>
				<ul class="dropdown-menu extended inbox">
					<div class="notify-arrow notify-arrow-blue"></div>
					<li>
						<p class="blue">You have 5 new messages</p>
					</li>
					<li><a href="#"> <span class="photo"><img
								alt="avatar" src="./img/avatar-mini.jpg"></span> <span
							class="subject"> <span class="from">Greg Martin</span> <span
								class="time">1 min</span>
						</span> <span class="message"> I really like this admin panel. </span>
					</a></li>
					<li><a href="#"> <span class="photo"><img
								alt="avatar" src="./img/avatar-mini2.jpg"></span> <span
							class="subject"> <span class="from">Bob Mckenzie</span> <span
								class="time">5 mins</span>
						</span> <span class="message"> Hi, What is next project plan? </span>
					</a></li>
					<li><a href="#"> <span class="photo"><img
								alt="avatar" src="./img/avatar-mini3.jpg"></span> <span
							class="subject"> <span class="from">Phillip Park</span> <span
								class="time">2 hrs</span>
						</span> <span class="message"> I am like to buy this Admin
								Template. </span>
					</a></li>
					<li><a href="#"> <span class="photo"><img
								alt="avatar" src="./img/avatar-mini4.jpg"></span> <span
							class="subject"> <span class="from">Ray Munoz</span> <span
								class="time">1 day</span>
						</span> <span class="message"> Icon fonts are great. </span>
					</a></li>
					<li><a href="#">See all messages</a></li>
				</ul></li>
			inbox notificatoin end
			alert notification start
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
			alert notification end
			user login dropdown start
			<li class="dropdown"><a data-toggle="dropdown"
				class="dropdown-toggle" href="#"> <span class="profile-ava">
						<img alt="" src="img/avatar1_small.jpg">
				</span> <span class="username">관리자</span> <b class="caret"></b>
			</a>
				<ul class="dropdown-menu extended logout">
					<div class="log-arrow-up"></div>
					<li class="eborder-top"><a href="#"><i
							class="icon_profile"></i> 프로필</a></li>
					<li><a href="#"><i class="icon_mail_alt"></i> My Inbox</a></li>
					<li><a href="#"><i class="icon_clock_alt"></i> 타임라인</a></li>
					<li><a href="#"><i class="icon_chat_alt"></i> 차트</a></li>
					<li><a href="login.html"><i class="icon_key_alt"></i> 로그아웃</a></li>
					<li><a href="documentation.html"><i class="icon_key_alt"></i>
							Documentation</a></li>
					<li><a href="documentation.html"><i class="icon_key_alt"></i>
							Documentation</a></li>
				</ul></li>
			user login dropdown end
		</ul>
		notificatoin dropdown end
	</div>
	</header> header end sidebar start <aside>
	<div id="sidebar" class="nav-collapse ">
		sidebar menu start
		<ul class="sidebar-menu">
			<li class="active"><a class="" href="index.html"> <i
					class="icon_house_alt"></i> <span>메인 화면</span>
			</a></li>
			<li><a class="" href="index.html"> <i
					class="icon_house_alt"></i> <span>메뉴 관리</span>
			</a></li>
			<li><a class="" href="index.html"> <i
					class="icon_house_alt"></i> <span>회원 관리</span>
			</a></li>
			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_document_alt"></i> <span>메뉴 관리</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
			<li class="sub-menu"><a href="javascript:;" class=""> <i
					class="icon_desktop"></i> <span>회원 관리</span> <span
					class="menu-arrow arrow_carrot-right"></span>
			</a>
			</li>
			<li><a class="" href="widgets.html"> <i class="icon_genius"></i>
					<span>게시판 관리</span>
			</a></li>
			<li><a class="" href="chart-chartjs.html"> <i
					class="icon_piechart"></i> <span>분석 차트</span>

			</a></li>

			<li class="sub-menu"><a href="javascript:;" class=""> <i
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
				</ul></li>

		</ul>
		sidebar menu end
	</div>
	</aside> -->
	 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-table"></i>메인 화면</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i>메인 화면</li>
					</ol>
				</div>
			</div>
			<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              실시간 주문 목록
                          </header>
                          
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><input type="checkbox"></th>
                                 <th><i class="icon_calendar"></i>주문번호</th>
                                 <th><i class="icon_mail_alt"></i>상품명</th>
                                 <th><i class="icon_pin_alt"></i>옵션</th>
                                 <th><i class="icon_mobile"></i>수량</th>
                                 <th><i class="icon_cogs"></i>수령시간</th>
                                 <th><i class="icon_cogs"></i>접수</th>
                                 <th><i class="icon_cogs"></i>취소</th>
                                 <th><i class="icon_cogs"></i>수령여부</th>
                                 <th><i class="icon_cogs"></i>금액</th>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td>20170001</td>
                                 <td>불고기컵밥</td>
                                 <td align="center">-</td>
                                 <td>1</td>
                                 <td>13:00</td>         
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                  <td>3500</td>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td>20170002</td>
                                 <td>김치컵밥</td>
                                 <td>치즈토핑 1</td>
                                 <td>1</td>
                                 <td>13:10</td>	
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                  <td>4000</td>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td>20170003</td>
                                 <td>불고기컵밥<br>숙주컵밥</td>
                                 <td align="center">-</td>
                                 <td>1<br>1</td>
                                 <td>13:20</td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                  <td>7000</td>
                              </tr>                           
                           </tbody>
                        </table>
                      </section>
                        <div style="float:right"><a class="btn btn-info" href="" title="선택하신게 삭제됩니다.">삭제</a></div>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
	 <%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>