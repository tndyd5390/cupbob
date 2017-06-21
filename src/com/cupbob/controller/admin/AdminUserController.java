package com.cupbob.controller.admin;

import java.io.PrintWriter;
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

		log.info(this.getClass().getName() + " adminUserList end!!!");
		return "admin/adminUserList";
	}

	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpServletRequest req, HttpServletRequest resp, Model model) {
		log.info(this.getClass().getName() + " adminLogin Start");

		log.info(this.getClass().getName() + " adminLogin end");
		return "admin/adminUserLogin";
	}

	@RequestMapping(value = "adminLoginProc")
	public String adminLoginProc(HttpSession session, HttpServletRequest req, HttpServletRequest resp, Model model)
			throws Exception {
		log.info(this.getClass().getName() + " adminLoginProc Start");
		String email = CmmUtil.nvl(req.getParameter("email"));
		String password = CmmUtil.nvl(req.getParameter("password"));

		User_infoDTO uDTO = new User_infoDTO();

		uDTO.setEmail(email);
		uDTO.setPassword(password);

		uDTO = userService.login(uDTO);

		if (uDTO == null) {
			log.info("adminLoginProc fail!");
			return "redirect:adminLogin.do";
		} else {
			session.setAttribute("ss_user_email", CmmUtil.nvl(uDTO.getEmail()));
			session.setAttribute("ss_user_name", CmmUtil.nvl(uDTO.getUser_name()));
			session.setAttribute("ss_user_no", CmmUtil.nvl(uDTO.getUser_no()));

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

		session.setAttribute("ss_user_email", "");
		session.setAttribute("ss_user_name", "");
		session.setAttribute("ss_user_no", "");

		log.info(this.getClass().getName() + " adminLogout end");
		return "redirect:adminLogin.do";
	}

	@RequestMapping(value = "adminJoin")
	public String adminJoin(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {
		log.info(this.getClass().getName() + " adminJoin start");

		log.info(this.getClass().getName() + " adminJoin end");
		return "admin/adminUserJoin";
	}

	@RequestMapping(value = "adminJoinProc")
	public String adminJoinProc(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model)
			throws Exception {
		log.info(this.getClass().getName() + " adminJoinProc start");

		String email = CmmUtil.nvl(req.getParameter("email"));
		String user_name = CmmUtil.nvl(req.getParameter("user_name"));
		String password = CmmUtil.nvl(req.getParameter("password"));
		String confirmPassword = CmmUtil.nvl(req.getParameter("confirm_password"));
		String gender = CmmUtil.nvl(req.getParameter("gender"));
		String birthday = CmmUtil.nvl(req.getParameter("birthday"));
		String contactAddr = CmmUtil.nvl(req.getParameter("phone"));

		System.out.println(user_name);

		User_infoDTO uDTO = new User_infoDTO();

		uDTO.setEmail(email);
		uDTO.setUser_name(user_name);
		uDTO.setPassword(password);
		uDTO.setGender(gender);
		uDTO.setBirthday(birthday);
		uDTO.setContact_addr(contactAddr);

		userService.join(uDTO);

		log.info(this.getClass().getName() + " adminJoinProc end");
		return "redirect:adminLogin.do";
	}

	@RequestMapping(value = "overlapEmail")
	public void overlapEmail(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model)
			throws Exception {
		PrintWriter out = resp.getWriter();
		String email = CmmUtil.nvl(req.getParameter("email"));
		System.out.println(email);
		User_infoDTO uDTO = new User_infoDTO();

		uDTO.setEmail(email);
		int check = userService.overlapEmail(uDTO);
		System.out.println(check);
		out.print(check);
		out.flush();
		out.close();
	}

}
