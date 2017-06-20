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
			<h3 class="page-header">
				<i class="fa fa-table"></i> 게시판
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="adminMain.do">메인 화면</a></li>
				<li><i class="fa fa-table"></i>게시판</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">회원
			목록</header>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table" style="text-align: center">
						<thead style="align: center">
							<tr>

								<th>
									<center>
										<input type="checkbox" id="inlineCheckbox1" value="option1">
									</center>
								</th>

								<th><center>글 번호</center></th>
								<th><center>제목</center></th>
								<th><center>작성자</center></th>
								<th><center>작성일</center></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" id="inlineCheckbox1"
									value="option2"></td>
								<td>3</td>
								<td><a href="adminBoardDetail1.do">컵밥 종류는 어떻게 되나요 ?</a></td>
								<td>김상훈</td>
								<td>20171107</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="inlineCheckbox1"
									value="option2"></td>
								<td>2</td>
								<td><a href="adminBoardDetail2.do">컵밥 주문 가능 시간은 언제에요?</a></td>
								<td>박수용</td>
								<td>20171107</td>
							</tr>
							<tr>
								<td><input type="checkbox" id="inlineCheckbox1"
									value="option2"></td>
								<td>1</td>
								<td><a href="adminBoardDetail3.do">컵밥이랑 할인되는 메뉴 있나요 ?</a></td>
								<td>최한용</td>
								<td>20171107</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			</section>
			<div style="float: right">
				<a class="btn btn-info" href="adminBoardReg.do" title="선택하신게 수정됩니다.">등록</a> <a
					class="btn btn-info" href="#" title="선택하신게 수정됩니다.">삭제</a>
			</div>
		</div>
	</div>


	</section></section>
	</section>
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>