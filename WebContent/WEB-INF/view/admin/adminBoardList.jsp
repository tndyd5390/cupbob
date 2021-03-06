<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	List<User_boardDTO> bList = (List<User_boardDTO>)request.getAttribute("boardList");
	String ss_userNo = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
	String ss_userEmail = CmmUtil.nvl((String) session.getAttribute("ss_user_email"));
%>
<!DOCTYPE html>
<html>
<%@include file="/include/head.jsp"%>
<script type="text/javascript">
	var count = 10;

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
			alert("선택된 것이 없습니다.");
		}
	}
	$(function (){
		$('#boardSearch').keyup(function() {
			var word = $('#boardSearch').val();
			var selected = $('#searchSelect').val();
				$.ajax({
					url : "boardSearch.do",
					method : "post",
					data : {
						'word' : word,
						'selected' : selected			
					},
					dataType : "json",
					success : function(data){
						console.log(data);
						var contents = "";
						$.each(data, function(key,value){
							contents += "<tr>";
							contents += "<td width='5%'> <input type='checkbox' name='del_check' value='"+ value.post_no +"'> </td>";
							contents += "<td width='10%' align=center>" + value.post_no + "</td>";
							contents += "<td width='40%' align=center> <a href='adminBoardDetail.do?bnum=" + value.post_no + "'>" + value.title + "</a> </td>";
							contents += "<td width='15%' align=center>" + value.user_name + "</td>";
							contents += "<td width='15%' align=center>" + value.reg_dt + "</td>";
							contents += "<td width='15%' align=center>" + value.view_cnt + "</td>";
							contents += "</tr>";
						})
						$('#boardList').html(contents);
					}
				})
		})
		$(".btn_more").click(function(){
			$.ajax({
				url : "readMore.do",
				method : "post",
				data : {
					'count' : count
				},
				dataType : "json",
				success : function(data){
					var contents = "";
					console.log(data)
					$.each(data,function (key,value){
						contents += "<tr>";
						contents += "<td width='5%'> <input type='checkbox' name='del_check' value='"+ value.post_no +"'> </td>";
						contents += "<td width='10%' align=center>" + value.post_no + "</td>";
						contents += "<td width='40%' align=center> <a href='adminBoardDetail.do?bnum=" + value.post_no + "'>" + value.title + "</a> </td>";
						contents += "<td width='15%' align=center>" + value.user_name + "</td>";
						contents += "<td width='15%' align=center>" + value.reg_dt + "</td>";
						contents += "<td width='15%' align=center>" + value.view_cnt + "</td>";
						contents += "</tr>";
					})
					$('#boardList').append(contents)
					if ((data).length==0) {
						$('.btn_more').remove();
					}
				}
			})
			count += 10;
		})
	})
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소라네 컵밥 커뮤니티</title>
<style>
.btn_more {float:left;width:100%;height:50px;border:0 none;border-top:2px solid transparent;background-color:#dddddd;border-left: 1px solid #ccc;
    border-right: 1px solid #ccc;}
.btn_more .ico_sample {padding-right:15px;font-size:20px;color:#777;background-position:100% -22px}
</style>
</head>
<%
if (ss_userEmail==""||!(ss_userEmail.equals("kangseokopo@gmail.com"))) {
		response.sendRedirect("adminLogin.do");
}else{%>

<body>
				<form action="adminBoardCheckedDelete.do" method="post" id="f">
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-table"></i> 게시판 관리
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="orderList.do">메인 화면</a></li>
				<li><i class="fa fa-table"></i>게시판 관리</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			게시글 목록
						<div class="navbar-form pull-right">
                            검색   :
                             <select id="searchSelect" class="input-sm" style="width:80px">
                                              <option>제목</option>
                                              <option>작성자</option>
                                              <option>내용</option>
                                          </select>
                            
                            <input class="form-control" placeholder="Search" type="text" id="boardSearch">
                        </div>
			</header>
			<div class="panel-body">
				<div class="table-borderd">
					<table class="table" align="center">
						<thead>
							<tr>
								<th>
										<input type="checkbox" name="all" onclick="check();">
								</th>
								<th><center>글 번호</center></th>
								<th><center>제목</center></th>
								<th><center>작성자</center></th>
								<th><center>작성일</center></th>
								<th><center>조회수</center></th>
							</tr>
						</thead>
						<tbody id="boardList">
						<%
							for(User_boardDTO bDTO : bList){
						%>
							<tr>
								<td width="5%"><input type="checkbox" name="del_check" value="<%=CmmUtil.nvl(bDTO.getPost_no())%>"></td>
								<td width="10%" align=center><%=CmmUtil.nvl(bDTO.getPost_no()) %></td>
								<td width="40%" align=center><a href="adminBoardDetail.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>"><%=CmmUtil.nvl(bDTO.getTitle())%></a></td>
								<td width="15%" align=center><%=CmmUtil.nvl(bDTO.getUser_name())%></td>
								<td width="15%" align=center><%=CmmUtil.nvl(bDTO.getReg_dt()) %></td>
								<td width="15%" align=center><%=CmmUtil.nvl(bDTO.getView_cnt()) %></td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>
				</div>
				<button type="button" class="btn_more"><span class="ico_sample">더보기</span></button>
			</div>
			</section>
			<div style="float: right">
				<a class="btn btn-info" href="adminBoardReg.do" title="선택하신게 수정됩니다.">등록</a> 
				<input type="button" class="btn btn-info" title="선택하신게 삭제됩니다." onclick="userdel_check()" value="삭제">
			</div>
		</div>
	</div>
	</section>
	<%@include file="/include/bottomJavaScript.jsp"%>
	</form>
</body>
<%
}
%>
</html>