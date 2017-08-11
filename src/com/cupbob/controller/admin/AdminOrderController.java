package com.cupbob.controller.admin;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
		Collections.sort(tList, new SortOrder());
		model.addAttribute("TotalOrderList", tList);
		tList = null;
		log.info(this.getClass() + "orderList end");
		return "admin/adminMain";
	}
	
	class SortOrder implements Comparator<TotalOrderDTO>{

		@Override
		public int compare(TotalOrderDTO t1, TotalOrderDTO t2) {
			String[] t1Time = t1.getOrd_remainTime().split(":");
			int t1Hour = Integer.parseInt(t1Time[0]);
			int t1Min = Integer.parseInt(t1Time[1]);
			String[] t2Time = t2.getOrd_remainTime().split(":");
			int t2Hour = Integer.parseInt(t2Time[0]);
			int t2Min = Integer.parseInt(t2Time[1]);
			if(t1Hour > t2Hour){
				return 1;
			}else if(t1Hour < t2Hour){
				return -1;
			}else if(t1Min > t2Min){
				return 1;
			}else if(t1Min < t2Min){
				return -1;
			}else{
				return 0;
			}
		}
	}
		
	
	@RequestMapping(value="adminOrderInterval")
	public @ResponseBody List<TotalOrderDTO> adminOrderInterval(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderInterval start");
		List<TotalOrderDTO> tList = orderService.getTotalOrderDTO();
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		Collections.sort(tList, new SortOrder());
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
}