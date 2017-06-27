<%@page import="com.cupbob.dto.User_infoDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.cupbob.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<User_infoDTO> uList = (List<User_infoDTO>) request.getAttribute("userList");
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
	
$(function (){
	$('#userSearch').keyup(function() {
		var word = $('#userSearch').val();
		$.ajax({
			url : "userSearch.do",
			method : "post",
			data : {'word' : word},
			dataType : "json",
			success : function(data){
				var contents = "";
				$.each(data, function(key, value){
					contents += "<tr>"
					contents += "<td> <input type='checkbox' name='delCheck' id='inlineCheckbox1' value='"+value.user_no+"'"+">"
					contents += "<td>"+value.user_no+"</td>"
					contents += "<td>"+value.email+"</td>"
					contents += "<td>"+value.user_name+"</td>"
					contents += "<td>"+value.reg_dt+"</td>"
					contents += "<td>"+value.contact_addr+"</td>"
					contents += "</tr>"
				})
				$('#userList').html(contents);
			}
		})
	})
})
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 관리</title>
</head>
<body>
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="icon_profile"></i> 회원 관리
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="orderList.do">메인 화면</a></li>
				<li><i class="icon_profile"></i>회원 관리</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			회원 목록 
                        <div class="navbar-form pull-right">
                            검색   :   <input class="form-control" placeholder="Search" type="text" id="userSearch">
                        </div>
			</header>
			<div class="table-responsive">
<form action="adminUserCheckedDelete.do" method="post" id="f">
				<table class="table" align="center">
					<thead>
						<tr>
							<th><input type="checkbox" id="inlineCheckbox1" name="all"
								value="option1" onclick="check();"></th>
							<th>회원번호</th>
							<th>아이디</th>
							<th>회원이름</th>
							<th>가입일</th>
							<th>연락처</th>
						</tr>
					</thead>

					<tbody id="userList">
						<%
							for (User_infoDTO udto : uList) {
						%>
						<tr>
							<td><input type="checkbox" name="del_check" id="inlineCheckbox1"
								value="<%=CmmUtil.nvl(udto.getUser_no())%>"></td>
							<td><%=CmmUtil.nvl(udto.getUser_no())%></td>
							<td><a href="adminUserDetail.do?unum=<%=CmmUtil.nvl(udto.getUser_no())%>"><%=CmmUtil.nvl(udto.getEmail())%></a></td>
							<td><%=CmmUtil.nvl(udto.getUser_name())%></td>
							<td><%=CmmUtil.nvl(udto.getReg_dt())%></td>
							<td><%=CmmUtil.nvl(udto.getContact_addr())%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				</form>
				<div style="float: right">
					<a class="btn btn-info" href="#" title="클릭하시면 선택항목이 삭제됩니다." onclick="userdel_check()">삭제</a>
				</div>
			</div>
			</section>
		</div>
	</div>
	</section> </section>
	<%@ include file="/include/bottomJavaScript.jsp"%>
</body>
</html>