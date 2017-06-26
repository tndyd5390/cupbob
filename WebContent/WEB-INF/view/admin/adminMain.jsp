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
					<h3 class="page-header"><i class="fa fa-table"></i>메인 화면</h3>
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
                                 <th><i class="icon_pin_alt"></i>옵션</th>
                                 <th><i class="icon_mobile"></i>수량</th>
                                 <th><i class="icon_cogs"></i>수령시간</th>
                                 <th><i class="icon_cogs"></i>접수</th>
                                 <th><i class="icon_cogs"></i>취소</th>
                                 <th><i class="icon_cogs"></i>수령여부</th>
                                 <th><i class="icon_cogs"></i>금액</th>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td>20170001</td>
                                 <td>불고기컵밥</td>
                                 <td align="center">-</td>
                                 <td>1</td>
                                 <td>13:00</td>         
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                  <td>3500</td>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td>20170002</td>
                                 <td>김치컵밥</td>
                                 <td>치즈토핑 1</td>
                                 <td>1</td>
                                 <td>13:10</td>	
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                  <td>4000</td>
                              </tr>
                              <tr>
                                 <td><input type="checkbox"></td>
                                 <td>20170003</td>
                                 <td>불고기컵밥<br>숙주컵밥</td>
                                 <td align="center">-</td>
                                 <td>1<br>1</td>
                                 <td>13:20</td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                  </div>
                                  </td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                  <td>7000</td>
                              </tr>                           
                           </tbody>
                        </table>
                      </section>
                        <div style="float:right"><a class="btn btn-info" href="" title="선택하신게 삭제됩니다.">삭제</a></div>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
	 <%@include file="/include/bottomJavaScript.jsp"%>
</body>
</html>