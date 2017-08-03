<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="com.cupbob.dto.User_boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<User_boardDTO> bList = (List<User_boardDTO>)request.getAttribute("userBoardList");
%>
	
<!DOCTYPE html>
<html>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

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
						contents += "<li class='list-group-item list-none-line'>";
						contents += "<div class='contentsArea'>";
						contents += "<h4>";
						contents += "<a href='userBoardDerail.do?bnum"+value.post_no+"'class='contentsLink'>"+value.title+"</a>";
						contents += "</h4>";
						contents += "<span style='vaerical-align: middle;'></span>";
						contents += "</div>";
						contents += "<div class='contentsInfo'>";
						contents += "<span>" + value.user_name + "</span> | <span>" + value.reg_dt + "</span> | <span>조회수</span> | <span>" + value.view_cnt + "</span>";
						contents += "</div>";
						contents += "</li>";
					})
					$('#boardList').html(contents);
				}
			})
	})
})

</script>
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

<title>Inset  </title>

 <style type="text/css">
 <!--
  .searchTitle {
  border: 1px solid #8B8B8B;
  display: inline-block;
  padding: 10px 10px;
  width: 61%;
  
  }
  .searchSelect{
  border: 1px solid #8B8B8B;
  display: inline-block;
  margin-left: 20px;
  padding: 10px 10px;
  height: 42px;
  
  }
 //-->
 </style>


</head>
<body>
	<%@include file="/include/nav.jsp"%>
		<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="searchDiv" align="left">
			<div class="orderHead" style="width:100%;">커 뮤 니 티</div>
			<br />
			<div class="row" >
					<select id="searchSelect" class="searchSelect" >
					<option>제목</option>
					<option>작성자</option>
					<option>내용</option>
				</select>
				
				 <input class= "searchTitle" placeholder="검색 제목을 입력해주세요." type="text" id="boardSearch" ></div>
			
			</div>
			<ul class="list-group list-group-none-line" id="boardList">
				<%
					for (User_boardDTO bDTO : bList) {
				%>
				<li class="list-group-item list-none-line">
					<div class="contentsArea">
						<h4>
							<a href="userBoardDetail.do?bnum=<%=CmmUtil.nvl(bDTO.getPost_no())%>"class="contentsLink"><%=CmmUtil.nvl(bDTO.getTitle())%></a>
						</h4>
						<span style="vaerical-align: middle;"></span>
					</div>
					<div class="contentsInfo">
						<span><%=CmmUtil.nvl(bDTO.getUser_name())%></span> | <span><%=CmmUtil.nvl(bDTO.getReg_dt()) %></span> | <span>조회수</span> | <span><%=CmmUtil.nvl(bDTO.getView_cnt()) %></span>
					</div>
				</li>
				<%
					}
				%>
			</ul>
			<div class="col-xs-12">
			<button class="saButton2" border-radius= "5px" onclick="location.href='userBoardReg.do'">글작성</button>
			</div>
			<br /><br />
				<div class="col-xs-12">
					<button class="moreContents" >더보기</button>
				</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="/include/footer.jsp"%>
</body>
</html>