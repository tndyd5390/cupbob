<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
					console.log(data);
					$.each(data, function(key, value){
						if(value.ord_stat == 1){
							contents += "<tr>"
							contents += "<td><input type=\"checkbox\"></td>";
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td align=\"center\"> </td>"
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-primary\" href=\"#\">접수하기</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success\" href=\"#\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger\" href=\"#\">수령 완료</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else if(value.ord_stat == 2){
							contents += "<tr>"
							contents += "<td><input type=\"checkbox\"></td>";
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td align=\"center\"> </td>"
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							contents += "<td>접수 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-success\" href=\"#\">조리 완료</button></div></td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger\" href=\"#\">수령 완료</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}else if(value.ord_stat ==3){
							contents += "<tr>"
							contents += "<td><input type=\"checkbox\"></td>";
							contents += "<td>" + value.ord_no + "</td>";
							contents += "<td>" + value.user_name + "</td>";
							contents += "<td>" + value.prdt_name + "</td>";
							contents += "<td align=\"center\"> </td>"
							contents += "<td>" + value.ord_amnt + "</td>";
							contents += "<td>" + value.usr_rcv_time + "</td>";
							contents += "<td>접수 완료</td>";
							contents += "<td>조리 완료</td>";
							contents += "<td><div class=\"btn-group\"><button class=\"btn btn-danger\" href=\"#\">수령 완료</button></div></td>";
							contents += "<td>" + value.prdt_price + "</td>";
							contents += "</tr>"
							$('#interval').html(contents);
						}
					})
				},
				error:function(x,e){
					if(x.status==0){
			            alert('네트워크가 정상적으로 동작하지 않습니다.');
			            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
			            }else if(x.status==404){
			            alert('페이지를 찾을수가 없습니다. 지금은 주문을 받을 수 없습니다. 업체에게 문의하세요.');
			            }else if(x.status==500){
			            alert('서버에서 오류가 발생했습니다. 지금은 주문을 받을 수 없습니다. 업체게게 문의하세요.');
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
                          <table class="table table-striped table-advance table-hover">
							<thead>
							 <tr>
                                 <th><input type="checkbox"></th>
                                 <th><i class="icon_calendar"></i>주문번호</th>
                                 <th><i class="icon_calendar"></i>주문자</th>
                                 <th><i class="icon_mail_alt"></i>상품명</th>
                                 <th><i class="icon_mobile"></i>수량</th>
                                 <th><i class="icon_cogs"></i>수령시간</th>
                                 <th><i class="icon_cogs"></i>접수</th>
                                 <th><i class="icon_cogs"></i>취소</th>
                                 <th><i class="icon_cogs"></i>수령여부</th>
                                 <th><i class="icon_cogs"></i>금액</th>
                              </tr>
							</thead>
                           <tbody id="interval">
                              <%for(TotalOrderDTO tDTO : tList){ %>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td><%=CmmUtil.nvl(tDTO.getOrd_no()) %></td>
                                 <td><%=CmmUtil.nvl(tDTO.getUser_name()) %>
                                 <td><%=CmmUtil.nvl(tDTO.getPrdt_name()) %></td>
                                 <td><%=CmmUtil.nvl(tDTO.getOrd_amnt()) %></td>
                                 <td><%=CmmUtil.nvl(tDTO.getUsr_rcv_time()) %></td>         
                                 <td>
                                  <div class="btn-group">
                                      <button class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></button>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <button class="btn btn-success" href="#"><i class="icon_check_alt2"></i></button>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <button class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></button>
                                  </div>
                                  </td>
                                  <td><%=CmmUtil.nvl(tDTO.getPrdt_price())%></td>
                              </tr>
                              <%} %>
                           </tbody>
                        </table>
                        </div>
                      </section>
                        <div style="float:right"><a class="btn btn-info" href="" title="선택하신게 삭제됩니다.">삭제</a></div>
              </div>
              <!-- page end-->
          </section>
      </section>
	 <%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>