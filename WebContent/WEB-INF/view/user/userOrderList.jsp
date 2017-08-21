<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cupbob.dto.TotalOrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<TotalOrderDTO> totalList = (List<TotalOrderDTO>)request.getAttribute("totalList");
	String unum = (String) request.getAttribute("uNum");
	System.out.println(unum);
	int trCount = 0;
	int toggleCount = 0;
%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<script type="text/javascript">
	function doToggle(trOrdNo, ordNo){
		var ord = ordNo.toString();
		$('#bcTarget_' + trOrdNo).barcode(ord, 'code128', {barWidth:2, barHeight:60});
		console.log("asdfasdf");
		$('#Toggle' + trOrdNo).toggle();
		$('#Toggle2'+ trOrdNo).toggle();
	}
</script>
<title>주문 내역</title>
<style>
	.input-group > input.listText{
		height:40px;
		width:75%;
	}
	.input-group{
	width:100%;
	}
	.listGroup{
		padding: 0px 0px;
		width:25%;
	}
	select.listSelect{
		height:39px;
		font-size: 11px;
		font-weight:bold;
		padding:0px 0px 0px 0px;
		text-align:center;
	}
	.searchButton{
		margin-left:3px;
		background-color:#FFFFFF;
		border: 4px #595959 solid;
		width:23%;
		height:40px;
		font-weight:bold;
		text-align:center;
		font-size:14px;
	}
	.input-group .form-control:not(:first-child):not(:last-child), .input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child) {
     	border-radius: 4px; 
	}
	
	table.tableFont > thead > tr > th{
		text-align:center;
		font-size:10px;
	}
	table.tableFont > tbody > tr > td{
		text-align:center;
		font-size:10px;
	}
	.moreButton{
		background-color:#3C3C3C;
		height:40px;
		color:#FFFFFF;
		text-align:center;
		width:100%;
		border : 0px;
		font-size : 20px;
		font-weight:bold;
		
	}
	
.tableToggle{
	background-color : #F9EFD3;
}

div.barCode{
	display : none;
}

	/* 350px 이하 (아이폰5)*/
@media screen and (max-width: 350px) {
	table.tableFont > thead > tr > th{
		text-align:center;
		font-size:8px;
	}
	table.tableFont > tbody > tr > td{
		text-align:center;
		font-size:8px;
	}
}
/* 351px 이상 370px 이하(갤럭시5) */
@media screen and (min-width: 351px) and (max-width: 370px){
	.searchButton{
			margin-left:3px;
			background-color:#FFFFFF;
			border: 4px #595959 solid;
			width:23.5%;
			height:40px;
			font-weight:bold;
			text-align:center;
			font-size:14px;
	}
	.input-group > input.listText{
		height:40px;
		width:75%;
	}
	.listGroup{
		padding: 0px 0px;
		width:28%;
	}
	
}
/* 371px 이상 400px 이하(아이폰6) */
@media screen and (min-width: 371px) and (max-width: 400px){
	.listGroup{
		padding: 0px 0px;
		width:31%;
	}
		table.tableFont > thead > tr > th{
		text-align:center;
		font-size:9px;
	}
	table.tableFont > tbody > tr > td{
		text-align:center;
		font-size:9px;
	}
}
/* 401px 이상 700px 이하 (아이폰6플러스,넥서스)*/
@media screen and (min-width: 401px) and (max-width: 700px){
	.input-group > input.listText{
		height:40px;
	}
}

@media screen and (min-width: 701px) and (max-width: 1500px){
		table.tableFont > thead > tr > th{
		text-align:center;
		font-size:13px;
	}
	table.tableFont > tbody > tr > td{
		text-align:center;
		font-size:13px;
	}
}

	
</style>
<script>
<%
	for(int i=0; i<totalList.size();i++){
%>
	$(function(){
			$('#bcTarget_<%=totalList.get(i).getOrd_no()%>').barcode('<%=totalList.get(i).getOrd_no()%>', 'code128', {barWidth:2, barHeight:60});     
	    	$('#tr<%=totalList.get(i).getOrd_no()%>').click(function(){
	    		$('#Toggle<%=totalList.get(i).getOrd_no()%>').toggle();
	    		$('#Toggle2<%=totalList.get(i).getOrd_no()%>').toggle();
	    	})
	});
<%
	}
%>

