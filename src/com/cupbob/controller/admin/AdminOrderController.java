package com.cupbob.controller.admin;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.service.IOrderService;

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
	
	@RequestMapping(value="adminOrderProc", method = RequestMethod.GET)
	public String adminTakeOrder(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminOrderProc start!!");
		String ordNo = req.getParameter("ordNo");
		log.info(this.getClass() + ".adminTakeOrder.ordNo : " + ordNo);
		String statNo = req.getParameter("statNo");
		log.info(this.getClass() + ".adminTakeOrder.statNo : " + statNo);
		List<TotalOrderDTO> tList = orderService.updateAdminOrdNo(ordNo, statNo);
		if(tList == null){
			tList = new ArrayList<TotalOrderDTO>();
		}
		model.addAttribute("TotalOrderList", tList);
		ordNo = null;
		statNo = null;
		tList = null;
		log.info(this.getClass() + ".adminOrderProc end");
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "orderView")
	public String orderView(HttpServletRequest request, HttpServletResponse response, Model model){
		
		log.info("order test");
		return "admin/adminMain";
	}
}