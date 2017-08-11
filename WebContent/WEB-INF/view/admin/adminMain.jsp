<%@page import="com.cupbob.util.PayUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.cupbob.dto.TotalOrderDTO"%>
<%@page import="java.util.List"%>
<%@ page import="com.cupbob.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<TotalOrderDTO> tList = (List<TotalOrderDTO>)request.getAttribute("TotalOrderList");
	String ss_userNo = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
	String ss_userEmail = CmmUtil.nvl((String) session.getAttribute("ss_user_email"));
%>
<!DOCTYPE html>
<html>
<%@include file="/include/head.jsp"%>
<head>

<%
if (ss_userEmail==""||!(ss_userEmail.equals("kangseokopo@gmail.com"))) {
	response.sendRedirect("adminLogin.do");
}else{%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실시간 주문 목록</title>
<script type="text/javascript">
	 $(function(){
		timer = setInterval( function () {
			$.ajax ({
				url : "adminOrderInterval.do",  
				success : function (data) {
					console.log(data);
					var count = Object.keys(data).length;
					if(count != 0){
					var contents = "";
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel('" + value.tid  + "','" + value.payment_tp + "');\">취소하기</button></div></td>";
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel('" + value.tid  + "','" + value.payment_tp + "');\">취소하기</button></div></td>";
								contents += "<td>" + value.prdt_price + "</td>";
								contents += "</tr>"
								$('#interval').html(contents);
							}else{
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel('" + value.tid  + "','" + value.payment_tp + "');\">취소하기</button></div></td>";
								contents += "<td>" + value.prdt_price + "</td>";
								contents += "</tr>"
								$('#interval').html(contents);
							}
						})
					}else{
						$('#interval').html('');
					}
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
	
	function barcodeProc(ordNo, statNo){
		 var barcodePage = "barcodePage.do?ordNo="+ordNo+"&statNo="+statNo;
		 var popOption = "width=370, height=360,resizable=no, scrollbars=no, status=no;";
		 	window.open(barcodePage,"",popOption);
	}
		function orderProc(ordNo, statNo){
			$.ajax ({
				url : "adminOrderProc.do",
				type : "post",
				data : {
					'ordNo' : ordNo,
					'statNo' : statNo
				},
				success : function (data) {
					var count = Object.keys(data).length;
					if(count != 0){
						var contents = "";
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel('" + value.tid  + "','" + value.payment_tp + "');\">취소하기</button></div></td>";
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel('" + value.tid  + "','" + value.payment_tp + "');\">취소하기</button></div></td>";
								contents += "<td>" + value.prdt_price + "</td>";
								contents += "</tr>"
								$('#interval').html(contents);
							}else{
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel('" + value.tid  + "','" + value.payment_tp + "');\">취소하기</button></div></td>";
								contents += "<td>" + value.prdt_price + "</td>";
								contents += "</tr>"
								$('#interval').html(contents);
							}
							
							
						})
					}else{
						$('#interval').html('');
					}
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
	}
	 
	function takeFirst(){
		 alert("접수를 먼저 해야 가능합니다.");
		 return;
	}
	function cookFirst(){
		alert("조리완료를 먼저 해야 가능합니다.");
		return;
	} 
	
	function orderCancel(tid, payTp){
		if(confirm("주문을 취소하시겠습니까?")){
			var f = document.getElementById('frmPayment');
			if(payTp == "p"){
				payTp = "PHON";
			}else{
				payTp = "CARD"
			}
			f.TRAN_TYPE.value=payTp;
			f.TID.value=tid;
			f.CANCEL_ID.value='<%=CmmUtil.nvl((String)session.getAttribute("ss_user_email"))%>';
			f.CANCEL_CAUSE.value="non";
			f.submit();
			/* $.ajax ({
				url : "adminOrderCancel.do",
				type : "post",
				data : {
					'ordNo' : ordNo,
					'statNo' : statNo
				},
				success : function (data) {
					var count = Object.keys(data).length;
					if(count != 0){
						var contents = "";
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
							}else{
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
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-warning btn-sm\" onclick=\"barcodeProc(" + value.ord_no + ",4)\">수령 완료</button></div></td>";
								contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger btn-sm\" onclick=\"orderCancel(" + value.ord_no  + ",5);\">취소하기</button></div></td>";
								contents += "<td>" + value.prdt_price + "</td>";
								contents += "</tr>"
								$('#interval').html(contents);
							}
							
							
						})
					}else{
						$('#interval').html('');
					}
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
			}); */
		}
	}
</script>
<style type="text/css">
	.tableFont{
		font-size: 11px;
	}
</style>
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
							<thead class="tableFont">
							 <tr align="center">
                                 <th align="center" style="text-align: center;" >주문번호</th>
                                 <th align="center" style="text-align: center;">주문자</th>
                                 <th align="center" style="text-align: center;">상품명</th>
                                 <th align="center" style="text-align: center;">수량</th>
                                 <th align="center" style="text-align: center;">수령 시간</th>
                                 <th align="center" style="text-align: center;">남은 시간</th>
                                 <th align="center" style="text-align: center;">접수 여부</th>
                                 <th align="center" style="text-align: center;">조리 여부</th>
                                 <th align="center" style="text-align: center;">수령 여부</th>
                                 <th align="center" style="text-align: center;">취소 여부</th>
                                 <th align="center" style="text-align: center;">금액</th>
							</thead>
                           <tbody id="interval" class="tableFont">
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
		                                    	<a href="#"><button class="btn btn-success btn-sm" onclick="takeFirst();">조리 완료</button></a>
		                                	</div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-warning btn-sm" onclick="cookFirst();">수령 완료</button>
			                                </div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getTid())%>','<%=CmmUtil.nvl(tDTO.getPayment_tp())%>');">취소하기</button>
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
			                                    <button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getTid())%>', '<%=CmmUtil.nvl(tDTO.getPayment_tp())%>');">취소하기</button>
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
			                                    <button class="btn btn-warning btn-sm" onclick="barcodeProc(<%=CmmUtil.nvl(tDTO.getOrd_no())%>, 4);">수령 완료</button>
			                                </div>
		                                </td>
		                                <td align=center>
			                                <div class="btn-group">
			                                    <button class="btn btn-danger btn-sm" onclick="orderCancel('<%=CmmUtil.nvl(tDTO.getTid())%>', '<%=CmmUtil.nvl(tDTO.getPayment_tp())%>');">취소하기</button>
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
                      <form method="post" name="frmPayment" id="frmPayment" style="display: none;" action="https://pg.paynuri.com/paymentgateway/cancelPayment.do" accept-charset="euc-kr" target="_self">
                      	<input type="hidden" id="STOREID" name="STOREID" value="1500000088">
                      	<input type="hidden" id="TRAN_TYPE" name="TRAN_TYPE">
                      	<input type="hidden" id="KIND" name="KIND" value="0420">
                      	<input type="hidden" id="TID" name="TID">
                      	<input type="hidden" id="CANCEL_ID" name="CANCEL_ID">
                      	<input type="hidden" id="CANCEL_CAUSE" name="CANCEL_CAUSE">
                      </form>
              </div></div>
              <!-- page end-->
          </section>
      </section>
      
	 <%@include file="/include/bottomJavaScript.jsp"%>
</body>
<%
}
%>
</html>