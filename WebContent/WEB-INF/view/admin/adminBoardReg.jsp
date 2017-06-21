<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<script type="text/javascript">
	function doSubmit(){
		console.log("dosubmit");
		var f = document.getElementById("f");
		if(f.board_title.value == ""){
			alert("제목을 입력하세요");
			f.board_title.focus();
			return;
		}
		if(f.contents.value==""){
			alert("내용을 입력하세요");
			f.contents.focus();
			return;
		}
		f.submit();
	}
</script>
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
				<form role="form" action="adminBoardProc.do" method="POST" id="f">
					<div class="panel-body">
						<div class="form-group">
							<label for="exampleInputEmail1">제목</label> <input type="text"
								class="form-control" id="exampleInputEmail1" name="board_title"
								placeholder="제목을 작성해주세요.">
						</div>
						<textarea class="form-control " id="contents" name="contents"
							rows="10"></textarea>
					</div>
				<div style="float: right">
					<input type="button" class="btn btn-info" onclick="doSubmit()" value="등록">
				</div>
				</form>
				</section>
			</div>
		</div>
	</section> </section>
	<!-- 회원가입 폼 끝 -->
	<!-- page end-->
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>