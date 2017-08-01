package com.cupbob.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String userMenuList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userMenuList start!!!");
		List<Product_infoDTO> pList;
		pList = menuService.getUserMenuList();
		if(pList == null){
			pList = new ArrayList<>();
		}
		model.addAttribute("pList", pList);
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
		log.info(this.getClass() + "userMenuDetail end!!!");
		return "user/detail";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="userAddTmpBasket", method=RequestMethod.POST)
	public void userAddTmpBasket(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + "userAddTmpBasket start!!!");
		String prdtNo = CmmUtil.nvl(req.getParameter("prdtNo"));
		log.info(this.getClass() + " prdtNo : " + prdtNo);
		String prdtPrice = CmmUtil.nvl(req.getParameter("prdtPrice"));
		log.info(this.getClass() + " prdtPrice : " + prdtPrice);
		String prdtQty = CmmUtil.nvl(req.getParameter("prdtQty"));
		log.info(this.getClass() + " prdtQty : " + prdtQty);
		Object tmpSession = session.getAttribute("ss_tmpBakset");
		List<TmpBasketDTO> tList;
		if(tmpSession == null){
			log.info(this.getClass() + "if in");
			tList = new ArrayList<>();
			tList.add(new TmpBasketDTO(prdtNo, prdtQty, prdtPrice));
			session.setAttribute("ss_tmpBakset", tList);
		}else{
			tList = (List<TmpBasketDTO>)tmpSession;
			for(TmpBasketDTO tDTO : tList){
				if(tDTO.getTmpBasketPrdtNo().equals(prdtNo)){
					tDTO.setTmpBasketPrdtQty(Integer.parseInt(tDTO.getTmpBasketPrdtQty()) + Integer.parseInt(prdtQty) + "");
				}else{
					tList.add(new TmpBasketDTO(prdtNo, prdtQty, prdtPrice));
				}
			}
			session.setAttribute("ss_tmpBakset", tList);
		}
		log.info(this.getClass() + "userAddTmpBasket end!!!");
	}
}
