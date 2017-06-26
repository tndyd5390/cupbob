<%@page import="com.cupbob.dto.Product_infoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Product_infoDTO pDTO = (Product_infoDTO)request.getAttribute("pDTO");
%>
<html>
<%@include file="/include/head.jsp"%>
<head>
<script type="text/javascript">

	function doSubmit(f){
		if(f.prdtimg.value==""){
			if(confirm("이미지 미 선택시 기존이미지가 유지됩니다.")){
				f.submit();
			}else{
				return false;
			}
		}
	}
	function check(){
		var file = document.querySelector('#getfile');
		var filelist = file.files;
		var reader = new FileReader();
		reader.readAsDataURL(filelist[0]);
		reader.onload = function(){
			document.querySelector('#preview').src = reader.result;
		}
		document.getElementById('pid').innerHTML = "현재 이미지 그대로 업로드 됩니다.";
	}
	function doKeyOnlyNumberPrice(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;

		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 109 || keyID == 189 || keyID == 16
				|| keyID == 20 || keyID == 9 || keyID == 13) {
			return true;
		} else {
			alert("숫자만 입력가능 합니다");
			var val = document.getElementById("price");
			val.value = val.value.subString(0,val.value.length-1);
			return false;
		}
	}
	function doKeyOnlyNumberKcal(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;

		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 109 || keyID == 189 || keyID == 16
				|| keyID == 20 || keyID == 9 || keyID == 13) {
			return true;
		} else {
			alert("숫자만 입력가능 합니다");
			var val = document.getElementById("kcal");
			val.value = val.value.subString(0,val.value.length-1);
			return false;
		}
	}
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>소라 컵밥 메뉴 수정하기</title>
</head>
<body>
<%@include file="/include/naviBarAndasideBar.jsp"%>
 <section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">메뉴 관리</h3>
			<ol class="breadcrumb">
				<li><i class="icon_house_alt"></i><a href="orderList.do">메인 화면</a></li>
				<li><i class="icon_document_alt"></i><a href="adminMenuList.do">메뉴 관리</a></li>
				<li><i class="icon_document_alt"></i>메뉴 등록</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			메뉴 등록</header>
			<div class="panel-body">
					<!-- <div class="form-group">
                                      <label for="exampleInputEmail1">Email address</label>
                                      <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
                                  </div>
                                  <div class="form-group">
                                      <label for="exampleInputPassword1">Password</label>
                                      <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                  </div> -->
				<form class="form-horizontal" action="adminMenuUpdateProc.do" method="post" enctype="multipart/form-data" id="f" onsubmit="return doSubmit(this);">
					<input type="hidden" name="pnum" value="<%=CmmUtil.nvl(pDTO.getPrdt_no()) %>">
					<div class="col-lg-5">
						<center id="center"><span class="profile-ava" id="span"> <img id="preview" alt="" src="<%= "menuImg/" + CmmUtil.nvl(pDTO.getFile_name()) %>"
							style="width: 400px" style="height:400px">
						</span>
						
						<input type="file" name="prdtimg" id="getfile" accept="image/*" onchange="check()">
						<p id="pid" class="help-block">위 이미지는 기존 이미지입니다.</p>
					</center>
					</div>
					
					<div class="col-lg-7">
						<div class="form-group">
							<label class="control-label col-sm-4">상품명</label>
							<div class="col-sm-8">
								<input id="cp1" name="name" type="text" placeholder="상품명" size="16"
									class="form-control" required="required" value="<%=CmmUtil.nvl(pDTO.getPrdt_name())%>">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">가격</label>
							<div class="col-sm-8">
								<input id="price" name="price" type="text" placeholder="가격" size="16"
									class="form-control" required="required" value="<%=CmmUtil.nvl(pDTO.getPrdt_price()) %>" onkeydown="return doKeyOnlyNumberPrice(event);">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4">kcal</label>
							<div class="col-sm-8">
								<input id="cp1" type="text" name="kcal" placeholder="kcal" size="16"
									class="form-control" required="required" value="<%=CmmUtil.nvl(pDTO.getPrdt_kcal())%>" onkeydown="return doKeyOnlyNumberKcal(event);">
							</div>
						</div>
						<div class="form-group">
							<!-- <label class="control-label col-sm-2">상세 설명</label>
							<div class="col-sm-10">
								<textarea class="form-control ckeditor" name="editor1" rows="6"></textarea>
							</div> -->
							<label class="control-label col-sm-2">상세 설명</label>
							<div class="col-sm-10">
							<textarea class="form-control" name="contents" rows="6" required="required"><%=CmmUtil.exchangeEscapeNvl(pDTO.getContents()) %></textarea>
							</div>
						</div> 
						<span style="float:right">
							<input type="submit" class="btn btn-info" title="클릭하시면 등록 됩니다." value="수정">
				<a class="btn btn-info" href="" title="클릭하시면 취소됩니다.">취소</a>
						</span>
					</div>
				</form>
			</div>
			</section>
		</div>
	</div>
	</section> </section> </section>
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>