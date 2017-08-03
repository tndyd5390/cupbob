<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<%@include file="/include/head.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소라네 컵밥 커뮤니티</title>
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
				</section>
				<div style="float: right">
					<input type="button" class="btn btn-info" onclick="doSubmit()" value="등록">
				</div>
			</form>
		</div>
		</div>
	</section> </section>
	<!-- page end-->
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>