package com.cupbob.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@RequestMapping(value="adminMain")
	public String adminMain(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminMain Start ! ! ");
		log.info("sang hoon ! ! ");
		
		log.info("adminMain End ! !");
		log.info("adminMain End ! !");
		
		return "admin/adminMain";
		
	}
	@RequestMapping(value="adminMenuList")
	public String adminMenuList(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminMenuList Start ! ! ");
		log.info("adminMenuList Start ! ! ");
		
		log.info("adminMenuList End ! !");
		log.info("adminMenuList End ! !");
		
		return "admin/adminMenuList";
		
	}
	@RequestMapping(value="adminMenuDetail1")
	public String adminMenuDetail1(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminMenuDetail Start ! ! ");
		log.info("adminMenuDetail Start ! ! ");
		
		log.info("adminMenuDetail End ! !");
		log.info("adminMenuDetail End ! !");
		
		return "admin/adminMenuDetail1";
		
	}
	@RequestMapping(value="adminMenuDetail2")
	public String adminMenuDetail2(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminMenuDetail Start ! ! ");
		log.info("adminMenuDetail Start ! ! ");
		
		log.info("adminMenuDetail End ! !");
		log.info("adminMenuDetail End ! !");
		
		return "admin/adminMenuDetail2";
		
	}
	@RequestMapping(value="adminMenuDetail3")
	public String adminMenuDetail3(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminMenuDetail Start ! ! ");
		log.info("adminMenuDetail Start ! ! ");
		
		log.info("adminMenuDetail End ! !");
		log.info("adminMenuDetail End ! !");
		
		return "admin/adminMenuDetail3";
		
	}
	@RequestMapping(value="adminMenuReg")
	public String adminMenuReg(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminMenuReg Start ! ! ");
		log.info("adminMenuReg Start ! ! ");
		
		log.info("adminMenuReg End ! !");
		log.info("adminMenuReg End ! !");
		
		return "admin/adminMenuReg";
		
	}
	@RequestMapping(value="adminUserJoin")
	public String adminUserJoin(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminUserJoin Start ! ! ");
		log.info("adminUserJoin Start ! ! ");
		
		log.info("adminUserJoin End ! !");
		log.info("adminUserJoin End ! !");
		
		return "admin/adminUserJoin";
		
	}
	@RequestMapping(value="adminUserList")
	public String adminUserList(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminUserList Start ! ! ");
		log.info("adminUserList Start ! ! ");
		
		log.info("adminUserList End ! !");
		log.info("adminUserList End ! !");
		
		return "admin/adminUserList";
		
	}
	@RequestMapping(value="adminUserDetail1")
	public String adminUserProfile1(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminUserDetail Start ! ! ");
		log.info("adminUserDetail Start ! ! ");
		
		log.info("adminUserDetail End ! !");
		log.info("adminUserDetail End ! !");
		
		return "admin/adminUserDetail1";
		
	}
	@RequestMapping(value="adminUserDetail2")
	public String adminUserProfile2(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminUserDetail Start ! ! ");
		log.info("adminUserDetail Start ! ! ");
		
		log.info("adminUserDetail End ! !");
		log.info("adminUserDetail End ! !");
		
		return "admin/adminUserDetail2";
		
	}
	@RequestMapping(value="adminUserDetail3")
	public String adminUserProfile3(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminUserDetail Start ! ! ");
		log.info("adminUserDetail Start ! ! ");
		
		log.info("adminUserDetail End ! !");
		log.info("adminUserDetail End ! !");
		
		return "admin/adminUserDetail3";
		
	}
	
	@RequestMapping(value="adminUserUpdate")
	public String adminUserUpdate(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminUserUpdate Start ! ! ");
		log.info("adminUserUpdate Start ! ! ");
		
		log.info("adminUserUpdate End ! !");
		log.info("adminUserUpdate End ! !");
		
		return "admin/adminUserUpdate";
		
	}
	@RequestMapping(value="adminBoardList")
	public String adminBoardList(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminBoardList Start ! ! ");
		log.info("adminBoardList Start ! ! ");
		
		log.info("adminBoardList End ! !");
		log.info("adminBoardList End ! !");
		
		return "admin/adminBoardList";
		
	}
	@RequestMapping(value="adminBoardDetail1")
	public String adminBoardDetail1(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminBoardDetail Start ! ! ");
		log.info("adminBoardDetail Start ! ! ");
		
		log.info("adminBoardDetail End ! !");
		log.info("adminBoardDetail End ! !");
		
		return "admin/adminBoardDetail1";
		
	}
	@RequestMapping(value="adminBoardDetail2")
	public String adminBoardDetail2(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminBoardDetail Start ! ! ");
		log.info("adminBoardDetail Start ! ! ");
		
		log.info("adminBoardDetail End ! !");
		log.info("adminBoardDetail End ! !");
		
		return "admin/adminBoardDetail2";
		
	}
	@RequestMapping(value="adminBoardDetail3")
	public String adminBoardDetail3(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminBoardDetail Start ! ! ");
		log.info("adminBoardDetail Start ! ! ");
		
		log.info("adminBoardDetail End ! !");
		log.info("adminBoardDetail End ! !");
		
		return "admin/adminBoardDetail3";
		
	}
	@RequestMapping(value="adminBoardReg")
	public String adminBoardReg(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminBoardReg Start ! ! ");
		log.info("adminBoardReg Start ! ! ");
		
		log.info("adminBoardReg End ! !");
		log.info("adminBoardReg End ! !");
		
		return "admin/adminBoardReg";
		
	}
	@RequestMapping(value="adminChart")
	public String adminChart(HttpServletRequest req, HttpServletResponse resp,Model model)throws Exception{
		log.info("adminChart Start ! ! ");
		log.info("adminChart Start ! ! ");
		
		log.info("adminChart End ! !");
		log.info("adminChart End ! !");
		
		return "admin/adminChart";
		
	}
}
