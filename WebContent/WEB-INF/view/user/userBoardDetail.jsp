<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@page import="com.cupbob.dto.Comment_infoDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="com.cupbob.util.CmmUtil"%>

<%
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
	User_boardDTO bDTO = (User_boardDTO) request.getAttribute("bDTO");
	List<Comment_infoDTO> cList = (List<Comment_infoDTO>) request.getAttribute("cList");
	String contents = bDTO.getContents();
	bDTO.setContents(contents);
%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet" />
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<link rel="stylesheet" href="userBootstrap/css/nav.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>
var updateCheck = false;
var pNo = <%=CmmUtil.nvl(bDTO.getPost_no())%>;
$(function(){
	$('#cmtCreate').bind('click',function() {
		
		var cnts = $('#cnts').val();
		
		console.log(pNo);
		console.log(cnts);
		if(cnts==""){
			alert("댓글을 입력하세요");
			$('#cmtCreate').focus();
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
						if(value.user_no==<%=ss_user_no%>){
							contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
							contents += "<div class="+"contentsArea"+">";
							contents += "<h4 class='reName'>"+value.user_name+"</h4>";
							contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
							contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
							contents += "<h7>"+value.reg_dt+ " </h7> ";
							contents += "<button class='saButton2' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>"+"수정"+"</button> ";
							contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
							contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
							contents +=	" </div>";
							contents += " </div>";
							contents += " <br>";
							contents += " </li>";
						}else{
							contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
							contents += "<div class="+"contentsArea"+">";
							contents += "<h4 class='reName'>"+value.user_name+"</h4>";
							contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
							contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
							contents += "<h7>"+value.reg_dt+ " </h7> ";
							contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
							contents +=	" </div>";
							contents += " </div>";
							contents += " <br>";
							contents += " </li>";
						}			
					$('#cmtList').html(contents);
					$('#cnts').val("");
					})
				}
			})
			}
		})
})

function cmtDelete(cmt_no){
	var cmtNo = cmt_no;
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
								console.log(value.user_name);
								if(value.user_no==<%=ss_user_no%>){
									contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
									contents += "<div class="+"contentsArea"+">";
									contents += "<h4 class='reName'>"+value.user_name+"</h4>";
									contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
									contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
									contents += "<h7>"+value.reg_dt+ " </h7> ";
									contents += "<button class='saButton2' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>"+"수정"+"</button> ";
									contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
									contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
									contents +=	" </div>";
									contents += " </div>";
									contents += " <br>";
									contents += " </li>";
								}else{
									contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
									contents += "<div class="+"contentsArea"+">";
									contents += "<h4 class='reName'>"+value.user_name+"</h4>";
									contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
									contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
									contents += "<h7>"+value.reg_dt+ " </h7> ";
									contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
									contents +=	" </div>";
									contents += " </div>";
									contents += " <br>";
									contents += " </li>";
								}			
								$('#cmtList').html(contents);
							})
						}else{
							var cmtList = "<div id='cmtList'></div>";
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
	if(updateCheck==false){
		var cmtNo = cmt_no;
		var userName = user_name;
		var contents = $('#cmt_'+cmtNo+' > span').html();
		var updateForm = "<div  id="+cmtNo+">" +
		                 "<div class=contentsArea>" + 
		                 "<h4 class='reName'>"+userName+"</h4> </div> <br>" +
		                 "<div class=col-xs-12><input type='text' id='cmtUpdateArea' class='nameFont1' value="+contents+">" +
		                 "<button class='saButton2' id='cmtUpdateBtn' onclick='cmtUpdateProc("+cmtNo+")'>수정</button> "+
		                 "<button class='saButton2' id='cmtUpdateCancle' onclick='cmtUpdateCancle()'>취소</button>"+
		                 "</div> <br> <br> <br>";
		$('#'+cmtNo).html(updateForm);
	}else{
		alert("하나의 댓글만 수정가능합니다");
		return false;
	}
	updateCheck = true;
}
function cmtUpdateProc(cmt_no){
	var cmtNo = cmt_no;
	var contents = $('#cmtUpdateArea').val();
	var allData = {"pNo" : pNo,
			       "cmtNo" : cmtNo,
			       "contents" : contents};
	if(contents==""){
		alert("댓글을 입력하세요");
		$('#cmtUpdateArea').focus();
		return false;
	}else{
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
			updateCheck = false;
			return true;
		}else{
			return false;
		}
	}
}
function cmtUpdateCancle(){
	updateCheck = false;
	$.ajax({
		url : 'cmtList.do',
		method : 'post',
		data : {"pNo" : pNo},
		dataType : 'json',
		success : function(data) {
			var contents = "";
			$.each(data,function(key, value) {
				if(value.user_no==<%=ss_user_no%>){
					contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
					contents += "<div class="+"contentsArea"+">";
					contents += "<h4 class='reName'>"+value.user_name+"</h4>";
					contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
					contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
					contents += "<h7>"+value.reg_dt+ " </h7> ";
					contents += "<button class='saButton2' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>"+"수정"+"</button> ";
					contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
					contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
					contents +=	" </div>";
					contents += " </div>";
					contents += " <br>";
					contents += " </li>";
				}else{
					contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
					contents += "<div class="+"contentsArea"+">";
					contents += "<h4 class='reName'>"+value.user_name+"</h4>";
					contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
					contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
					contents += "<h7>"+value.reg_dt+ " </h7> ";
					contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
					contents +=	" </div>";
					contents += " </div>";
					contents += " <br>";
					contents += " </li>";
				}			
			$('#cmtList').html(contents);
			})
		}
	})
}
function cmtUpdateCancle(){
	updateCheck = false;
	$.ajax({
		url : 'cmtList.do',
		method : 'post',
		data : {"pNo" : pNo},
		dataType : 'json',
		success : function(data) {
			var contents = "";
			$.each(data,function(key, value) {
				if(value.user_no==<%=ss_user_no%>){
					contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
					contents += "<div class="+"contentsArea"+">";
					contents += "<h4 class='reName'>"+value.user_name+"</h4>";
					contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
					contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
					contents += "<h7>"+value.reg_dt+ " </h7> ";
					contents += "<button class='saButton2' onclick=cmtUpdate("+value.cmt_no+","+"'"+value.user_name+"'"+")>"+"수정"+"</button> ";
					contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"삭제"+"</button>";
					contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
					contents +=	" </div>";
					contents += " </div>";
					contents += " <br>";
					contents += " </li>";
				}else{
					contents += "<li class='list-group-item list-none-line '"+ "id="+value.cmt_no+">";
					contents += "<div class="+"contentsArea"+">";
					contents += "<h4 class='reName'>"+value.user_name+"</h4>";
					contents += "<div class='contentsInfo' id='cmt_"+value.cmt_no+"'>";
					contents += "<span>"+ value.contents.replace(/\n/g,'<br>')+ "</span> <br>";	
					contents += "<h7>"+value.reg_dt+ " </h7> ";
					contents += " <button class='saButton2' onclick=cmtDelete("+value.cmt_no+")>"+"답글"+"</button>";
					contents +=	" </div>";
					contents += " </div>";
					contents += " <br>";
					contents += " </li>";
				}			
			$('#cmtList').html(contents);
			})
		}
	})
}
</script>
<title> 소라네 컵밥 커뮤니티</title>

