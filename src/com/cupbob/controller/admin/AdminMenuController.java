package com.cupbob.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.dto.Product_infoDTO;
import com.cupbob.service.IMenuService;

@Controller
public class AdminMenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MenuService")
	private IMenuService menuService;

	@RequestMapping(value="adminMenuList")
	public String getUserList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMenuList start!!");
		List<Product_infoDTO> pList = menuService.getAdminMenuList();
		if(pList == null){
			pList = new ArrayList<Product_infoDTO>();
		}
		model.addAttribute("pList", pList);
		pList = null;
		log.info("menuList end");
		return "admin/adminMenuList";
	}
}
