<%@page import="com.cupbob.dto.TotalOrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<TotalOrderDTO> tList = (List<TotalOrderDTO>)request.getAttribute("TotalOrderList");
%>
<!DOCTYPE html>
<html>
<%@include file="/include/head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실시간 주문 목록</title>
<script type="text/javascript">
	 $(function(){
		timer = setInterval( function () {
			var contents = "";
			$.ajax ({
				url : "adminOrderInterval.do",  
				success : function (data) {
					$.each(data, function(key, value){
						var checkTimeOver = value.ord_remainTime.split(':');
						var remainMin = Number(checkTimeOver[1]);
						if(value.ord_stat == 1){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary btn-sm\" onclick=\"orderProc("+ value.ord_no + ",2);\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"takeFirst();\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst();\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else if(value.ord_stat == 2){
							if(remainMin <= 0){
								contents += "<tr align=center bgcolor=\"#F5A9A9\">";
							}else{
								contents += "<tr align=center>"
							}
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success btn-sm\" onclick=\"orderProc("+ value.ord_no +",3)\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"cookFirst()\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else if(value.ord_stat ==3){
							contents += "<tr align=center bgcolor=\"#9FF781\">";
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							if(remainMin <= 0){
								contents += "<td id=\"" + value.ord_no + "\"><b>TimeOver</b></td>";
							}else{
								contents += "<td id=\"" + value.ord_no + "\">" + value.ord_remainTime + "</td>";
							}
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"orderProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",5);\">취소하기</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}
						
						/* if(remainMin > 0){
							value.ord_no = setInterval(function(){
								var arr = value.usr_rcv_time.split(':');
								countRemainTime(arr[0], arr[1], value.ord_no, remainMin);
							},1000);
						}else{
							clearInterval(value.ord_no);
						} */
						
					})
				},
				error:function(x,e){
					if(x.status==0){
			            alert('네트워크가 정상적으로 동작하지 않습니다.');
			            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
			            }else if(x.status==404){
			            alert('페이지를 찾을수가 없습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(x.status==500){
			            alert('서버에서 오류가 발생했습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(e=='parsererror'){
			            alert('json파싱에 실패했습니다.');
			            }else if(e=='timeout'){
			            alert('응답 요청 시간이 지났습니다.');
			            }else {
			            alert('Unknow Error.n'+x.responseText);
			            }
			    }
			});
		}, 5000);
	})
	
	function orderProc(ordNo, statNo){
		 location.href="adminOrderProc.do?" + "ordNo=" + ordNo + "&statNo=" + statNo;
	}
	function takeFirst(){
		 alert("접수를 먼저 해야 가능합니다.");
	}
	function cookFirst(){
		alert("조리완료를 먼저 해야 가능합니다.");
	} 
	function orderCancel(ordNo, statNo){
		if(confirm("주문을 취소하시겠습니까?")){
			location.href="adminOrderCancel.do?" + "ordNo=" + ordNo + "&statNo=" + statNo;
		}
	}
	
	//setInterval 안에서 setInterval 돌리면 좆댐 스레드 존나 돌아감
	/*  var cnt = 0;
	function countRemainTime(h, m, ordNo, remain){
		console.log(ordNo + " : " + remain);
		if(remain < 0){
			document.getElementById(ordNo).innerHTML = "<b>TimeOver</b>";
		}else{
			now = new Date();
			dday = new Date(now.getFullYear(),(now.getMonth() + 1),now.getDate(),h,m,00);
			days = (dday-now)/1000/60/60/24;
			daysRound = Math.floor(days);
			var test = dday - now;
			hours = (dday - now)/1000/60/60-(24 * daysRound);
			hoursRound = Math.floor(hours);
			minutes = (dday - now)/1000/60-(24 * 60 * daysRound)-(60 * hoursRound);
			minutesRound = Math.floor(minutes);
			seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
			secondsRound = Math.round(seconds);
			document.getElementById(ordNo).innerHTML = hoursRound + ":" + minutesRound + ":" + secondsRound;
			cnt++;
		}
		console.log(cnt);
	}  */
</script>
</head>
<body>
<%@include file="/include/naviBarAndasideBar.jsp"%>
	 <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-home"></i>메인 화면</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i>메인 화면</li>
					</ol>
				</div>
			</div>
			<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              실시간 주문 목록
                          </header>
                          <div class="panel-body">
								<div class="table-borderd">
                          <table class="table table-advance">
							<thead>
							 <tr align="center" valign="middle">
                                 <th width="5%"><center>주문번호<center></th>
                                 <th width="10%"><center>주문자</center></th>
                                 <th width="15%"><center>상품명</center></th>
                                 <th width="5%"><center>수량</center></th>
                                 <th width="10%"><center>수령 시간</center></th>
                                 <th width="10%"><center>남은 시간</center></th>
                                 <th width="10%"><center>접수 여부</center></th>
                                 <th width="10%"><center>조리 여부</center></th>
                                 <th width="10%"><center>수령 여부</center></th>
                                 <th width="10%"><center>취소 여부</center></th>
                                 <th width="10%"><center>금액</center></th>
                              </tr>
							</thead>
                           <tbody id="interval">
                              <%for(TotalOrderDTO tDTO : tList){
                            	  String ordStat = CmmUtil.nvl(tDTO.getOrd_stat());
                            	  String[] arr = CmmUtil.nvl(tDTO.getOrd_remainTime()).split(":");
                            	  int remainMin = Integer.parseInt(arr[1]);
                            	  if(remainMin < 0 && !(tDTO.getOrd_stat().equals("3"))){%>
                              <tr bgcolor="#F5A9A9">
                              <%
                            	  }else if(tDTO.getOrd_stat().equals("3")){
                              %>
                              <tr align=center bgcolor="#9FF781">
                              <%
                              	   }else{
                              %>
                              <tr>
                              <%
                              	   }
                              %>
                                 <td align=center><%=CmmUtil.nvl(tDTO.getOrd_no()) %></td>
                                 <td align=center><%=CmmUtil.nvl(tDTO.getUser_name()) %>
                                 <td align=center><%=CmmUtil.nvl(tDTO.getPrdt_name()) %></td>
                                 <td align=center><%=CmmUtil.nvl(tDTO.getOrd_amnt()) %></td>
                                 <td align=center><%=CmmUtil.nvl(tDTO.getUsr_rcv_time()) %></td>
                                 <%
                                 if(remainMin<0){
                                 %>
                                 <td align=center id="<%=CmmUtil.nvl(tDTO.getOrd_no())%>"><b>TimeOver</b></td>
                                 <%
                                 }else{
                                 %>
                                 <td align=center id="<%=CmmUtil.nvl(tDTO.getOrd_no())%>"><%=CmmUtil.nvl(tDTO.getOrd_remainTime()) %></td>
                                 <%
                                 }
                                 %>
                                 <%if(ordStat.equals("1")){ %>         
		                           		<td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-primary btn-sm" onclick="orderProc(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 2);">접수 하기</button>
			                                </div>
		                                </td>
		                                <td align=center>
		                                	<div class="btn-group">
		                                    	<button class="btn btn-success btn-sm" onclick="takeFirst();">조리 완료</button>
		                                	</div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-warning btn-sm" onclick="cookFirst();">수령 완료</button>
			                                </div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-danger btn-sm" onclick="orderCancel(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 5);">취소하기</button>
			                                </div>
		                                </td>
                                  <%} else if(ordStat.equals("2")){ %>
                                 		<td align=center>
			                                	접수완료
		                                </td>
		                                <td align=center>
		                                	<div class="btn-group">
		                                    	<button class="btn btn-success btn-sm" onclick="orderProc(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 3);">조리 완료</button>
		                                	</div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-warning btn-sm" onclick="cookFirst();">수령 완료</button>
			                                </div>
		                                </td> 
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-danger btn-sm" onclick="orderCancel(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 5);">취소하기</button>
			                                </div>
		                                </td>
                                  <%} else {%>
                                  		<td align=center>
			                                 	접수완료
		                                </td>
		                                <td align=center>
		                                		조리 완료
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-warning btn-sm" onclick="orderProc(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 4);">수령 완료</button>
			                                </div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-danger btn-sm" onclick="orderCancel(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 5);">취소하기</button>
			                                </div>
		                                </td> 
                                  <%} %>
                                  <td align=center><%=CmmUtil.nvl(tDTO.getPrdt_price())%></td>
                              </tr>
                              <%} %>
                           </tbody>
                        </table>
                        </div>
                        </div>
                      </section>
                        <div style="float:right"><a class="btn btn-info" href="" title="선택하신게 삭제됩니다.">삭제</a></div>
              </div></div>
              <!-- page end-->
          </section>
      </section>
      
	 <%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>