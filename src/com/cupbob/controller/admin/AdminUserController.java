package com.cupbob.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.service.IUserService;

@Controller
public class AdminUserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value = "adminUserList")
	public String adminUserList(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model){
		
		
		return "admin/adminUserList";
	}
}
