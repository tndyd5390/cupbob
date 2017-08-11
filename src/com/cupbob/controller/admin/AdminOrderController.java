package com.cupbob.controller.admin;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.service.IOrderService;
import com.cupbob.util.CmmUtil;
import com.cupbob.util.PayUtil;

@Controller
public class AdminOrderController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	@RequestMapping(value="orderList", method=RequestMethod.GET)
	public String getOrderList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "orderList start");
		List<TotalOrderDTO> tList = orderService.getTotalOrderDTO();
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		model.addAttribute("TotalOrderList", tList);
		tList = null;
		log.info(this.getClass() + "orderList end");
		return "admin/adminMain";
	}
	@RequestMapping(value="adminOrderInterval")
	public @ResponseBody List<TotalOrderDTO> adminOrderInterval(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderInterval start");
		List<TotalOrderDTO> tList = orderService.getTotalOrderDTO();
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		log.info(this.getClass() + ".adminOrderInterval tList.size() : " +  tList.size());
		log.info(this.getClass() + ".adminOrderInterval end");
		return tList;
	}
	
	@RequestMapping(value="adminOrderProc", method = RequestMethod.POST)
	public @ResponseBody List<TotalOrderDTO> adminTakeOrder(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderProc start!!");
		String ordNo = req.getParameter("ordNo");
		log.info(this.getClass() + ".adminTakeOrder.ordNo : " + ordNo);
		String statNo = req.getParameter("statNo");
		log.info(this.getClass() + ".adminTakeOrder.statNo : " + statNo);
		List<TotalOrderDTO> tList = orderService.updateAdminOrdNo(ordNo, statNo);
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		log.info(this.getClass() + ".adminOrderProc end");
		
		
		return tList;
	}
	
	@RequestMapping(value="adminOrderCancel")
	public @ResponseBody List<TotalOrderDTO> adminOrderCancel(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() +  ".adminOrderCancel start!!");
		String ordNo = req.getParameter("ordNo");
		log.info(this.getClass() + ".adminOrderCancel  ordNo : " + ordNo);
		String statNo = req.getParameter("statNo");
		log.info(this.getClass() + ".adminOrderCancel statNo : " + statNo);
		List<TotalOrderDTO> tList = orderService.updateAdminOrdNo(ordNo, statNo);
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		log.info(this.getClass() +  ".adminOrderCancel end!!");
		return tList;
	}
	
	@RequestMapping(value="adminOrderRemainTime.do")
	public @ResponseBody List<TotalOrderInfoDTO> adminOrderRemainTime(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderRemainTime start !!!");
		List<TotalOrderInfoDTO> tList = orderService.getAdminOrderRemainTime();
		if(tList == null){
			tList = new ArrayList<TotalOrderInfoDTO>();
		}
		log.info(this.getClass() + ".adminOrderReaminTime end!!!");
		return tList;
	}
	
	@RequestMapping(value = "orderView")
	public String orderView(HttpServletRequest request, HttpServletResponse response, Model model){
		
		log.info("order test");
		return "admin/adminMain";
	}
	
	@RequestMapping(value="barcodePage" ,method = RequestMethod.GET)
		public String barcodePage(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass().getName()+" barcodePage Start");	
		String ordNo = req.getParameter("ordNo");
		String statNo = req.getParameter("statNo");
		log.info(this.getClass().getName()+ "ordNo = "+ordNo);
		log.info(this.getClass().getName()+ "statNo = "+statNo);
		
		model.addAttribute("ordNo", ordNo);
		model.addAttribute("statNo", statNo);
		
		log.info(this.getClass().getName()+" barcodePage End");	
		return "admin/barcodePage";
	}
	@RequestMapping(value="barcodeSuccess")
		public String barcodeSuccess(HttpServletRequest req, Model model) throws Exception{
		log.info(this.getClass().getName()+ " barcodeSuccess start");
		String ordNo = req.getParameter("ordNo");
		
		model.addAttribute("ordNo", ordNo);
		ordNo = null;
		log.info(this.getClass().getName()+ " barcodeSuccess end");
		return "admin/barcodeSuccess";
	}
	
	@RequestMapping(value="barcodeProc", method = RequestMethod.POST)
	public String bardoeProc(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderProc start!!");
		String ordNo = req.getParameter("ordNo");
		log.info(this.getClass() + ".adminTakeOrder.ordNo : " + ordNo);
		String statNo = req.getParameter("statNo");
		log.info(this.getClass() + ".adminTakeOrder.statNo : " + statNo);
		List<TotalOrderDTO> tList = orderService.updateAdminOrdNo(ordNo, statNo);
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		log.info(this.getClass() + ".adminOrderProc end");
		
		model.addAttribute("ordNo", ordNo);
		
		tList=null;
		
		return "redirect:barcodeSuccess.do";
	}
	/*@RequestMapping(value="orderCancel", method=RequestMethod.POST)
	public void orderCancel(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session, RedirectAttributes redAtt) throws Exception{
		log.info(this.getClass() + ".orderCancel start!!");
		String ordNo = CmmUtil.nvl(request.getParameter("ordNo"));
		log.info(this.getClass() + " ordNo : " + ordNo);
		String payTp = CmmUtil.nvl(request.getParameter("parTp"));
		log.info(this.getClass() + " payTp : " + payTp);
		if(payTp.equals("p")){
			payTp = "PHON";
		}else{
			payTp = "CARD";
		}
		String user_email = CmmUtil.nvl((String)session.getAttribute("ss_user_email"));
		redAtt.addAttribute("STOREID", "1500000088");
		redAtt.addAttribute("TRAN_TYPE", payTp);
		redAtt.addAttribute("KIND", "0420");
		redAtt.addAttribute("CANCEL_ID", user_email);
		redAtt.addAttribute("CANCEL_CAUSE","non");
		
		log.info(this.getClass() + ".orderCancel end!!");
		//RequestDispatcher rd = request.getRequestDispatcher("http://www.naver.com");
		//RequestDispatcher rd = request.getRequestDispatcher("https://pg.paynuri.com/paymentgateway/cancelPayment.do?STOREID=1500000088&TRAN_TYPE=" + payTp + "&KIND=0420&TID=" + ordNo + "&CANCEL_ID=" + user_email + "&CANCEL_CAUSE=NON");
		//rd.forward(request, response);
		response.sendRedirect("https://pg.paynuri.com/paymentgateway/cancelPayment.do");
	}
	*/
	
	//이거슨 결제 도중 취소 URL이였던 것이였던 것이다
	@RequestMapping(value="orderCancelResult")
	public String orderCancelResult(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
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
				orderService.updateOrderCancel(TID);
				return "redirect:orderList.do";
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
				model.addAttribute("msg", "취소되지 않았습니다.");
				model.addAttribute("url", "orderList.do");
				return "admin/boardAlert";
			}
	}
}