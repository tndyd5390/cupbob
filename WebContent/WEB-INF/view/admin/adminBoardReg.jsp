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
				<i class="fa fa-table"></i> 게시판 관리
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="adminMain.do">메인 화면</a></li>
				<li><i class="fa fa-table"></i><a href="adminBoardList.do">게시판</a></li>
				<li><i class="fa fa-table"></i>게시글 등록</li>
			</ol>
		</div>
		<!-- 회원가입 폼 시작-->
		<div class="row">
			<div class="col-lg-12">
				<section class="panel"> <header class="panel-heading">
				게시글 등록 </header>
				<form role="form" action="adminBoardProc.do" method="POST">
					<div class="panel-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								class="form-control" id="exampleInputEmail1" name="board_title"
								placeholder="제목을 작성해주세요.">
						</div>
						<div name="board_content" id="editor" class="btn-toolbar" data-role="editor-toolbar"
							data-target="#editor"></div>
					</div>
					<input type="submit" value="등록">
				</form>
				</section>
				<div style="float: right">
					<a class="btn btn-info" href="adminBoardList.do" title="선택하신게 수정됩니다.">수정</a> <a
						class="btn btn-info" href="#" title="선택하신게 삭제됩니다.">삭제</a>
				</div>
			</div>
		</div>
	</section> </section>
	<!-- 회원가입 폼 끝 -->
	<!-- page end-->
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>