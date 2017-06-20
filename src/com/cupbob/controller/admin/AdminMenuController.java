package com.cupbob.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.service.IMenuService;

@Controller
public class AdminMenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MenuService")
	private IMenuService menuService;

<<<<<<< HEAD
	@RequestMapping(value="menuList")
=======
	@RequestMapping(value="AdminMenuList")
>>>>>>> refs/remotes/origin/test
	public String getUserList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		
		log.info("menuList start");
		
		System.out.println("test");
		
		log.info("menuList end");
		return "admin/adminMenuList";
	}
}
