package com.cupbob.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cupbob.dto.Product_infoDTO;
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
		log.info(this.getClass() + "userMenuList start!!!");
		String menuNo = CmmUtil.nvl(req.getParameter("menuNo"));
		log.info(this.getClass() + ".menuNo = " + menuNo);
		
		log.info(this.getClass() + "userMenuList end!!!");
		return "user/detail";
	}
	
}
