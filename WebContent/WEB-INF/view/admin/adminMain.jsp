<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/include/head.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
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
                           <tbody>
                              <tr>
                                 <th><input type="checkbox"></th>
                                 <th><i class="icon_calendar"></i>주문번호</th>
                                 <th><i class="icon_mail_alt"></i>상품명</th>
                                 <th><i class="icon_mobile"></i>수량</th>
                                 <th><i class="icon_cogs"></i>수령시간</th>
                                 <th><i class="icon_cogs"></i>접수</th>
                                 <th><i class="icon_cogs"></i>취소</th>
                                 <th><i class="icon_cogs"></i>수령여부</th>
                                 <th><i class="icon_cogs"></i>금액</th>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td><%=CmmUtil.nvl(tDTO.getOrd_no()) %></td>
                                 <td><%=CmmUtil.nvl(tDTO.getUser_name()) %>
                                 <td><%=CmmUtil.nvl(tDTO.getPrdt_name()) %></td>
                                 <td><%=CmmUtil.nvl(tDTO.getOrd_amnt()) %></td>
                                 <td><%=CmmUtil.nvl(tDTO.getUsr_rcv_time()) %></td>         
                              </tr>                           
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