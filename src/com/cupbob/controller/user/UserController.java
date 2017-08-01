package com.cupbob.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.dto.User_infoDTO;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;
import com.cupbob.util.Email;
import com.cupbob.util.EmailSender;


@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@Autowired
	private EmailSender emailSender;
	
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
	
	@RequestMapping(value="userLoginProc")
	String userLoginProc(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		log.info(this.getClass().getName() + "userLoginProc Start!!");
		String email = CmmUtil.nvl(request.getParameter("email"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		
		User_infoDTO uDTO = new User_infoDTO();
		
		log.info(email);
		log.info(password);
		
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
			return "redirect:userMenuList.do";
		}
	}
	
	@RequestMapping(value="userFind")
	String userFind(HttpServletRequest request,HttpServletResponse response, Model model,HttpSession session) throws Exception{
		return "user/userFind";
	}
	
	@RequestMapping(value="userFindEmail")
	String userFindEmail(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		log.info(this.getClass().getName() + "userFindEmail start!!");
		
		String name = CmmUtil.nvl(request.getParameter("name"));
		String gender = CmmUtil.nvl(request.getParameter("gender"));
		String birthday = CmmUtil.nvl(request.getParameter("year"))+CmmUtil.nvl(request.getParameter("month"))+CmmUtil.nvl(request.getParameter("day"));
		String contact_addr = CmmUtil.nvl(request.getParameter("contact_addr"));
		
		log.info(name);
		log.info(gender);
		log.info(birthday);
		log.info(contact_addr);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_name(name);
		uDTO.setGender(gender);
		uDTO.setBirthday(birthday);
		uDTO.setContact_addr(contact_addr);
		
		uDTO = userService.getUserFindEmail(uDTO);
		
		
		if(uDTO == null){
			log.info("userEmailFind Fail!!");
			model.addAttribute("msg","해당하는 아이디가 없습니다.");
			model.addAttribute("url","userFind.do");
		}else{
			model.addAttribute("msg", "회원님의 아이디는 "+uDTO.getEmail()+" 입니다.");
			model.addAttribute("url", "userLogin.do");
		}
		
		uDTO = null;
		
		log.info("userFindEmail END!!");
		
		return "user/userFindAlert";
	}
	
	@RequestMapping(value="userFindPw")
	String userFindPw(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		log.info(this.getClass().getName() + "userFindPassword start!!");
		
		Email sendEmail = new Email();
	
		String email = CmmUtil.nvl(request.getParameter("email1"))+"@"+CmmUtil.nvl(request.getParameter("email2"));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String gender = CmmUtil.nvl(request.getParameter("gender"));
		String birthday = CmmUtil.nvl(request.getParameter("year"))+CmmUtil.nvl(request.getParameter("month"))+CmmUtil.nvl(request.getParameter("day"));
		String contact_addr = CmmUtil.nvl(request.getParameter("contact_addr"));
		
		log.info(email);
		log.info(name);
		log.info(gender);
		log.info(birthday);
		log.info(contact_addr);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setEmail(email);
		uDTO.setUser_name(name);
		uDTO.setGender(gender);
		uDTO.setBirthday(birthday);
		uDTO.setContact_addr(contact_addr);
		
		uDTO = userService.getUserFindPw(uDTO);
		
		if(uDTO == null){
			log.info("userFindPw FAIL!!");
			model.addAttribute("msg", "찾는 정보가 없습니다");
			model.addAttribute("url", "userFind.do");
		}else{
			log.info("Send EMAIL!!!");
			
			sendEmail.setReciver(email);
			sendEmail.setSubject("거북목 컵밥");
			sendEmail.setContent("회원님의 임시 비밀번호는 " + uDTO.getPassword() + " 입니다.");
			log.info(sendEmail.getReciver());
			log.info(sendEmail.getSubject());
			log.info(sendEmail.getContent());
			
			emailSender.SendEmail(sendEmail);
			model.addAttribute("msg", "회원님의 임시 비밀번호가 이메일로 발송되었습니다");
			model.addAttribute("url", "userLogin.do");
		}
		return "user/userFindAlert";
	}
}