</script>
</head>
<body>
<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form class="form">
		<div class="orderHead">주문 내역</div>
	<!--  	<div class="input-group">
			<div class="input-group-addon listGroup">
				<select class="form-control listSelect">
					<option>선택</option>
					<option>주문 번호</option>
					<option>날짜</option>
					<option>결제 금액</option>
					<option>주문 상태</option>
				</select>
			</div>
		<input type="text" class="form-control listText">
		<button class="searchButton">검색</button>
		</div>  -->
		<table class="table table-hover tableFont table-relative">
			<thead>
				<th>주문번호</th>
				<th>주문내역</th>
				<th>날짜</th>
				<th>결제금액</th>
				<th>주문상태</th>
			</thead>
			<tbody id="orderList">
			<%if(totalList.size()==0){%>
				<tr><td colspan=5>
					<h4 align="center">주문내역이 없습니다.</h4>
				</td></tr>
			<% }else{
				for(TotalOrderDTO tDTO : totalList){
					String[] prdtName = tDTO.getPrdt_name().split(";");
					String[] prdtPrice = tDTO.getPrdt_price().split(";");
					trCount ++;
					toggleCount ++;
			%> 
			<tr id="tr<%=tDTO.getOrd_no()%>">
 				<td><%=tDTO.getOrd_no() %></td>
				<%
					if(prdtName.length >=1){			
						String prdtList = "";
						String prdtPriceList = "";
						/* for(String tmp : prdtName){
							  prdtList += tmp  + " X 1 <br>";
						  }
						  for(String tmp : prdtPrice){
							  prdtList1 += tmp + " X 1 <br>";
						  } */
						  Map<String, Integer> prdtMap = new HashMap();
						  Map<String, Integer> priceMap = new HashMap();
						  for(int i = 0; i< prdtName.length; i++){
							  if(prdtMap.containsKey(prdtName[i])){
								  System.out.print(prdtPrice[i]);
								  prdtMap.put(prdtName[i], prdtMap.get(prdtName[i]) + 1);
								  priceMap.put(prdtPrice[i] + "", priceMap.get(prdtPrice[i]) +  Integer.parseInt(prdtPrice[i]));
							  }else{
								  prdtMap.put(prdtName[i], 1);
								  priceMap.put(prdtPrice[i],Integer.parseInt(prdtPrice[i]));
							  }
						  }
						  Iterator<String> keyss = priceMap.keySet().iterator();
						  while(keyss.hasNext()){
							  String key = keyss.next();
							  prdtPriceList = CmmUtil.addComma(priceMap.get(key)) + "원<br>" + prdtPriceList;
						  }
						  Iterator<String> keys = prdtMap.keySet().iterator();
						  while(keys.hasNext()){
							  String key = keys.next();
								  int tmp = prdtMap.get(key);
								  prdtList += key + "x" + tmp + "<br>";		  
						  }
				%> 
 				<%if(prdtMap.size() > 1){ %>
 				<td><%=prdtName[0]%> 외 <%=prdtMap.size()-1%>건</td>
 				<%}else{ %>
 				<td><%=prdtName[0]%></td>
 				<%} %>
				<td><%=tDTO.getOrd_dt() %></td>
				<td><%=CmmUtil.addComma(tDTO.getTotal_ord_price())%>원</td>
				<%
					String oStat = tDTO.getOrd_stat();
					if(oStat.equals("1")){
				%>
				<td>접수대기</td>
				<%
					}else if(oStat.equals("2")){
				%> 
				<td>조리중</td>
				<%
					}else if(oStat.equals("3")){
				%>
				<td>조리완료</td>
				<%
					}else if(oStat.equals("4")){
				%>
				<td>수령완료</td>
				<%
					}else{
				%>
				<td>주문취소</td>
				<%
					}
				%>
			</tr>
			<tr id="Toggle<%=tDTO.getOrd_no()%>" class="tableToggle" style="display:none;">
				<td></td>
				<td><%=prdtList%></td>
				<td></td>
				<td><%=prdtPriceList%></td>
				<td></td>
			</tr>
			<tr id="Toggle2<%=tDTO.getOrd_no()%>" style="display:none;">
				<td colspan="5" height="80px">
					<center><div id="bcTarget_<%=tDTO.getOrd_no()%>"></div></center>
				</td>
			</tr>
			<%
					}
				}
			}
			%>
			
			</tbody>
		</table>
<script>
var count = 5;
var toggleCount = 5;
$(function(){
	$('#more_Button').click(function(){
		$.ajax({
			url : 'orderListMore.do',
			method : 'post',
			data : {
				'count' : count,
				'uNum' : '<%=unum%>'
			},
			dataType : 'json',
			success : function(data){
				var contents = '';
				$.each(data,function (key,value){
					toggleCount++;
					var oStat = value.ord_stat;
					contents += "<tr id='tr"+value.ord_no+"' onclick=\"doToggle(" + value.ord_no + "," + value.ord_no + ");\">";
					contents += "<td>" + value.ord_no + "</td>"
					contents += "<td>" + value.prdt_name +  "</td>";
					contents += "<td>" + value.ord_dt +  "</td>";
					contents += "<td>" + value.total_ord_price + "원 </td>";
					if(oStat == 1){
						contents += "<td>접수대기</td>";
					}else if(oStat == 2){
						contents += "<td>조리중</td>";
					}else if(oStat == 3){
						contents += "<td>조리완료</td>";
					}else if(oStat == 4){
						contents += "<td>수령완료</td>";
					}else{
						contents += "<td>주문취소</td>";
					}
					contents += "</tr>";
					contents += "<tr id='Toggle"+value.ord_no+"' class='tableToggle' style='display:none;'>";
					contents += "<td></td>"
					contents += "<td>" + value.prdt_name_List +  "</td>";
					contents += "<td></td>";
					contents += "<td>" + value.prdt_price + "</td>";
					contents += "<td></td>";
					contents += "</tr>";
					contents += "<tr id=\"Toggle2" + value.ord_no + "\" style=\"display:none;\">";
					contents += "<td colspan=\"5\" height=\"80px\">";
					contents += "<center><div id=\"bcTarget_" + value.ord_no + "\"></div></center>";
					contents += "</td></tr>";
				})
				console.log(data);
				console.log(toggleCount);
				$('#orderList').append(contents);
				if((data).length==0){
					$('#more_Button').remove();
				}
			}
		})
	count += 5;
	})
})		
</script>
<%
	if(totalList.size() != 0){
%>
		<button type="button" class="moreButton" id="more_Button">더 보 기</button>
<%
	}
%>
	</form>
	<br>
	<br><div align="center">
	<%@include file="/include/footer.jsp"%></div>
</body>
</html>