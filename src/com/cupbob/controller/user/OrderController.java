package com.cupbob.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.service.IOrderService;


@Controller
public class OrderController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	@RequestMapping(value="map")
	public String map(HttpSession session) throws Exception{
		log.info("map start");
		log.info("map end");
		return "user/map";
	}
	
	//페이누리로 보내는 RETURN_URL(결제결과 데이터 받기)에 대응하는 메소드
	@RequestMapping(value="orderComplete")
	public void orerComplete(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "orderComplete start!!!");
		//결과코드
		String rep_code =req.getParameter("REP_CODE");
		log.info(this.getClass() + " rep_code : " + rep_code);
		//승인 번호, 계좌 번호
		String rep_auth_no =req.getParameter("REP_AUTH_NO");
		log.info(this.getClass() + " rep_auth_no : " + rep_auth_no);
		//거래 고유번호(페이누리측)
		String tid =req.getParameter("TID");
		log.info(this.getClass() + " tid : " + tid);
		//은행 코드
		String rep_bank =req.getParameter("REP_BANK");
		log.info(this.getClass() + " rep_bank : " + rep_bank);
		//가맹점 번호
		String storeId	=req.getParameter("STOREID");
		log.info(this.getClass() + " storeId : " + storeId);
		//가맹점 이름
		String store_name =req.getParameter("STORE_NAME");
		log.info(this.getClass() + " store_name : " + store_name);
		//가맹점 URL
		String store_url =req.getParameter("STORE_URL");
		log.info(this.getClass() + " store_url : " + store_url);
		//사업자 번호
		String business_no =req.getParameter("BUSINESS_NO");
		log.info(this.getClass() + " business_no : " + business_no);
		//가맹점 주문번호
		String tran_no =req.getParameter("TRAN_NO");
		log.info(this.getClass() + " tran_no : " + tran_no);
		//카드종류
		String cardCompany = req.getParameter("CARDCOMPANY");
		log.info(this.getClass() + " cardCompany : " + cardCompany);
		//상품명
		String goods_name =req.getParameter("GOODS_NAME");
		log.info(this.getClass() + " goods_name : " + goods_name);
		//결제금액
		String amt =req.getParameter("AMT");
		log.info(this.getClass() + " amt : " + amt);
		//상품수
		String quantity	=req.getParameter("QUANTITY");
		log.info(this.getClass() + " quantity : " + quantity);
		//결제일자
		String sale_date =req.getParameter("SALE_DATE");
		log.info(this.getClass() + " sale_date : " + sale_date);
		//고객이름
		String customer_name =req.getParameter("CUSTOMER_NAME");
		log.info(this.getClass() + " customer_name : " + customer_name);
		//고객 이메일
		String customer_email =req.getParameter("CUSTOMER_EMAIL");
		log.info(this.getClass() + " customer_email : " + customer_email);
		//고객 전화번호
		String customer_tel	=req.getParameter("CUSTOMER_TEL");
		log.info(this.getClass() + " customer_tel : " + customer_tel);
		//고객 아이피
		String customer_ip =req.getParameter("CUSTOMER_IP");
		log.info(this.getClass() + " customer_ip : " + customer_ip);
		//입금통보URL
		String notice_url =req.getParameter("NOTICE_URL");
		log.info(this.getClass() + " notice_url : " + notice_url);
		//거래 유형
		String tran_type =req.getParameter("TRAN_TYPE");
		log.info(this.getClass() + " tran_type : " + tran_type);
		//결과 메세지
		String rep_msg =req.getParameter("REP_MSG");
		log.info(this.getClass() + " rep_msg : " + rep_msg);
		//여분의 데이터
		String etc_data1 =req.getParameter("ETC_DATA1");
		log.info(this.getClass() + " etc_data1 : " + etc_data1);
		String etc_data2 =req.getParameter("ETC_DATA2");
		log.info(this.getClass() + " etc_data2 : " + etc_data2);
		String etc_data3 =req.getParameter("ETC_DATA3");		
		log.info(this.getClass() + " etc_data3 : " + etc_data3);
		
		if(rep_code.equals("0000")){
			/**
			 * 
			 * 
			 * 
			 * 결제 성공
			 * 
			 * 
			 */
		}else{
			/**
			 * 
			 * 
			 * 
			 * 결제 실패
			 * 
			 * 
			 */
		}
		log.info(this.getClass() + "orderComplete end!!!");
		
	}
	
	//페이누리로 보내는 COMPLETE_URL(결제 성공후 가맹점 페이지로 넘어갈 URL)에 대응하는 메소드
	@RequestMapping(value="orderSuccess")
	public String orderSuccess(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "orderSuccess start!!!");
		log.info(this.getClass() + "orderSuccess end!!!");
		return "user/orderSuccess";
	}
	
	//페치누리로 보내는 CANCEL_URL(결제 취소후 가맹점 페이지로 넘어갈 URL)에 대응하는 메소드
	@RequestMapping(value="orderCancle")
	public String orderCancle(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".orderCancle start!!!!");
		
		log.info(this.getClass() + ".orderCancle end!!!");
		return null;
	}
}
