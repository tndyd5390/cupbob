<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@page import="com.cupbob.dto.Comment_infoDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.cupbob.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User_boardDTO bDTO = (User_boardDTO) request.getAttribute("bDTO");
	List<Comment_infoDTO> cList = (List<Comment_infoDTO>) request.getAttribute("cList");
	String contents = bDTO.getContents();
	contents.replaceAll("& gt;", ">");
	bDTO.setContents(contents);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(function(){
		$('#cmtCreate').bind('click',function() {
			var pNo = $('#pNo').val();
			var cnts = $('#cmts').val();
			if(cnts==""){
				alert("댓글을 입력하세요");
				return false;
			}else{
				var allData = {
								"contents" : cnts,
								"pNo" : pNo
					  		  };
			$.ajax({url : 'cmtCreate.do',
			method : 'post',
			data : allData,
			dataType : "json",
			success : function(data) {
						var contents = "";
						$.each(data,function(key, value) {
							if(value.user_no==1){
								contents += "<div class="+"'activity-body act-in'"+" id="+value.cmt_no+">"
								contents += "<div class="+"text"+">";
								contents += "<p class="+"attribution"+">";
								contents += "<a href="+"#"+">"+ value.user_name+ " </a> "+ value.reg_dt+ " </p> ";
								contents += "<div id="+"cmt_"+value.cmt_no+" name="+value.cmt_no+" rows="+"4"+">";
								contents += "<span>"+ value.contents.replace(/\n/g,'</br>')+ "</span>";	
								contents +=	" </div>";
								contents +=	" </br>";
								contents += "<button class='btn btn-info btn-sm' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>"+"수정"+"</button> ";
								contents += " <button class='btn btn-info btn-sm' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
								contents += " </div>";
								contents += " </div>";
							}else{
								contents += "<div class="+"'activity-body act-in'"+" id="+value.cmt_no+">"
								contents += "<div class="+"text"+">";
								contents += "<p class="+"attribution"+">";
								contents += "<a href="+"#"+">"+ value.user_name+ " </a> "+ value.reg_dt+ " </p> ";
								contents += "<div id="+"cmt_"+value.cmt_no+" name="+value.cmt_no+" rows="+"4"+">";
								contents += "<span>"+ value.contents.replace(/\n/g,'</br>')+ "</span>";	
								contents +=	" </div>";
								contents += " </div>";
								contents += " </div>";
							}			
						$('#cmtList').html(contents);
						$('#cmts').val("");
						})
					}
				})
				}
			})
	})
		
	function cmtDelete(cmt_no){
		var cmtNo = cmt_no;
		var pNo = $('#pNo').val();
		var allData = {"cmtNo" : cmtNo,
						"pNo" : pNo};
		
		if(confirm("삭제하시겠습니까?")){
			$.ajax({url : 'cmtDelete.do',
				method : 'post',
				data : allData,
				dataType : "json",
				success : function(data) {
							var contents = "";
							if(data!=""){
								$.each(data,function(key, value) {
									if(value.user_no==1){
										contents += "<div class="+"'activity-body act-in'"+" id="+value.cmt_no+">"
										contents += "<div class="+"text"+">";
										contents += "<p class="+"attribution"+">";
										contents += "<a href="+"#"+">"+ value.user_name+ " </a> "+ value.reg_dt+ " </p> ";
										contents += "<div id="+"cmt_"+value.cmt_no+" name="+value.cmt_no+" rows="+"4"+">";
										contents += "<span>"+ value.contents.replace(/\n/g,'</br>')+ "</span>";	
										contents +=	" </div>";
										contents +=	" </br>";
										contents += " <button class='btn btn-info btn-sm' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>수정</button> ";
										contents += " <button class='btn btn-info btn-sm' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
										contents += " </div>";
										contents += " </div>";
									}else{
										contents += "<div class="+"'activity-body act-in'"+" id="+value.cmt_no+">"
										contents += "<div class="+"text"+">";
										contents += "<p class="+"attribution"+">";
										contents += "<a href="+"#"+">"+ value.user_name+ " </a> "+ value.reg_dt+ " </p> ";
										contents += "<div id="+"cmt_"+value.cmt_no+" name="+value.cmt_no+" rows="+"4"+">";
										contents += "<span>"+ value.contents.replace(/\n/g,'</br>')+ "</span>";	
										contents +=	" </div>";
										contents += " </div>";
										contents += " </div>";
									}
									$('#cmtList').html(contents);
								})
							}else{
								var cmtList = "<div class='act-time' id='cmtList'></div>";
								$('#cmtList').remove();
								$('#cmtCreateDiv').append(cmtList);
							}
						}
				})
				return true;
		}else{
			return false;
		}
		}
	
	function cmtUpdate(cmt_no,user_name){
		var cmtNo = cmt_no;
		var userName = user_name;
		var contents = $('#cmt_'+cmtNo+' > span').html().replace(/<br>/gi,'\n');
		var updateForm = "<div class='activity-body act-in' id="+cmtNo+">" +
		                 "<div class=text>" + 
		                 "<p class = 'attribution'>" +
		                 "<a href='#'>"+userName+"</a></p>" +
		                 "<textarea class='form-control' id='cmtUpdateArea' name='cmtUpdateArea' rows='4'>" +
		                 contents + "</textarea>" +
		                 "<br>" +
		                 "<button class='btn btn-primary btn-sm' id='cmtUpdateBtn' onclick='cmtUpdateProc("+cmtNo+")'>수정</button> "+
		                 "<button class='btn btb-primary btn-sm' id='cmtUpdateCancle' onclick='cmtUpdateCancle()'>취소</button>"+
		                 "</div>"+"</div>";
		$('#'+cmtNo).html(updateForm);
	}
	function cmtUpdateProc(cmt_no){
		var pNo = $('#pNo').val();
		var cmtNo = cmt_no;
		var contents = $('#cmtUpdateArea').val();
		var allData = {"pNo" : pNo,
				       "cmtNo" : cmtNo,
				       "contents" : contents};
		
		if(confirm("수정하시겠습니까?")){
			
			$.ajax({
				url : 'cmtUpdateProc.do',
				method : 'post',
				data : allData,
				dataType : 'json',
				success : function(data){
					cmtUpdateCancle();
				}
			})
			return true;
		}else{
			return false;
		}
	}
	
	
	function cmtUpdateCancle(){
		var pNo = $('#pNo').val();
		$.ajax({
			url : 'cmtList.do',
			method : 'post',
			data : {"pNo" : pNo},
			dataType : 'json',
			success : function(data) {
				var contents = "";
				$.each(data,function(key, value) {
					if(value.user_no==1){
						contents += "<div class="+"'activity-body act-in'"+" id="+value.cmt_no+">"
						contents += "<div class="+"text"+">";
						contents += "<p class="+"attribution"+">";
						contents += "<a href="+"#"+">"+ value.user_name+ " </a> "+ value.reg_dt+ " </p> ";
						contents += "<div id="+"cmt_"+value.cmt_no+" name="+value.cmt_no+" rows="+"4"+">";
						contents += "<span>"+ value.contents.replace(/\n/g,'</br>')+ "</span>";	
						contents +=	" </div>";
						contents +=	" </br>";
						contents += "<button class='btn btn-info btn-sm' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>"+"수정"+"</button> ";
						contents += " <button class='btn btn-info btn-sm' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
						contents += " </div>";
						contents += " </div>";
					}else{
						contents += "<div class="+"'activity-body act-in'"+" id="+value.cmt_no+">"
						contents += "<div class="+"text"+">";
						contents += "<p class="+"attribution"+">";
						contents += "<a href="+"#"+">"+ value.user_name+ " </a> "+ value.reg_dt+ " </p> ";
						contents += "<div id="+"cmt_"+value.cmt_no+" name="+value.cmt_no+" rows="+"4"+">";
						contents += "<span>"+ value.contents.replace(/\n/g,'</br>')+ "</span>";	
						contents +=	" </div>";
						contents += " </div>";
						contents += " </div>";
					}			
				$('#cmtList').html(contents);
				})
			}
		})
	}

	
