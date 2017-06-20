package com.cupbob.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.dto.User_infoDTO;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;

@Controller
public class AdminUserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value = "adminUserList")
	public String adminUserList(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model){
		
		
		return "admin/adminUserList";
	}
	
	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpServletRequest req, HttpServletRequest resp, Model model){
		log.info("adminLogin Start");
		
		log.info("adminLogin end");
		return "admin/adminUserLogin";
	}
	
	@RequestMapping(value = "adminLoginProc")
	public String adminLoginProc(HttpSession session, HttpServletRequest req, HttpServletRequest resp, Model model){
		log.info("adminLoginProc Start");
		String user_id = CmmUtil.nvl(req.getParameter("user_id"));
		String password = CmmUtil.nvl(req.getParameter("password"));
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_id(user_id);
		uDTO.setPassword(password);
		
		System.out.println(uDTO.getUser_id());
		System.out.println(uDTO.getPassword());
		
		uDTO = userService.login(uDTO);
		
		if(uDTO==null){
			log.info("adminLoginProc fail!");
			return "admin/adminUserLogin";
		}
		else{
			session.setAttribute("ss_user_id", CmmUtil.nvl(uDTO.getUser_id()));
			session.setAttribute("ss_user_name", CmmUtil.nvl(uDTO.getUser_name()));			
			uDTO = null;
			log.info("adminLoginProc end");
			return "redirect:adminloginSuccess.do";
		}
	}
	@RequestMapping(value="adminloginSuccess")
	public String loginSuccess(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model){
		
		log.info("adminLoginSuccess start");
		
		log.info("adminLoginSuccess end");
		
		return "admin/adminLoginSuccess";
	}
}
