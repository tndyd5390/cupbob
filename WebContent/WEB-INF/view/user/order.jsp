<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.cupbob.dto.TmpBasketDTO"%>
<%@page import="com.cupbob.util.CmmUtil"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	
	String hour = new SimpleDateFormat("HH").format(new Date());
	hour = CmmUtil.nvl(hour, "0");
	String minute = new SimpleDateFormat("mm").format(new Date());
	//시간 설정하기 위한 변수
	int tmpMinute = Integer.parseInt(minute);
	tmpMinute = (tmpMinute/10)*10 + 10;
	Map<String, TmpBasketDTO> tMap = (Map<String, TmpBasketDTO>)session.getAttribute("ss_tmpBasket");
	if(tMap == null){
		tMap = new HashMap();	
	}
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	function checkBoxControll(){
		var checked = document.getElementById('userInfoCheck');
		if(checked.checked == false){
			console.log("false");
			document.getElementById('CUSTOMER_NAME').value='<%=CmmUtil.nvl((String)session.getAttribute("ss_user_name"))%>';
			document.getElementById('CUSTOMER_TEL').value='<%=CmmUtil.nvl((String)session.getAttribute("ss_user_ca"))%>';
			checked.checked = true;
		}else{
			document.getElementById('CUSTOMER_NAME').value='';
			document.getElementById('CUSTOMER_TEL').value='';
			checked.checked = false;
		}
	}
	
	function doSubmitOrder(){
		var f = document.getElementById('frmPayment');
		if(document.getElementById('CUSTOMER_NAME').value==""){
			alert("이름을 입력해주세요");
			document.getElementById('CUSTOMER_NAME').focus();
			return;
		}
		f.submit();
	}
	function radioPhonCheck(){
		var phonCheckBox = document.getElementsByName('TRAN_TYPE');
		phonCheckBox[0].checked = true;
	}
	
	function radioCardCheck(){
		var cardCheckBox = document.getElementsByName('TRAN_TYPE');
		cardCheckBox[1].checked = true;
	}
