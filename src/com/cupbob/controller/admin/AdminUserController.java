package com.cupbob.controller.admin;

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

import com.cupbob.dto.User_infoDTO;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;

@Controller
public class AdminUserController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	private IUserService userService;

	@RequestMapping(value = "adminUserList", method = RequestMethod.GET)
	public String adminUserList(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model)
			throws Exception {
		log.info(this.getClass().getName() + " adminUserList start!!!");
		List<User_infoDTO> UserList = userService.getUserList();

		if (UserList == null) {
			UserList = new ArrayList<>();
		}

		model.addAttribute("UserList", UserList);

		log.info(this.getClass().getName() +  " adminUserList end!!!");
		return "admin/adminUserList";
	}

	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpServletRequest req, HttpServletRequest resp, Model model) {
		log.info(this.getClass().getName() + " adminLogin Start");

		log.info(this.getClass().getName() + " adminLogin end");
		return "admin/adminUserLogin";
	}

	@RequestMapping(value = "adminLoginProc")
	public String adminLoginProc(HttpSession session, HttpServletRequest req, HttpServletRequest resp, Model model) {
		log.info(this.getClass().getName() + " adminLoginProc Start");
		String user_id = CmmUtil.nvl(req.getParameter("user_id"));
		String password = CmmUtil.nvl(req.getParameter("password"));

		User_infoDTO uDTO = new User_infoDTO();

		uDTO.setUser_id(user_id);
		uDTO.setPassword(password);

		uDTO = userService.login(uDTO);

		if (uDTO == null) {
			log.info("adminLoginProc fail!");
			return "redirect:adminLogin.do";
		} else {
			session.setAttribute("ss_user_id", CmmUtil.nvl(uDTO.getUser_id()));
			session.setAttribute("ss_user_name", CmmUtil.nvl(uDTO.getUser_name()));
			uDTO = null;
			log.info(this.getClass().getName() + " adminLoginProc end");
			return "redirect:adminLoginSuccess.do";
		}
	}

	@RequestMapping(value = "adminLoginSuccess")
	public String loginSuccess(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {

		log.info(this.getClass().getName() + " adminLoginSuccess start");

		log.info(this.getClass().getName() + " adminLoginSuccess end");

		return "admin/adminLoginSuccess";
	}

	@RequestMapping(value = "adminLogout")
	public String adminLogout(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {

		log.info(this.getClass().getName() + " adminLogout start");

		session.setAttribute("ss_user_id", "");
		session.setAttribute("ss_user_name", "");

		log.info(this.getClass().getName() + " adminLogout end");
		return "redirect:adminLogin.do";
	}

}
