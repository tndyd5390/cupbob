<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">메뉴 관리</h3>
			<ol class="breadcrumb">
				<li><i class="icon_house_alt"></i><a href="adminMain.do">메인
						화면</a></li>
				<li><i class="icon_document_alt"></i>메뉴 관리</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			메뉴 목록 </header>
			<div class="table-responsive">
				<table class="table" align="center">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>번호</th>
							<th>메뉴 이름</th>
							<th>가격</th>
							<th>kcal</th>
							<th>중량</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>3</td>
							<td><a href="#">불고기 컵밥</a></td>
							<td>3000원</td>
							<td>400kcal</td>
							<td>270g</td>
							<td>2017/01/01</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>2</td>
							<td><a href="#">김치 컵밥</a></td>
							<td>3500원</td>
							<td>270kcal</td>
							<td>320g</td>
							<td>2017/01/06</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td><a href="#">숙주 컵밥</a></td>
							<td>3300원</td>
							<td>300kcal</td>
							<td>340g</td>
							<td>2017/01/09</td>
						</tr>
					</tbody>
				</table>
			</div>
			</section>
			<div style="float: right">
				<a class="btn btn-default" href="adminMenuReg.do" title="클릭하시면 등록 화면으로 이동합니다.">등록</a>
				<a class="btn btn-default" href="" title="클릭하시면 선택된것들이 삭제됩니다.">삭제</a>
			</div>
		</div>
	</div>
	</section> </section>
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>