<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.cupbob.dto.TmpBasketDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, TmpBasketDTO> tMap = (Map<String, TmpBasketDTO>)session.getAttribute("ss_tmpBasket");
	if(tMap == null){
		tMap = new HashMap();
	}
	int resultPrice = 0;
	String addedComma = "";
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<link rel="stylesheet" href="userBootstrap/css/nav.css"/>
<link rel="stylesheet" href="userBootstrap/css/tmpBasket.css?ver=1"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<title>소라네 컵밥 장바구니</title>
<script type="text/javascript">
function addComma(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
	function tmpPlMi(prdtNo, flag) {
		var qty = parseInt($('#' + prdtNo + "Cnt").val());
		console.log(qty);
		if(qty >= 1){
			if(flag == 'm'){
				if(qty == 1){return;}
				qty = qty -1;
			}else{
				qty = qty +1;
			}
			$.ajax({
				url : "userTmpItemPlusMinus.do",
				method : "post",
				data : {
					'prdtNo' : prdtNo,
					'prdtQty' : qty
				},
				dataType : "json",
				success : function(data) {
					var count = Object.keys(data).length;
					console.log(data);
					if(count != 0){
						var contents = "";
						var resultPrice = 0;
						$.each(data, function(key, value){
							contents += "<div class=\"col-xs-12\">\n";
							contents += "<input type=\"checkbox\" name=\"del_check\" value=\"" + value.tmpBasketPrdtNo + "\">\n";
							contents += "<div class=\"tmpBasketText\">" + value.tmpBasketPrdtName + "</div>\n";
							contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi(" + value.tmpBasketPrdtNo +", 'm');\">-</a>";
							contents += "<input type=\"text\" value=\"" + value.tmpBasketPrdtQty + "\"class=\"tmpBasketCount\" maxlength=\"2\" readonly id=\"" + value.tmpBasketPrdtNo + "Cnt\">";
							contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi(" + value.tmpBasketPrdtNo + ", 'p')\">+</a>\n";
							contents += "<div class=\"tmpBasketPrice\" name=\"price\">" + (addComma((parseInt(value.tmpBasketPrdtQty) * parseInt(value.tmpBasketPrdtPrice)))) + "원</div>";
							contents += "<a href=\"#\" onclick=\"tmpBasketDeleteOne(" + value.tmpBasketPrdtNo + ")\"><img src=\"userBootstrap/navImage/recommend.png\" class=\"tmpBasketDeleteImg\"></a>\n";
							contents += "<hr class=\"tmpBasketHr\">\n";
							contents += "</div>\n";
							$('#tmpList').html(contents);
							resultPrice += (parseInt(value.tmpBasketPrdtQty) * parseInt(value.tmpBasketPrdtPrice));
						})
						resultPrice = addComma(resultPrice) + "원";
						$('#tmpBasketResultPrice').text(resultPrice);
					}else{
						var contents = "";
						contents += "<div class=\"col-xs-12\" style=\"text-align: center;\">";
						contents += "<div class=\"tmpBasketResultPriceText\">선택하신 상품이 없습니다.</div>";
						contents += "</div>";
						$('#tmpList').html(contents);
						$('#tmpBasketResultPrice').text("0원");
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
			})
		}else{
			return;
		}
	}
	
	function tmpBasketDeleteOne(prdtNo){
		$.ajax({
			url : "userTmpItemDeleteOne.do",
			method : "post",
			data : {
				'prdtNo' : prdtNo
			},
			dataType : "json",
			success : function(data) {
				var count = Object.keys(data).length;
				if(count != 0){
					var contents = "";
					var resultPrice = 0;
					$.each(data, function(key, value){
						contents += "<div class=\"col-xs-12\">\n";
						contents += "<input type=\"checkbox\" name=\"del_check\" value=\"" + value.tmpBasketPrdtNo + "\">\n";
						contents += "<div class=\"tmpBasketText\">" + value.tmpBasketPrdtName + "</div>\n";
						contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi(" + value.tmpBasketPrdtNo +", 'm');\">-</a>";
						contents += "<input type=\"text\" value=\"" + value.tmpBasketPrdtQty + "\"class=\"tmpBasketCount\" maxlength=\"2\" readonly id=\"" + value.tmpBasketPrdtNo + "Cnt\">";
						contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi(" + value.tmpBasketPrdtNo + ", 'p')\">+</a>\n";
						contents += "<div class=\"tmpBasketPrice\" name=\"price\">" + (addComma((parseInt(value.tmpBasketPrdtQty) * parseInt(value.tmpBasketPrdtPrice)))) + "원</div>";
						contents += "<a href=\"#\" onclick=\"tmpBasketDeleteOne(" + value.tmpBasketPrdtNo + ");\"><img src=\"userBootstrap/navImage/recommend.png\" class=\"tmpBasketDeleteImg\"></a>\n";
						contents += "<hr class=\"tmpBasketHr\">\n";
						contents += "</div>\n";
						$('#tmpList').html(contents);
						resultPrice += (parseInt(value.tmpBasketPrdtQty) * parseInt(value.tmpBasketPrdtPrice));
					})
					resultPrice = addComma(resultPrice) + "원";
					$('#tmpBasketResultPrice').text(resultPrice);
				}else{
					var contents = "";
					contents += "<div class=\"col-xs-12\" style=\"text-align: center;\">";
					contents += "<div class=\"tmpBasketResultPriceText\">선택하신 상품이 없습니다.</div>";
					contents += "</div>";
					$('#tmpList').html(contents);
					$('#tmpBasketResultPrice').text("0원");
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
		})
	}
	function tmpBasketSelectedDelete(){
		var del = document.getElementsByName('del_check');
		var prdtNo = new Array();
		for(var i = 0; i< del.length; i++){
			if(del[i].checked){
				prdtNo.push(del[i].value);
			}
		}
		if(prdtNo.length == 0){
			alert("제품을 선택해 주세요.");
			return;
		}
		for(var i = 0; i< prdtNo.length; i++){
			console.log(prdtNo[i]);
		}
		jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : "userTmpItemSelectedDelete.do",
			method : "post",
			data : {
				'prdtNo' : prdtNo
			},
			dataType : "json",
			success : function(data) {
				console.log(data);
				var count = Object.keys(data).length;
				if(count != 0){
					var contents = "";
					var resultPrice = 0;
					$.each(data, function(key, value){
						contents += "<div class=\"col-xs-12\">\n";
						contents += "<input type=\"checkbox\" name=\"del_check\" value=\"" + value.tmpBasketPrdtNo + "\">\n";
						contents += "<div class=\"tmpBasketText\">" + value.tmpBasketPrdtName + "</div>\n";
						contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi(" + value.tmpBasketPrdtNo +", 'm');\">-</a>";
						contents += "<input type=\"text\" value=\"" + value.tmpBasketPrdtQty + "\"class=\"tmpBasketCount\" maxlength=\"2\" readonly id=\"" + value.tmpBasketPrdtNo + "Cnt\">";
						contents += "<a href=\"#\" class=\"tmpBasketPlMi\" onclick=\"tmpPlMi(" + value.tmpBasketPrdtNo + ", 'p')\">+</a>\n";
						contents += "<div class=\"tmpBasketPrice\" name=\"price\">" + (addComma((parseInt(value.tmpBasketPrdtQty) * parseInt(value.tmpBasketPrdtPrice)))) + "원</div>";
						contents += "<a href=\"#\" onclick=\"tmpBasketDeleteOne(" + value.tmpBasketPrdtNo + ");\"><img src=\"userBootstrap/navImage/recommend.png\" class=\"tmpBasketDeleteImg\"></a>\n";
						contents += "<hr class=\"tmpBasketHr\">\n";
						contents += "</div>\n";
						$('#tmpList').html(contents);
						resultPrice += (parseInt(value.tmpBasketPrdtQty) * parseInt(value.tmpBasketPrdtPrice));
					})
					resultPrice = addComma(resultPrice) + "원";
					$('#tmpBasketResultPrice').text(resultPrice);
				}else{
					var contents = "";
					contents += "<div class=\"col-xs-12\" style=\"text-align: center;\">";
					contents += "<div class=\"tmpBasketResultPriceText\">선택하신 상품이 없습니다.</div>";
					contents += "</div>";
					$('#tmpList').html(contents);
					$('#tmpBasketResultPrice').text("0원");
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
		})
	}
	function keepShopping(){
		location.href="userMenuList.do";
	}
	function doOrder(){
		location.href="userDoOrder.do";
	}
</script>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<div class="row">
		<div style="padding-left: 20px; padding-right: 20px; padding-bottom: 10px;">
			<div class="tmpBasketHead">장바구니</div>
			<div id="tmpList">
			<%if(tMap.size() == 0){ %>
				<div class="col-xs-12" style="text-align: center;">
					<div class="tmpBasketResultPriceText">선택하신 상품이 없습니다.</div>
				</div>
			<%
			  }else{ 
				Iterator<String> keys = tMap.keySet().iterator();
			  	while(keys.hasNext()){			
			  		String key = keys.next();
			%>
			<div class="col-xs-12">
				<input type="checkbox" name="del_check" value="<%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtNo())%>">
				<div class="tmpBasketText"><%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtName()) %></div>
				<a href="#" class="tmpBasketPlMi" onclick="tmpPlMi('<%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtNo())%>', 'm');">-</a><input type="text" value="<%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtQty()) %>"
					class="tmpBasketCount" maxlength="2" readonly id="<%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtNo() + "Cnt")%>"><a href="#"
					class="tmpBasketPlMi" onclick="tmpPlMi('<%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtNo())%>', 'p')">+</a>
				<div class="tmpBasketPrice" name="price"><%=CmmUtil.addComma(Integer.parseInt(tMap.get(key).getTmpBasketPrdtPrice()) * Integer.parseInt(tMap.get(key).getTmpBasketPrdtQty())) + "원" %></div>
				<a href="#" onclick="tmpBasketDeleteOne('<%=CmmUtil.nvl(tMap.get(key).getTmpBasketPrdtNo())%>');"><img src="userBootstrap/navImage/recommend.png"
					class="tmpBasketDeleteImg"></a>
				<hr class="tmpBasketHr">
			</div>
			<%
					resultPrice += Integer.parseInt(tMap.get(key).getTmpBasketPrdtPrice()) * Integer.parseInt(tMap.get(key).getTmpBasketPrdtQty());
			  	}
			  } %>
			 </div>
			<div class="tmpBasketResult">
				<div class="tmpBasketResultPriceText">결제 예정금액</div>
				<div class="tmpBasketResultPrice" id="tmpBasketResultPrice"><%=CmmUtil.nvl(CmmUtil.addComma(resultPrice)) + "원" %></div>
			</div>
			<div class="col-xs-12">
				<div class="col-xs-6" style="padding: 0px 10px 0px 0px;">
					<button class="tmpBasketSelectDeleteButton" onclick="tmpBasketSelectedDelete();">선택삭제</button>
				</div>
				<div class="col-xs-6" style="padding: 0px 0px 0px 10px;">
					<button class="tmpBasketKeepShopping" onclick="keepShopping();">계속 쇼핑하기</button>
				</div>
			</div>
			<div class="col-xs-12">
				<button class="tmpBasketOrder" onclick="doOrder();">주문 하기</button>
			</div>
		<br>
	</div>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>