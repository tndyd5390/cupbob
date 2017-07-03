<%@page import="com.cupbob.dto.Product_infoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Product_infoDTO> pList = (List<Product_infoDTO>) request.getAttribute("pList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<script type="text/javascript">
	function check() {
		var f = document.getElementById("f");
		var cbox = f.del_check;
		if (cbox.length) {
			for (var i = 0; i < cbox.length; i++) {
				cbox[i].checked = f.all.checked;
			}
		} else {
			cbox.checked = f.all.checked;
		}
	}
	function menuDel_check() {
		var checked = false;
		var check = document.getElementsByName("del_check");
		var f = document.getElementById("f");
		if (check.length) {
			for (var i = 0; i < check.length; i++) {
				if (check[i].checked) {
					checked = true;
					break;
				}
			}
		}
		if (checked) {
			if (confirm("선택한 것을 삭제 하시겠습니까?")) {
				f.submit();
			}
		} else {
			alert("선택된 것이 없습니다.");
		}
	}

	$(
			function() {
				$('#menuSearch')
						.keyup(
								function() {
									var word = $('#menuSearch').val();
									$
											.ajax({
												url : "menuSearch.do",
												method : "post",
												data : {
													'word' : word
												},
												dataType : "json",
												success : function(data) {
													var contents = "";
													$
															.each(
																	data,
																	function(
																			key,
																			value) {
																		contents += "<tr>";
																		contents += "<td align=center><input type='checkbox' name='del_check' id='inlineCheckbox1' value='"+value.prdt_no+"'"+">";
																		contents += "<td align=center>"
																				+ value.prdt_no
																				+ "</td>";
																		contents += "<td align=center><a href=adminMenuDetail.do?pnum="
																				+ value.prdt_no
																				+ ">"
																				+ value.prdt_name
																				+ "</a></td>";
																		contents += "<td align=center>"
																				+ value.prdt_price
																				+ "</td>";
																		contents += "<td align=center>"
																				+ value.prdt_kcal
																				+ "</td>";
																		contents += "<td align=center>"
																				+ value.reg_dt
																				+ "</td>";
																		contents += "</tr>";
																	})
													$('#menuList').html(
															contents);
												}
											})
								})
			})
</script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
	<title>메뉴 관리</title>
</head>

<body>
	<form action="adminMenuCheckedDelete.do" method="post" id="f" onsubmit="return false;">
		<%@include file="/include/naviBarAndasideBar.jsp"%>
		<section id="main-content"> <section class="wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="icon_document_alt"></i>메뉴 관리
					</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="orderList.do">메인화면</a></li>
						<li><i class="icon_document_alt"></i>메뉴 관리</li>
					</ol>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<section class="panel">
					<header class="panel-heading"> 메뉴 목록
						<div class="navbar-form pull-right">메뉴 검색 :
							<input class="form-control" placeholder="Search" type="text" id="menuSearch">
						</div>
					</header>

					<div class="panel-body">
						<div class="table-borderd">
								<table class="table" align="center">
									<thead>
										<tr>
											<th><center><input type="checkbox" name="all" id="inlineCheckbox1" value="option1" onclick="check();"></center></th>
											<th><center>번호</center></th>
											<th><center>메뉴 이름</center></th>
											<th><center>가격</center></th>
											<th><center>kcal</center></th>
											<th><center>날짜</center></th>
										</tr>
									</thead>
									<tbody id="menuList">
										<%
											for (Product_infoDTO pDTO : pList) {
										%>
										<tr>
											<td align=center><input type="checkbox" name="del_check" id="inlineCheckbox1"value="<%=CmmUtil.nvl(pDTO.getPrdt_no())%>"></td>
											<td align=center><%=pDTO.getPrdt_no()%></td>
											<td align=center><a	href="adminMenuDetail.do?pnum=<%=pDTO.getPrdt_no()%>"><%=pDTO.getPrdt_name()%></a></td>
											<td align=center><%=pDTO.getPrdt_price()%></td>
											<td align=center><%=pDTO.getPrdt_kcal()%></td>
											<td align=center><%=pDTO.getReg_dt()%></td>
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
						<a class="btn btn-info" href="adminMenuReg.do" title="클릭하시면 등록 화면으로 이동합니다.">등록</a>
						<a class="btn btn-info" title="클릭하시면 선택된것들이 삭제됩니다." href="#" onclick="menuDel_check();">삭제</a>
					</div>
				</div>
			</section> <%@include file="/include/bottomJavaScript.jsp"%>
		</form>
	</body>
</html>