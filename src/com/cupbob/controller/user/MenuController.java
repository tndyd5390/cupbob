package com.cupbob.controller.user;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.cupbob.dto.Product_infoDTO;
import com.cupbob.dto.TmpBasketDTO;
import com.cupbob.service.IMenuService;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;


@Controller
public class MenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MenuService")
	private IMenuService menuService;

	@RequestMapping(value="userMenuList", method=RequestMethod.GET)
	public String userMenuList(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userMenuList start!!!");
		List<Product_infoDTO> pList;
		
		pList = menuService.getUserMenuList();
		if(pList == null){
			pList = new ArrayList<Product_infoDTO>();
		}
		model.addAttribute("pList", pList);
		pList = null;
		log.info(this.getClass() + "userMenuList end!!!");
		return "user/menulist";
	}
	
	@RequestMapping(value="userMenuDetail", method=RequestMethod.GET)
	public String userMenuDetail(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userMenuDetail start!!!");
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
		log.info(this.getClass() + ".menuNo = " + menuNo);
		Product_infoDTO pDTO = menuService.getUserMenuDetail(menuNo);
		if(pDTO == null){
			pDTO = new Product_infoDTO();
		}
		model.addAttribute("pDTO", pDTO);
		menuNo = null;
		pDTO = null;
		log.info(this.getClass() + "userMenuDetail end!!!");
		return "user/detail";
	}
	
	@RequestMapping(value="userAddTmpBasket", method=RequestMethod.POST)
	public void userAddTmpBasket(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "userAddTmpBasket start!!!");
		String prdtNo = CmmUtil.nvl(req.getParameter("prdtNo"));
		log.info(this.getClass() + " prdtNo : " + prdtNo);
		String prdtPrice = CmmUtil.nvl(req.getParameter("prdtPrice"));
		log.info(this.getClass() + " prdtPrice : " + prdtPrice);
		String prdtQty = CmmUtil.nvl(req.getParameter("prdtQty"));
		log.info(this.getClass() + " prdtQty : " + prdtQty);
		String prdtName = CmmUtil.nvl(req.getParameter("prdtName"));
		log.info(this.getClass() + " prdtName : " + prdtName);
		Object tmpSession = session.getAttribute("ss_tmpBasket");
		Map<String, TmpBasketDTO> tMap;
		if(tmpSession == null){
			tMap = new HashMap();
			tMap.put(prdtNo, new TmpBasketDTO(prdtNo, prdtQty, prdtPrice, prdtName));
			session.setAttribute("ss_tmpBasket", tMap);
		}else{
			tMap = (Map<String, TmpBasketDTO>)tmpSession;
			if(tMap.containsKey(prdtNo)){
				TmpBasketDTO tDTO = tMap.get(prdtNo);
				tDTO.setTmpBasketPrdtQty(Integer.parseInt(tDTO.getTmpBasketPrdtQty()) + Integer.parseInt(prdtQty) + "");
				tMap.put(prdtNo, tDTO);
				session.setAttribute("ss_tmpBasket", tMap);
			}else{
				tMap.put(prdtNo, new TmpBasketDTO(prdtNo, prdtQty, prdtPrice, prdtName));
				session.setAttribute("ss_tmpBasket", tMap);
			}
		}
		log.info(this.getClass() + "userAddTmpBasket end!!!");
	}
	
	@RequestMapping(value="userTmpBasket", method=RequestMethod.GET)
	public String userTmpBasket(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".userTmpBasket start!!!");
		log.info(this.getClass() + ".userTmpBasket end!!!");
		return "user/tmpBasket";
	}
	
	@RequestMapping(value="userTmpItemPlusMinus", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> userTmpItemPlusMinus(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model) throws Exception{
		log.info(this.getClass() + ".userTmpItemPlusMinus start!!!");
		String prdtNo = CmmUtil.nvl(req.getParameter("prdtNo"));
		log.info(this.getClass() + " prdtNo : " + prdtNo);
		String prdtQty = CmmUtil.nvl(req.getParameter("prdtQty"));
		log.info(this.getClass() + " prdtQty : " + prdtQty);
		Map<String, TmpBasketDTO> tMap = (HashMap<String, TmpBasketDTO>)session.getAttribute("ss_tmpBasket");
		Map<String, Object> returnMap = new HashMap();
		if(tMap == null){
			tMap = new HashMap();
		}
		if(tMap.containsKey(prdtNo)){
			TmpBasketDTO tDTO = tMap.get(prdtNo);
			tDTO.setTmpBasketPrdtQty(prdtQty);
			tMap.put(prdtNo, tDTO);
		}
		Iterator<String> keys = tMap.keySet().iterator();
		while(keys.hasNext()){
			String key = keys.next();
			returnMap.put(tMap.get(key).getTmpBasketPrdtNo(), tMap.get(key));
		}
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
		prdtNo = null;
		prdtQty = null;
		tMap = null;
		log.info(this.getClass() + ".userTmpItemPlusMinus end!!!");
		return returnMap;
	}
	
	@RequestMapping(value="userTmpItemDeleteOne", method=RequestMethod.POST)
	public @ResponseBody Map<String, TmpBasketDTO> userTmpItemDeleteOne(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " userTmpItemDeleteOne start!!!");
		String prdtNo = CmmUtil.nvl(req.getParameter("prdtNo"));
		log.info(this.getClass() + " prdtNo : " + prdtNo);
		Map<String, TmpBasketDTO> tMap = (Map<String, TmpBasketDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap == null){
			tMap = new HashMap();
		}
		if(tMap.containsKey(prdtNo)){
			tMap.remove(prdtNo);
		}
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
		log.info(this.getClass() + " userTmpItemDeleteOne end!!!");
		return tMap;
	}
	
	@RequestMapping(value="userTmpItemSelectedDelete", method=RequestMethod.POST)
	public @ResponseBody Map<String, TmpBasketDTO> userTmpItemSelectedDelete(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + " userTmpItemSelectedDelete start!!!!");
		String[] prdtNoArr	= req.getParameterValues("prdtNo");
		Map<String, TmpBasketDTO> tMap = (Map<String, TmpBasketDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap == null){
			tMap = new HashMap();
		}
		for(String prdtNo : prdtNoArr){
			if(tMap.containsKey(prdtNo)){
				tMap.remove(prdtNo);
			}
		}
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
		log.info(this.getClass() + " userTmpItemSelectedDelete end!!!"); 
		return tMap;
	}
	
	@RequestMapping(value="userDoOrder", method=RequestMethod.GET)
	public String userDoOrder(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".userDoOrder start!!!");
		Map<String, TmpBasketDTO> tMap = (Map<String, TmpBasketDTO>)session.getAttribute("ss_tmpBasket");
		if(tMap == null){
			tMap = new HashMap();
		}
		String returnURL = "user/order";
		if(tMap.size()<1){
			returnURL = "admin/userAlert";
			model.addAttribute("msg", "주문하실 제품이 없습니다.");
			model.addAttribute("url", "userMenuList.do");
		}
		log.info(this.getClass() + ".userDoOrder end!!!");
		return returnURL;
	}
}