</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<div id="recommMenu">

		<div class="container-fluid">
			<div class="row">
				<!--글 제목-->
				<h2 class="title"><%=CmmUtil.nvl(bDTO.getTitle())%></h2>
				<!--글쓴이 및 글정보-->
				<h7 class="boderdetail"><%=CmmUtil.nvl(bDTO.getUser_name())%>
				| <%=CmmUtil.nvl(bDTO.getReg_dt())%> | 조회수<%=CmmUtil.nvl(bDTO.getView_cnt())%></h7>
			</div>
			<hr>
			<div class="row">
				<div class="bodercontent">
					<!--글 내용-->
					<%=CmmUtil.nvl(bDTO.getContents())%>
				</div>
				<%if(bDTO.getReg_user_no().equals(ss_user_no)){ %>
				<button class="saButton0" onclick="location.href='userBoardDelete.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>'">삭제</button>
				<button class="saButton1" onclick="location.href='userBoardUpdateView.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>';">수정</button>
				<%} %>
				<br />
			</div>
			<hr class="blackHr">

		</div>

		<ul class="list-group list-group-none-line">
			<li class="list-group-item list-none-line">
				<div class="contentsArea">
					<p class="inline0">댓글</p>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<p class="inline1">
						<a href="#" class="black">&#8635;새로고침</a>
					</p>
					<span class="inline2"> <a href="#" class="black">전체댓글보기&#x2771;</a>
					</span> <br> <br>
					<!--글 작성 input-->
					
					<div class="reTitle">	
						<input type="text" class="nameFont" placeholder=" 댓글을 입력해주세요."
							id="cnts">
						<button class="saButton3" id="cmtCreate">등록</button>
						<br> <br>
						<br>
					</div>
					<!-------------->
				</div>
			</li>
			<div id="cmtList">
				<%
					for (Comment_infoDTO cDTO : cList) {
				%>
				<li class="list-group-item list-none-line" id="<%=CmmUtil.nvl(cDTO.getCmt_no())%>">
					<div class="contentsArea">
						<h4 class="reName"><%=CmmUtil.nvl(cDTO.getUser_name())%></h4>
						<div class="contentsInfo"
							id="cmt_<%=CmmUtil.nvl(cDTO.getCmt_no())%>">
							<span><%=CmmUtil.replaceBr(CmmUtil.nvl(cDTO.getContents()))%></span><br />
							<h7 class="reDate"><%=CmmUtil.nvl(cDTO.getReg_dt())%></h7>
							<%
								if (cDTO.getUser_no().equals(ss_user_no)) {
							%>
							<button class='saButton2'
								onclick='cmtUpdate(<%=CmmUtil.nvl(cDTO.getCmt_no())%>,"<%=CmmUtil.nvl(cDTO.getUser_name())%>")'>수정</button>
							<button class='saButton2'
								onclick='cmtDelete(<%=CmmUtil.nvl(cDTO.getCmt_no())%>)'>삭제</button>
							<%
								}
							%>
							<button class="saButton2">답글</button>
						</div>
					</div> <br />
				</li>
				<%
					}
				%>
			</div>
		</ul>
		<div align=center>
			<button class="saButton4" onclick="location.href='userBoardList.do'">목
				록</button>
		</div>
	</div>

	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
