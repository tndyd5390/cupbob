<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	List<User_boardDTO> bList = (List<User_boardDTO>)request.getAttribute("boardList");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<script type="text/javascript">
	function check(){
		var f = document.getElementById("f");
		var cbox = f.del_check;
		if(cbox.length){
			for(var i = 0; i< cbox.length;i++){
				cbox[i].checked = f.all.checked;
			}
		} else {
			cbox.checked = f.all.checked;
		}
	}
	function userdel_check(){
		console.log("userdel check()");
		var checked=false;
		var check = document.getElementsByName("del_check");
		var f = document.getElementById("f");
		
		if(check.length){
			for(var i = 0; i< check.length; i++){
				if(check[i].checked){
					checked = true;
					break;
				}				
			}
		}
		if(checked){
			if(confirm("선택한 것을 삭제하시겠습니까?")){
				f.submit();
			}
		}else{
			alert("하나도 선택된 것이 없습니다.");
		}
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
				<form action="adminBoardCheckedDelete.do" method="post" id="f">
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
					<table class="table" align="center">
						<thead>
							<tr>

								<th>
									<center>
										<input type="checkbox" name="all" onclick="check();">
									</center>
								</th>

								<th><center>글 번호</center></th>
								<th><center>제목</center></th>
								<th><center>작성자</center></th>
								<th><center>작성일</center></th>
							</tr>
						</thead>
						<tbody>
						<%
							for(User_boardDTO bdto : bList){
						%>
							<tr>
								<td><input type="checkbox" name="del_check" value="<%=CmmUtil.nvl(bdto.getPost_no())%>"></td>
								<td><%=CmmUtil.nvl(bdto.getPost_no()) %></td>
								<td><a href="adminBoardDetail.do?bnum=<%=CmmUtil.nvl(bdto.getPost_no())%>"><%=CmmUtil.nvl(bdto.getTitle())%></a></td>
								<td><%=CmmUtil.nvl(bdto.getReg_user_no())%></td>
								<td><%=CmmUtil.nvl(bdto.getReg_dt()) %></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
				</div>
			</div>
			</section>
			<div style="float: right">
				<a class="btn btn-info" href="adminBoardReg.do" title="선택하신게 수정됩니다.">등록</a> 
				<input type="button" class="btn btn-info" title="선택하신게 수정됩니다." onclick="userdel_check()" value="삭제">
			</div>
		</div>
	</div>


	</section></section>
	</section>
	<%@include file="/include/bottomJavaScript.jsp"%>
			</form>
</body>
</html>