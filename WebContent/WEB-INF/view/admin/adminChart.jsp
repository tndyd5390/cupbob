<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <!-- Bootstrap CSS -->    
    <link href="adminBootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="adminBootstrap/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="adminBootstrap/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="adminBootstrap/css/font-awesome.min.css" rel="stylesheet" />    
    <!-- full calendar css-->
    <link href="adminBootstrap/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
	<link href="adminBootstrap/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
    <!-- easy pie chart-->
    <link href="adminBootstrap/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    <!-- owl carousel -->
    <link rel="stylesheet" href="adminBootstrap/css/owl.carousel.css" type="text/css">
	<link href="adminBootstrap/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    <!-- Custom styles -->
	<link rel="stylesheet" href="adminBootstrap/css/fullcalendar.css">
	<link href="adminBootstrap/css/widgets.css" rel="stylesheet">
    <link href="adminBootstrap/css/style.css" rel="stylesheet">
    <link href="adminBootstrap/css/style-responsive.css" rel="stylesheet" />
	<link href="adminBootstrap/css/xcharts.min.css" rel=" stylesheet">	
	<link href="adminBootstrap/css/jquery-ui-1.10.4.min.css" rel="stylesheet">
    <link href="adminBootstrap/vendor/morrisjs/morris.css" rel="stylesheet">
 	<title>분석 차트</title>
  </head>


  <body>
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
                            	월간 컵밥 판매 
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
                                           포장, 방문 고객 그래프
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
                            월간 컵밥 판매
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
    <script src="adminBootstrap/vendor/morrisjs/morris.min.js"></script>
    <script>
    $(function() {
			$.ajax({
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
			})
			
			$.ajax({
				url : "monthChart.do",
				method : "post",
				dataType : "json",
				success : function(data){
					var dt = "";
					var arr = new Array();
					$.each(data, function(key, value){
						dt = {'y' : value.reg_dt, 'a' : value.prdt_name, 'b' : value.count}
						arr.push(dt)
					});
					console.log(JSON.stringify(arr))
					Morris.Line({
						element : 'morris-area-chart',
						data : arr,
						xkey: 'y',
						ykey: ['a', 'b'],
						labels:['a' , 'b'],
						hideHover : 'auto',
						resize : true
					});
				}
				
			})
			
			
			
			Morris.Bar({
            element: 'morris-bar-chart',
            data: [{
                y: '2017.06.01',
                a: 100,
                b: 90
            }, {
                y: '2017.06.02',
                a: 75,
                b: 65
            }, {
                y: '2017.06.03',
                a: 50,
                b: 40
            }, {
                y: '2017.06.04',
                a: 75,
                b: 65
            }, {
                y: '2017.06.05',
                a: 50,
                b: 40
            }, {
                y: '2017.06.06',
                a: 75,
                b: 65
            }, {
                y: '2017.06.07',
                a: 100,
                b: 90
            }],
            xkey: 'y',
            ykeys: ['a', 'b'],
            labels: ['포장고객', '방문고객'],
            hideHover: 'auto',
            resize: true
        });
        Morris.Line({
        	  // ID of the element in which to draw the chart.
        	  element: 'morris-line-chart',
        	  // Chart data records -- each entry in this array corresponds to a point on
        	  // the chart.
        	  data: [
        	    { year: '170601', value: 450000 },
        	    { year: '170602', value: 387500 },
        	    { year: '170603', value: 423600 },
        	    { year: '170604', value: 432650 },
        	    { year: '170605', value: 765200 }
        	  ],
        	  // The name of the data record attribute that contains x-values.
        	  xkey: 'year',
        	  // A list of names of data record attributes that contain y-values.
        	  ykeys: ['value'],
        	  // Labels for the ykeys -- will be displayed when you hover over the
        	  // chart.
        	  labels: ['Value']
        	});

    });
</script>
  </body>
</html>
