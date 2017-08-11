 package com.cupbob.controller.user;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TmpBasketDTO;
import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.dto.User_infoDTO;
import com.cupbob.service.IOrderService;
import com.cupbob.util.CmmUtil;
import com.cupbob.util.PayUtil;


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
      String rep_code =CmmUtil.nvl(req.getParameter("REP_CODE"));
      log.info(this.getClass() + " rep_code : " + rep_code);
      //승인 번호, 계좌 번호
      String rep_auth_no =CmmUtil.nvl(req.getParameter("REP_AUTH_NO"));
      log.info(this.getClass() + " rep_auth_no : " + rep_auth_no);
      //거래 고유번호(페이누리측)
      String tid =CmmUtil.nvl(req.getParameter("TID"));
      log.info(this.getClass() + " tid : " + tid);
      //은행 코드
      String rep_bank =CmmUtil.nvl(req.getParameter("REP_BANK"));
      log.info(this.getClass() + " rep_bank : " + rep_bank);
      //가맹점 번호
      String storeId   =CmmUtil.nvl(req.getParameter("STOREID"));
      log.info(this.getClass() + " storeId : " + storeId);
      //가맹점 이름
      String store_name =CmmUtil.nvl(req.getParameter("STORE_NAME"));
      log.info(this.getClass() + " store_name : " + store_name);
      //가맹점 URL
      String store_url =CmmUtil.nvl(req.getParameter("STORE_URL"));
      log.info(this.getClass() + " store_url : " + store_url);
      //사업자 번호
      String business_no =CmmUtil.nvl(req.getParameter("BUSINESS_NO"));
      log.info(this.getClass() + " business_no : " + business_no);
      //가맹점 주문번호
      String tran_no =CmmUtil.nvl(req.getParameter("TRAN_NO"));
      log.info(this.getClass() + " tran_no : " + tran_no);
      //카드종류
      String cardCompany = CmmUtil.nvl(req.getParameter("CARDCOMPANY"));
      log.info(this.getClass() + " cardCompany : " + cardCompany);
      //상품명
      String goods_name =CmmUtil.nvl(req.getParameter("GOODS_NAME"));
      log.info(this.getClass() + " goods_name : " + goods_name);
      //결제금액
      String amt =CmmUtil.nvl(req.getParameter("AMT"));
      log.info(this.getClass() + " amt : " + amt);
      //상품수
      String quantity   =CmmUtil.nvl(req.getParameter("QUANTITY"));
      log.info(this.getClass() + " quantity : " + quantity);
      //결제일자
      String sale_date =CmmUtil.nvl(req.getParameter("SALE_DATE"));
      log.info(this.getClass() + " sale_date : " + sale_date);
      //고객이름
      String customer_name =CmmUtil.nvl(req.getParameter("CUSTOMER_NAME"));
      log.info(this.getClass() + " customer_name : " + customer_name);
      //고객 이메일
      String customer_email =CmmUtil.nvl(req.getParameter("CUSTOMER_EMAIL"));
      log.info(this.getClass() + " customer_email : " + customer_email);
      //고객 전화번호
      String customer_tel   =CmmUtil.nvl(req.getParameter("CUSTOMER_TEL"));
      log.info(this.getClass() + " customer_tel : " + customer_tel);
      //고객 아이피
      String customer_ip =CmmUtil.nvl(req.getParameter("CUSTOMER_IP"));
      log.info(this.getClass() + " customer_ip : " + customer_ip);
      //입금통보URL
      String notice_url =CmmUtil.nvl(req.getParameter("NOTICE_URL"));
      log.info(this.getClass() + " notice_url : " + notice_url);
      //거래 유형
      String tran_type =CmmUtil.nvl(req.getParameter("TRAN_TYPE"));
      log.info(this.getClass() + " tran_type : " + tran_type);
      //결과 메세지
      String rep_msg =CmmUtil.nvl(req.getParameter("REP_MSG"));
      log.info(this.getClass() + " rep_msg : " + rep_msg);
      //여분의 데이터
      String etc_data1 =CmmUtil.nvl(req.getParameter("ETC_DATA1"));//사용자 번호 넘어올것
      log.info(this.getClass() + " etc_data1 : " + etc_data1);
      String etc_data2 =CmmUtil.nvl(req.getParameter("ETC_DATA2"));
      log.info(this.getClass() + " etc_data2 : " + etc_data2);//수령시간
      String etc_data3 =CmmUtil.nvl(req.getParameter("ETC_DATA3"));      
      log.info(this.getClass() + " etc_data3 : " + etc_data3);//주문 제품 목록
      if(rep_code.equals("0000")){
         /**
          * 결제 성공
          */
         Order_infoDTO oDTO = new Order_infoDTO();
         oDTO.setOrd_no(tran_no);
         oDTO.setReal_ord_price(amt);
         if(tran_type.equals("PHON")){
            oDTO.setPayment_tp("p");
         }else{
            oDTO.setPayment_tp("c");
         }
         oDTO.setOrd_stat("1");
         oDTO.setUsr_rcv_time(etc_data2);
         oDTO.setRcv_yn("n");
         oDTO.setTid(tid);
         String[] userNoAndMil = etc_data1.split(";");
         String[] mil = userNoAndMil[1].split("-");
         Map<String, String> milMap = new HashMap();
         oDTO.setUser_no(userNoAndMil[0]);
         if(mil[0].equals("dec")){//마일리지를 사용했을 경우 차감
            oDTO.setMileage(mil[1]);
            oDTO.setTotal_ord_price((Integer.parseInt(amt) + Integer.parseInt(mil[1])) + "");
            oDTO.setReg_user_no(userNoAndMil[0]);
            milMap.put("dec", mil[1]);
         }else{//마일리지를 사용 안했을 경우 마일리지 증가
            oDTO.setReg_user_no(userNoAndMil[0]);
            oDTO.setTotal_ord_price(amt);
            milMap.put("inc", mil[1]);
         }
         String[] orderItems = etc_data3.split("-");
         List<Order_itemDTO> oList = new ArrayList<Order_itemDTO>();
         for(int i = 0; i< orderItems.length; i++){
            String[] orderItem = orderItems[i].split(":");
            Order_itemDTO oIDTO = new Order_itemDTO();
            oIDTO.setOrd_no(tran_no);
            oIDTO.setPrdt_no(orderItem[0]);
            oIDTO.setOrd_amnt(orderItem[1]);
            oIDTO.setReg_user_no(userNoAndMil[0]);
            oList.add(oIDTO);
         }
         log.info(this.getClass() + " useremail" + CmmUtil.nvl((String)session.getAttribute("ss_user_email")));
         session.setAttribute("ss_tmpBasket", "");
         orderService.insertOrderSuccess(oDTO, oList, milMap);
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
      String userNo = (String)session.getAttribute("ss_user_no");
      Order_infoDTO oDTO = orderService.getOrderNo(userNo);
      if(oDTO == null){
         oDTO = new Order_infoDTO();
      }
      Order_itemDTO otDTO = new Order_itemDTO();
      otDTO.setOrd_no(oDTO.getOrd_no());
      List<Order_itemDTO> otList = orderService.getOrdItem(otDTO);
      
      model.addAttribute("ordNo", CmmUtil.nvl(oDTO.getOrd_no()));
      session.setAttribute("ss_tmpBasket", null);
      model.addAttribute("otList", otList);
      userNo = null;
      oDTO = null;
      otList = null;
      log.info(this.getClass() + "orderSuccess end!!!");
      return "user/orderSuccess";
   }
   
   @RequestMapping(value="userOrderDirect", method=RequestMethod.POST)
   public String userOrderDirect(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
      log.info(this.getClass() + ".userOrderDirect start!!!");
      String prdtNo = CmmUtil.nvl(req.getParameter("prdtNo"));
      log.info(this.getClass() + " prdtNo : " + prdtNo);
      String qty = CmmUtil.nvl(req.getParameter("qty"));
      log.info(this.getClass() + " qty : " + qty);
      String price = CmmUtil.nvl(req.getParameter("price"));
      log.info(this.getClass() + " price : " + price);
      String prdtName = CmmUtil.nvl(req.getParameter("prdtName"));
      log.info(this.getClass() + " prdtName : "  + prdtName);
      String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
      User_infoDTO uDTO = orderService.getUserMil(userNo);//마일리지 가져오기
      if(uDTO == null){
         uDTO = new User_infoDTO();
      }
      Map<String, TmpBasketDTO> tMap = new HashMap();
      TmpBasketDTO tDTO = new TmpBasketDTO(prdtNo, qty, price, prdtName);
      tMap.put(prdtNo, tDTO);
      Iterator<String> keyss = tMap.keySet().iterator();
      while(keyss.hasNext()){
         String key = keyss.next();
         log.info(this.getClass() + " session--------------------------------------");
         log.info(this.getClass() + "   prdtNo : " + tMap.get(key).getTmpBasketPrdtNo());
         log.info(this.getClass() + "   prdtNo : " + tMap.get(key).getTmpBasketPrdtQty());
         log.info(this.getClass() + "   prdtNo : " + tMap.get(key).getTmpBasketPrdtPrice());
         log.info(this.getClass() + " session--------------------------------------");
      }
      session.setAttribute("ss_tmpBasket", tMap);
      model.addAttribute("userMil", uDTO.getMileage());//마일리지 가져와서 올리기
      log.info(this.getClass() + ".userOrderDirect end!!!");
      return "user/order";
   }
   
   @RequestMapping(value="testSQL")
   public String test(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
      log.info(this.getClass() + ".test start!!!");
      orderService.test();
      log.info(this.getClass() + ".test end!!!");
      return null;
   }
   @RequestMapping(value="useMil")
   public String useMil(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
      log.info(this.getClass() + "useMil start!!!");
      String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
      User_infoDTO uDTO = orderService.getUserMil(userNo);//마일리지 가져오기
      model.addAttribute("userMil", uDTO.getMileage());//마일리지 가져와서 올리기
      log.info(this.getClass() + "useMil end!!!");
      return "user/useMil";
   }
   
   @RequestMapping(value = "userOrderList")
	public String userOrderList(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		log.info(this.getClass().getName() + "userOrderList Start !!");
		String uNum = CmmUtil.nvl(request.getParameter("uNum"));
		log.info(uNum);
		
		List<TotalOrderDTO> totalList = orderService.selectOrderList(uNum);
		
		model.addAttribute("totalList", totalList);
		model.addAttribute("uNum", uNum);
		
		log.info(this.getClass().getName() + "userOrderList END !!");
		return "user/userOrderList";
	}
	
	@RequestMapping(value="orderListMore")
	public @ResponseBody List<TotalOrderDTO> orderListMore(@RequestParam(value="count") String count,@RequestParam(value="uNum") String user_no) throws Exception{
		log.info(this.getClass().getName() + " moreButton Start!! ");
		log.info(count);
		log.info(user_no);
		
		List<TotalOrderDTO> orderListMore = orderService.orderListMore(count,user_no);
		
		for(TotalOrderDTO tDTO : orderListMore){
			System.out.println(tDTO.getOrd_no());
			System.out.println(tDTO.getPrdt_name());
		}
		
		log.info(this.getClass().getName() + " moreButton END!! ");
		return orderListMore;
	}
	
	//이거슨 결제 도중 취소 URL이였던 것이였던 것이다
		@RequestMapping(value="orderCancelResult")
		public String orderCancelResult(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
			session.setAttribute("ss_tmpBasket", null);
			return "redirect:userMenuList.do";
		
		}
}
