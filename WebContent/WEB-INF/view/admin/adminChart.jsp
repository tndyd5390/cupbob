<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	
<%@ page import="com.cupbob.util.CmmUtil" %>
<!DOCTYPE html>

<%

String ss_userEmail = CmmUtil.nvl((String) session.getAttribute("ss_user_email"));
String ss_userNo = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
%>
<html lang="en">
  <head>
<%@include file="/include/head.jsp" %>

	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script>
    setTimeout("location.reload()",1000 * 60 * 60 * 6);
    $(function() {
    	
			/* $.ajax({
				url : "monthChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var arr = new Array();
					$.each(data, function(key,value){
						dt = {'label' : value.prdt_name, 'value' : value.count}
						arr.push(dt)
					});
					Morris.Donut({
						element : 'morris-donut-chart',
						data : arr
					});				
				}
			}); */
			
			$.ajax({
				url : "monthChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					$('#morris-donut-chart').html("<canvas id='monthChart'></canvas>");
					var ctx = $('#monthChart').get(0).getContext('2d');
					var dt = "";
					var dt1 = "";
					var arr = new Array();
					var arr1 = new Array();
					$.each(data, function(key,value){
						dt = value.prdt_name;
						dt1 = value.count;
						arr.push(dt);
						arr1.push(dt1);
					});
					if(data.length!=0){
						var myChart = new Chart(ctx, {
						    type: 'bar',
						    data: {
						        labels: arr,
						        datasets: [{
						            label: '갯수',
						            data: arr1,
						            backgroundColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
						            borderColor: ['rgb(23, 119, 203)','rgb(54, 162, 235)','rgb(96, 191, 255)'],
						            borderWidth : 1
						        }]
						    },
						});
					}else{
						$('#morris-donut-chart').html("<canvas id='monthChart'></canvas>");
					}		
				}
			});
			
			/* $.ajax({
				url : "weekChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var arr = new Array();
					$.each(data, function(key, value){
						dt = { 'year' : value.reg_dt, 'count' : value.count};
						arr.push(dt);
					});
			        Morris.Area({
			        	  element: 'morris-area-chart',
			        	  data: arr,
			        	  xkey: 'year',
			        	  ykeys: ['count'],
			        	  labels: ['총 판매량']
			        	});
				}
			}); */
			$.ajax({
				url : "weekChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var dt1 = "";
					var arr = new Array();
					var arr1 = new Array();
					$('#morris-area-chart').html("<canvas id='totalChart'></canvas>");
					var ctx1 = $('#totalChart').get(0).getContext('2d');
					$.each(data, function(key, value){
						dt = value.reg_dt;
						dt1 = value.count;
						arr.push(dt);
						arr1.push(dt1);
					});
					var totalChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : arr,
							datasets : [{
								label : '판매갯수',
								backgroundColor : 'rgb(23, 119, 203)',
								data : arr1,
								fill : false,
								pointRadius : 10,
								pointHoberRadius : 15,
								showLine : false
							}]
						},
						options :{
							elements :{
								point : {
									pointStyle : 'triangle'
								}
							} 
						}
					})
				
				}
			});
			
			/* $.ajax({
				url : "weekOrdPriceChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var arr = new Array();
					$.each(data, function(key, value){
						dt = { 'year' : value.reg_dt, 'count' : value.count, 'totalPrice' : value.price};
						arr.push(dt);
					});
			        Morris.Line({
			        	  element: 'morris-line-chart',
			        	  data: arr,
			        	  xkey: 'year',
			        	  ykeys: ['count', 'totalPrice'],
			        	  labels: ['총 주문갯수(개)', '총 매출(천원)']
			        	});
				}
			}); */
			
			$.ajax({
				url : "weekOrdPriceChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var dt1 = "";
					var dt2 = "";
					var arr = new Array();
					var arr1 = new Array();
					var arr2 = new Array();
					$('#morris-line-chart').html("<canvas id='priceChart'></canvas>");
					var ctx1 = $('#priceChart').get(0).getContext('2d');
					$.each(data, function(key, value){
						dt = value.reg_dt;
						dt1 = value.count;
						dt2 = value.price;
						arr.push(dt);
						arr1.push(dt1);
						arr2.push(dt2);
					});
			        var config = {
			        		type : 'line',
			        		data : {
			        			labels : arr,
				        		datasets: [{
				        			label : "주문갯수",
				        			fill : false,
				        			borderColor : 'rgb(23, 119, 203)',
				        			backgroundColor : 'rgb(23, 119, 203)',
				        			data: arr1
				        		},{
				        			label : "매출(원)",
				        			fill : true,
				        			backgroundColor : 'rgb(255, 177, 193)',
				        			data : arr2
				        		}]
			        		}
			        };
			        var priceChart = new Chart(ctx1, config);
				}
			});
				
			/* $.ajax({
				url : "weekGenderChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var arr = new Array();
					$.each(data, function(key, value){
						dt = { 'year' : value.reg_dt, 'male_count' : value.male_count, 'female_count' : value.female_count}
						arr.push(dt)
					});
				    function regSort(a ,b){
				    	if(a.year == b.year){
				    		return 0;
				    	}
				    	return a.year > b.year ? 1:-1;
				    };
					Morris.Bar({
		            element: 'morris-bar-chart',
		            data: arr.sort(regSort),
		            xkey: 'year',
		            ykeys: ['male_count', 'female_count'],
		            labels: ['남성', '여성'],
		            hideHover: 'auto',
		            resize: true
		        });
				}
			}); */
			
			$.ajax({
				url : "weekGenderChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var dt1 = "";
					var dt2 = "";
					var arr = new Array();
					var arr1 = new Array();
					var arr2 = new Array();
					$('#morris-bar-chart').html("<canvas id='genderChart'></canvas>");
					var ctx = $('#genderChart').get(0).getContext('2d');
					$.each(data, function(key, value){
						dt = value.reg_dt;
						dt1 = value.male_count;
						dt2 = value.female_count;
						arr.push(dt);
						arr1.push(dt1);
						arr2.push(dt2);
					});
				    var barChartData = {
				    	labels : arr,
				    	datasets : [{
				    		label : '남성',
				    		backgroundColor : 'rgb(23, 119, 203)',
				    		data : arr1
				    	},{
				    		label : '여성',
				    		backgoundColor : 'rgb(255, 177, 193)',
				    		data : arr2
				    	}]
				    };
				    var genderChart = new Chart(ctx, {
				    	type : 'bar',
				    	data : barChartData,
				    	options:{
				    		scales : {
				    			xAxes : [{
				    				stacked : true
				    			}],
				    			yAxes : [{
				    				stacked : true
				    			}]
				    		}
				    	}
				    })
				}
			});

    });
