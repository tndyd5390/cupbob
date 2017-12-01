<%@page import="com.cupbob.util.PayUtil"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.HashMap, java.util.Date" %>
<%
request.setCharacterEncoding("EUC-KR");
response.setCharacterEncoding("EUC-KR");

	//////////////////////////////////////////////////////////////////////////////////////////
	//
	// [공통파라미터]
	//
	//////////////////////////////////////////////////////////////////////////////////////////

	String STOREID					= request.getParameter("STOREID");				// 페이누리 가맹점 ID
	String TRAN_TYPE				= request.getParameter("TRAN_TYPE");			// [CARD | BANK | CASH | PHON]
	String KIND						= request.getParameter("KIND");					// "0420" (단, 계좌이체의 경우 당일: "0420", 당일아님: "0520")
	String TID						= request.getParameter("TID");					// 페이누리 거래번호
	String CANCEL_ID				= new String(request.getParameter("CANCEL_ID").getBytes("8859_1"), "euc-kr");
	String CANCEL_CAUSE				= new String(request.getParameter("CANCEL_CAUSE").getBytes("8859_1"), "euc-kr");

	String REPLY_CODE = "";
	String REPLY_MSG = "";
	String REPLY_AUTH_NO = "";

	HashMap<String, String> hashmapJson = new HashMap<String, String>();
	HashMap<String, Object> hashmapRes = new HashMap<String, Object>();

	try{
		hashmapJson.put("STOREID", STOREID);
		hashmapJson.put("TRAN_TYPE", TRAN_TYPE);
		hashmapJson.put("KIND", KIND);
		hashmapJson.put("TID", TID);
		hashmapJson.put("CANCEL_ID", CANCEL_ID);
		hashmapJson.put("CANCEL_CAUSE", CANCEL_CAUSE);

		String charSet = "EUC-KR";
		
		HashMap<String, String> hashmapResponse = (HashMap<String, String>) PayUtil.callURL("https://pg.paynuri.com/paymentgateway/cancelPayment.do", null, hashmapJson, charSet);
		if ("200".equals(hashmapResponse.get("httpStatus"))){
			String responseBody = String.valueOf(hashmapResponse.get("responseBody"));
			hashmapRes = PayUtil.JsonStringToObject(responseBody);
		}else{
			hashmapRes.put("REP_CODE", "9999");
			hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
		}
	}catch (Exception e){
		hashmapRes.put("REP_CODE", "9999");
		hashmapRes.put("REP_MSG", "오류가 발생했습니다.");
	}

	/////////////////////////////////////////////////////////////////////////////////////////
	//
	// [결제 응답값]
	// 이부분에 각 상점 처리 로직을 구현하시면됩니다.
	// 아래 응답 파라미터를 확인하시고 각 상점에 맞는 처리를 하시면됩니다.
	//
	////////////////////////////////////////////////////////////////////////////////////////
	if("0000".equals(hashmapRes.get("REP_CODE"))) {
		// ###################################################################################
		// #
		// #
		// #
		// #							결제성공시 상점 처리로직 구현
		// #
		// #
		// #
		// ###################################################################################
		out.println("성공");
	} else {
		// ###################################################################################
		// #
		// #
		// #
	   	// #							결제 실패시 상점 처리로직 구현
		// #
		// #
		// #
		// ###################################################################################
	}
%>
    
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" name="frmPayment" id="frmPayment" action="https://pg.paynuri.com/paymentgateway/cancelPayment.do" accept-charset="euc-kr" target="_self">
		<input type="text" id="STOREID" name="STOREID" value="1500000088">
		<input type="text" id="TRAN_TYPE" name="TRAN_TYPE" value="PHON">
		<input type="text" id="KIND" name="KIND" value="0420">
		<input type="text" id="TID" name="TID" value="P1708100000003">
		<input type="text" id="CANCEL_ID" name="CANCEL_ID" value="1@naver.com">
		<input type="text" id="CANCEL_CAUSE" name="CANCEL_CAUSE" value="non">
		<input type="submit" value="전송">
	</form>
</body>

<div class="act-time">
					<div class="activity-body act-in">
						<div class="text" style="height: 150px;">
							<p class="attribution">
								<a href="#">문주현<!-- 접수자 이름 --></a> 2017.08.21 18:00:00<!-- 접수 날자 -->
							</p>
							<p class="attribution" style="display: inline; font-size: 15px;">
								4차산업혁명 대비 벤처창업아이템 경진대회<!-- 한글 제목 -->
							</p>
							<div>
								<p class="attribution" style="display: inline; font-size: 15px;">
									Venture start-up item competition against 4th industrial revolution<!-- 영문 제목 -->
								</p>
								<div style="display: inline; float: right;">
									<button class="btn btn-primary" style="width: 90px;">다운로드</button>
								</div>
							</div>
							<br />
							<div style="float: right;">
								<select class="form-control" style="width: 300px; display: inline;">
									<option>합격</option>
									<option>불합격</option>
								</select>
								<button class="btn btn-primary" style="display: inline; width: 90px;">확인</button>
							</div>
						</div>
						<br/>
					</div>
				</div>



</html>