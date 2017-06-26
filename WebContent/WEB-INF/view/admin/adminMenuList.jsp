<%@page import="com.cupbob.dto.Product_infoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Product_infoDTO> pList = (List<Product_infoDTO>)request.getAttribute("pList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<script type="text/javascript">
	function check(){
		var f = document.getElementById("f");
		var cbox = f.del_check;
		if(cbox.length){
			for(var i = 0; i< cbox.length;i++){
				cbox[i].checked = f.all.checked;
			}
		}else{
			cbox.checked = f.all.checked;
		}
	}
	function menuDel_check(){
		var checked = false;
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
			if(confirm("선택한 것을 삭제 하시겠습니까?")){
				f.submit();
			}
		}else{
			alert("선택된 것이 없습니다.");
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 관리</title>
</head>
<body>
	<form action="adminMenuCheckedDelete.do" method="post" id="f">
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="icon_document_alt"></i>메뉴 관리</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="orderList.do">메인화면</a></li>
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
							<th><input type="checkbox" name="all" onclick="check();"></th>
							<th>번호</th>
							<th>메뉴 이름</th>
							<th>가격</th>
							<th>kcal</th>
							<th>중량</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<%for(Product_infoDTO pDTO : pList){ %>
						<tr>
							<td><input type="checkbox" name="del_check" value="<%=CmmUtil.nvl(pDTO.getPrdt_no()) %>"></td>
							<td><%=pDTO.getPrdt_no() %></td>
							<td><a href="adminMenuDetail.do?pnum=<%=pDTO.getPrdt_no()%>"><%=pDTO.getPrdt_name() %></a></td>
							<td><%=pDTO.getPrdt_price() %></td>
							<td><%=pDTO.getContents() %></td>
							<td>270g</td>
							<td><%=pDTO.getReg_dt() %></td>
						</tr>
					<%} %>
					</tbody>
				</table>
			</div>
			</section>
			<div style="float: right">
				<a class="btn btn-default" href="adminMenuReg.do" title="클릭하시면 등록 화면으로 이동합니다.">등록</a>
				<a class="btn btn-default" title="클릭하시면 선택된것들이 삭제됩니다." onclick="menuDel_check();">삭제</a>
			</div>
		</div>
	</div>
	</section> </section>
	<%@include file="/include/bottomJavaScript.jsp"%>
	</form>
</body>
</html>