</script>
<title>소라네 컵밥 주문하기</title>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<form class="form" method="post" name="frmPayment" id="frmPayment" action="https://pg.paynuri.com/paymentgateway/mobile/reqPay.do" accept-charset="euc-kr" target="_self">
	<!-- <input type="hidden" id="REP_CODE" name="REP_CODE" value="0000"> -->
	<!-- 가맹점 번호 -->
	<input type="hidden" id="STOREID" name="STOREID" value="1500000088" readonly="readonly" />
	<!-- 가맹점 key -->
	<input type="hidden" id="CRYPTO_KEY" name="CRYPTO_KEY" value="AF866C9C429290750A6D4255590C0328" />
	<!-- 가맹점 명 -->
	<input type="hidden" id="STORE_NAME" name="STORE_NAME" value="페이누리쇼핑몰" />
	<!-- 가맹점 로고 -->
	<input type="hidden" id="STORE_LOGO" name="STORE_LOGO" value="https://demo.paynuri.com/images/logo_shop.png" />
	<!-- 사업자 번호 -->
	<input type="hidden" id="BUSINESS_NO" name="BUSINESS_NO" value="1068621229" />
	<!-- 가맹점 주문 번호 -->
	<input type="hidden" id="TRAN_NO" name="TRAN_NO" value="12345678910" size=20 maxlength=20 />
	<!-- 상품 구분 -->
	<input type="hidden" id="PRODUCTTYPE_1" name="PRODUCTTYPE" value="1" checked="checked"/>
	<input type="hidden" id="PRODUCTTYPE_2" name="PRODUCTTYPE" value="2" />
	<!-- 상품명   !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<%
		String prdtNames = "";
		int prdtCnt = 0;
		if(tMap.size()>1){
			prdtCnt = tMap.size() - 1;
			Iterator<String> keys = tMap.keySet().iterator();
			String key = keys.next();
			TmpBasketDTO tDTO = tMap.get(key);
			prdtNames += tDTO.getTmpBasketPrdtName() + " 외 " + prdtCnt;
		}else{
			Iterator<String> keys = tMap.keySet().iterator();
			String key = keys.next();
			TmpBasketDTO tDTO = tMap.get(key);
			prdtNames += tDTO.getTmpBasketPrdtName();
		}
	%>
	<input type="hidden" type="text" id="GOODS_NAME" name="GOODS_NAME" value="<%=prdtNames %>" size=15 maxlength=20 />
	<!-- 결제 금액  !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" type="text" id="AMT" name="AMT" value="1004" size=8 />
	<!-- 상품 갯수 !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" type="text" id="QUANTITY" name="QUANTITY" value="<%=tMap.size() %>" size=3 maxlength=3/>
	<!-- 거래 일자  오늘 날짜로 바꿔주기-->
	<input type="hidden" id="SALE_DATE" name="SALE_DATE" value="150923" size=8 maxlength=6 />
	<!-- 고객명  !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<!-- <input type="hidden" id="CUSTOMER_NAME" name="CUSTOMER_NAME" value="홍길동" size=30 maxlength=100 /> -->
	<!-- 리턴 URL  !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" id="RETURN_URL" name="RETURN_URL" value="http://cupbobs.com/orderComplete.do" size=30 maxlength=100 />
	<!-- 결제 성공  URL !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" id="COMPLETE_URL" name="COMPLETE_URL" value="http://cupbobs.com/orderSuccess.do" size=30 maxlength=100 />
	<!-- 결제 취소  URL !!!!!!!!!!!!!!!!!!!!!!!!이거는 바꿔줘야하는 파라미터!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
	<input type="hidden" id="FAIL_URL" name="FAIL_URL" value="http://cupbobs.com/orderCancle.do" size=30 maxlength=100 />
	<!-- 여분의 데이터 1 -->
	<input type="hidden" id="ETC_DATA1" name="ETC_DATA1" value="<%=CmmUtil.nvl((String)session.getAttribute("ss_user_no"))%>" />
	<!-- 여분의 데이터 2 -->
	<!-- 여분의 데이터 3 -->
	<%
	String orderItems = "";
	Iterator<String> keyss = tMap.keySet().iterator();
	while(keyss.hasNext()){
		String key = keyss.next();
		TmpBasketDTO tDTO = tMap.get(key);
		orderItems += tDTO.getTmpBasketPrdtNo() + ":" + tDTO.getTmpBasketPrdtQty()  + "-";
	}
	%>
	<input type="hidden" id="ETC_DATA3" name="ETC_DATA3" value="<%=orderItems %>" />
		<br> <br> <br><br>
		<div class="orderHead">주문 정보 입력</div>
		<div class="orderGroup">
			<h4 class="orderLabel">
				수령 시간
				</h4>
		</div>
		<div class="orderGroup">
			<select class="orderSelect form-control" id="ETC_DATA2" name="ETC_DATA2">
				<%for(int i = Integer.parseInt(hour); i< 22; i++){
					for(int j = tmpMinute; j<=50; j+=10){
						String min = "";
						if(j<10){
							min = "00"; 
						}else{
							min = j + "";
						}
						%>
				<option value="<%=i %>:<%=min %>"><%=i %> : <%=min %></option>
					<%}
					  tmpMinute = 0;
					}%>
			</select>
		</div>
		<hr class="orderHr">
		<div class="orderGroup">
			<h4 class="orderLabel">
				주문 고객
				</h4>
		</div>
		<div class="orderGroup">
			<input class="form-control orderText" type="text" name="CUSTOMER_NAME" id="CUSTOMER_NAME" value="<%=CmmUtil.nvl((String)session.getAttribute("ss_user_name")) %>">
		</div>
		<hr class="orderHr">
		<div class="orderGroup">
			<h4 class="orderLabel">
				연락처
				</h4>
		</div>
		<div class="orderGroup">
			<input class="form-control orderText" type="text" name="CUSTOMER_TEL" id="CUSTOMER_TEL" value="<%=CmmUtil.nvl((String)session.getAttribute("ss_user_ca"))%>">
		</div>
		<hr class="orderHr">
		<div class="orderGroupArea">
			<h4 class="orderLabel">
				요청 사항
				</h4>
					<textarea class="form-control orderTextArea" rows="6"></textarea>
		</div>
		<hr class="orderHr">
		<div class="checkbox icheck-asbestos">
			<input type="checkbox" id="userInfoCheck" /> <label for="asbestos" onclick="checkBoxControll();">
				<p class="checkboxFont" >회원 정보와 동일 합니다.</p>
			</label>
		</div>
		<div class="orderHead">주문 내역</div>
		<%if(tMap.size()==0){ %>
			<h4 class="orderLabel">
				선택하신 상품이 없습니다.
			</h4>
			<div class="orderTotalPrice">
				<p class="totalPriceLeft">결제 예정 금액</p>
				<p class="totalPriceRight">0원</p>
			</div>
		<%}else{
			Iterator<String> keys = tMap.keySet().iterator();
			int resultPrice = 0;
			while(keys.hasNext()){
				String key = keys.next();
				TmpBasketDTO tDTO = tMap.get(key);%>
				<p class="orderDetailLeft"><%=CmmUtil.nvl(tDTO.getTmpBasketPrdtName()) %></p>
				<p class="orderDetailRight">금액</p>
				<p class="orderDetailLeft">수량 : <%=CmmUtil.nvl(tDTO.getTmpBasketPrdtQty()) %>개</p>
				<p class="orderDetailRight"><%=CmmUtil.nvl(CmmUtil.addComma(Integer.parseInt(tDTO.getTmpBasketPrdtPrice())*Integer.parseInt(tDTO.getTmpBasketPrdtQty()))) %>원</p>
				<hr class="orderHr">
				
			<%resultPrice += Integer.parseInt(tDTO.getTmpBasketPrdtPrice())*Integer.parseInt(tDTO.getTmpBasketPrdtQty());
			}%>
			<div class="orderTotalPrice">
				<p class="totalPriceLeft">결제 예정 금액</p>
				<p class="totalPriceRight"><%=CmmUtil.nvl(CmmUtil.addComma(resultPrice)) %>원</p>
			</div>
		  <%}%>
		<div class="radio icheck-asbestos">
			<input type="radio" id="TRAN_TYPE" name="TRAN_TYPE" value="PHON" checked="checked"/> <label
				for="asbestos1" onclick="radioPhonCheck();">휴대폰 소액 결제</label>
		</div>
		<div class="radio icheck-asbestos">
			<input type="radio" id="TRAN_TYPE" name="TRAN_TYPE" value="CARD"/> <label
				for="asbestos2" onclick="radioCardCheck();">신용카드(온라인 결제)</label>
		</div>
	</form>
		<button class="orderButton02" onclick="doSubmitOrder();">결제하기</button>

	<br>
		<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>