</script>

 	<title>소라네 컵밥</title>
  </head>
  <body>
  
<%
if (ss_userEmail==""||!(ss_userEmail.equals("kangseokopo@gmail.com"))) {
		response.sendRedirect("adminLogin.do");
}else{%>
<%@include file="/include/naviBarAndasideBar.jsp"%> 
      <!--main content start-->
      <section id="main-content">
        <section class="wrapper">
		<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">분석 차트</h1>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            	주간 총 판매량 
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                           성별 판매량
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-bar-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            매출 그래프
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-line-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            월간 메뉴 판매량
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-donut-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
      </section>
      <!--main content end-->
      <div class="text-right">
            <div class="credits">
                <!--
                    All the links in the footer should remain intact.
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
                -->
                <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
    </section>
    <!-- container section end -->
    <!-- javascripts -->
    <script src="adminBootstrap/js/jquery.js"></script>
    <script src="adminBootstrap/js/jquery-1.8.3.min.js"></script>
    <script src="adminBootstrap/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="adminBootstrap/js/jquery.scrollTo.min.js"></script>
    <script src="adminBootstrap/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- chartjs -->
    <!-- custom chart script for this page only-->
    <!--custome script for all page-->
    <script src="adminBootstrap/js/scripts.js"></script>
    <script src="adminBootstrap/vendor/raphael/raphael.min.js"></script>
  </body>
  <%
}
  %>
</html>
