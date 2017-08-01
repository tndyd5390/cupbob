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

import com.cupbob.dto.User_infoDTO;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;


@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value="userList")
	public String getUserList(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info("getUserList start");
		
		List userList = userService.getUserList();
		if(userList == null){
			userList = new ArrayList();
		}
		model.addAttribute("userList", userList);
		log.info("getUserList end");
		return "admin/adminUserList";
		
	}
	
	@RequestMapping(value="userSignIn")
	public String userSignIn(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info("userSignIn Start !!!");
		log.info("userSignIn End !!!");
		return "user/userSignIn";
	}
	
	@RequestMapping(value="userLogin")
	public String userLogin(HttpSession session, HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass().getName() + " userLogin Start!! ");
		log.info(this.getClass().getName() + " userLogin End!! ");
		return "user/userLogin";
	}
	
	@RequestMapping(value="userSignInProc")
	public String userSignInProc(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info("userSignInProc Start !!!");
		String email = CmmUtil.nvl(request.getParameter("email1")+"@"+request.getParameter("email2"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String gender = CmmUtil.nvl(request.getParameter("gender"));
		String birthday = CmmUtil.nvl(request.getParameter("year"))+CmmUtil.nvl(request.getParameter("month"))+CmmUtil.nvl(request.getParameter("day"));
		String contact_addr = CmmUtil.nvl(request.getParameter("contact_addr"));
		String checkBox1 = request.getParameter("checkBox1");
		String checkBox2 = request.getParameter("checkBox2");
		String checkBox3 = request.getParameter("checkBox3");
		
		log.info(email);
		log.info(password);
		log.info(name);
		log.info(gender);
		log.info(birthday);
		log.info(contact_addr);
		log.info(checkBox1);
		log.info(checkBox2);
		log.info(checkBox3);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setEmail(email);
		uDTO.setPassword(password);
		uDTO.setUser_name(name);
		uDTO.setGender(gender);
		uDTO.setBirthday(birthday);
		uDTO.setContact_addr(contact_addr);
		
		userService.join(uDTO);
		
		log.info("userSignInProc End !!!");
		return "redirect:userSignIn.do";
	}
	
	@RequestMapping
	String userLoginProc(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		log.info(this.getClass().getName() + "userLoginProc Start!!");
		String email = CmmUtil.nvl(request.getParameter("email"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setEmail(email);
		uDTO.setPassword(password);
		
		uDTO = userService.login(uDTO);
		
		if(uDTO == null){
			log.info("userLoginProc Fail!!");
			log.info(this.getClass().getName() + "userLoginProc End!!");
			return "redirect:userLogin.do";
		}else{
			session.setAttribute("ss_user_email", CmmUtil.nvl(uDTO.getEmail()));
			session.setAttribute("ss_user_name", CmmUtil.nvl(uDTO.getUser_name()));
			session.setAttribute("ss_user_no", CmmUtil.nvl(uDTO.getUser_no()));
			return "redirect:userLogin.do";
		}
	}
}