</script>

<title>Insert title here</title>
<title>게시글 상세 보기</title>
</head>
<body>
	<%@include file="/include/naviBarAndasideBar.jsp"%>
	<!-- 회원가입 폼 시작-->
	<!--main content start-->
	<section id="main-content"> <section class="wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h3 class="page-header">
				<i class="fa fa-table"></i> 게시판
			</h3>
			<ol class="breadcrumb">
				<li><i class="fa fa-home"></i><a href="orderList.do">메인 화면</a></li>
				<li><i class="fa fa-table"></i><a href="adminBoardList.do">게시판
						관리</a></li>
				<li><i class="fa fa-th-list"></i>게시글 상세</li>
			</ol>
		</div>
	</div>
	<!-- page start-->
	<div class="row">
		<div class="col-lg-12">
			<section class="panel"> <header class="panel-heading">
			게시글 상세 </header>
			<div class="panel-body">
				<input type="hidden" id="pNo" name="pNo" value="<%=CmmUtil.nvl(bDTO.getPost_no())%>">
				<table
					class="table table-striped table-advance table-hover table-bordered">
					<tbody>
						<tr>
							<th width="10%"><center>제목</center></th>
							<th width="40%"><%=CmmUtil.nvl(bDTO.getTitle())%></th>
							<th width="10%"><center>작성자</center></th>
							<th width="15%"><center>
									<i class="icon_profile"></i>
									<%=bDTO.getEmail()%>
								</center></th>
							<th width="10%"><center>작성일</center></th>
							<th width="15%"><center><%=CmmUtil.nvl(bDTO.getReg_dt())%></center></th>
						</tr>
					</tbody>
				</table>
				<div class="form-group ">
					<div class="col-lg-12">
						<textarea class="form-control " id="ccomment" name="comment"
							rows="10" disabled><%=CmmUtil.nvl(bDTO.getContents())%>
                                              </textarea>
					</div>
				</div>
				<div style="float: right">
					<a class="btn btn-info"
						href="adminBoardUpdateView.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>"
						title="선택하신게 수정됩니다.">수정</a> <a class="btn btn-info"
						href="adminBoardDetailDelete.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>"
						title="선택하신게 삭제됩니다.">삭제</a>
				</div>
				<div class="act-time">
					<div class="activity-body act-in"></div>
				</div>
				<div class="act-time">
					<div class="activity-body act-in"></div>
				</div>
				<div class="act-time">
					<div class="activity-body act-in"></div>
				</div>
				<div class="act-time">
					<div class="activity-body act-in">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"> 댓글 </a></li>
						</ul>
					</div>
				</div>
				<div class="act-time">
					<div class="activity-body act-in" id="cmtCreateDiv">
						<div class="text">
							<p class="attribution">
								<a href="#">최한용</a> at 4:25pm, 30th Octmber 2014
							</p>
							<textarea class="form-control " id="cmts" name="ccomment"
								rows="4"></textarea>
							<br>
							<button class="btn btn-primary btn-sm" id="cmtCreate">등록</button>
						</div>
					</div>
				</div>
				<div class="act-time" id="cmtList">
					<%
						for (Comment_infoDTO cDTO : cList) {
					%>
					<div class="activity-body act-in" id='<%=cDTO.getCmt_no()%>'>
						<div class="text">
							<p class="attribution">
								<a href="#"><%=CmmUtil.nvl(cDTO.getUser_name())%></a>
								<%=CmmUtil.nvl(cDTO.getReg_dt())%>
							</p>
							<div id="cmt_<%=CmmUtil.nvl(cDTO.getCmt_no()) %>" rows="4" name="<%=CmmUtil.nvl(cDTO.getCmt_no()) %>">
							<div id="ccomment" rows="4" name="<%=CmmUtil.nvl(cDTO.getCmt_no()) %>">
								<span><%=CmmUtil.replaceBr(CmmUtil.nvl(cDTO.getContents()))%></span>
							</div>
							<%
								if (cDTO.getUser_no().equals("1")) {
							%>
							<br>
							<button class='btn btn-info btn-sm' id="cmtUpdate">수정</button>
							<button class='btn btn-info btn-sm'
								onclick='cmtDelete(<%=CmmUtil.nvl(cDTO.getCmt_no())%>)'>삭제</button>
							<%
								}
							%>
						</div>
					</div>
					<%
						}
					%>
				</div>
			</section>
		</div>
	</section> <!-- page end--> </section>
	</section>
	<!-- page end-->
	<%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>