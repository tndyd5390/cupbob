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

import com.cupbob.dto.MilHistoryDTO;
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
	
	@RequestMapping(value="userUpdate")
	public String userUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		log.info(this.getClass().getName() + "userUpdate Start!!");
		String uNum = CmmUtil.nvl(request.getParameter("uNum"));
		log.info(uNum);
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNum);
		
		uDTO = userService.getUserDetail(uDTO);
		
		if(uDTO == null){
			uDTO = new User_infoDTO();
		}
		
		model.addAttribute("uDTO", uDTO);
		
		uDTO = null;
		
		log.info(this.getClass().getName() + "userUpdate End!!");
		return "user/userUpdate";
	}
	
	@RequestMapping(value="userUpdateProc")
	public String userUpdateProc(HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model)throws Exception{
		log.info(this.getClass().getName() + "userUpdatePRoc Start!!");
		
		String uNo = CmmUtil.nvl(request.getParameter("unum"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String gender = CmmUtil.nvl(request.getParameter("gender"));
		String birthday = CmmUtil.nvl(request.getParameter("year"))+"."+CmmUtil.nvl(request.getParameter("month"))+"."+CmmUtil.nvl(request.getParameter("day"));
		String contact_addr = CmmUtil.nvl(request.getParameter("contact_addr"));
		String ss_user_no = (String) session.getAttribute("ss_user_no");
	
		log.info(uNo);
		log.info(password);
		log.info(name);
		log.info(gender);
		log.info(birthday);
		log.info(contact_addr);
		log.info(ss_user_no);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNo);
		uDTO.setChg_user_no(uNo);
		uDTO.setPassword(password);
		uDTO.setUser_name(name);
		uDTO.setGender(gender);
		uDTO.setBirthday(birthday);
		uDTO.setContact_addr(contact_addr);
		
		int rs = userService.updateUserDetail(uDTO);
		
		String msg;
		String url;
		
		if(rs > 0){
			msg = "수정 되었습니다.";
			url = "userMyPage.do?uNum=" + CmmUtil.nvl(ss_user_no);
		}else{
			msg = "수정 실패!";
			url = "userUpdate.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		uDTO = null;
		
		log.info(this.getClass().getName() + "userUpdatePRoc End!!");
		
		return "user/userLoginAlert";
	}
	
	@RequestMapping(value="userDelete")
	public String userDelete(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model)throws Exception{
		log.info(this.getClass().getName() + "userDelete Start!!");
		String uNum = CmmUtil.nvl(request.getParameter("unum"));
		log.info(uNum);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNum);
		
		int rs = userService.userDelete(uDTO);
		
		String msg;
		String url;
			
		if(rs > 0){
			msg = "삭제 되었습니다.";
			url = "userLogin.do";
		}else{
			msg = "삭제 실패!";
			url = "userUpdate.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url", url);
		
		log.info(this.getClass().getName() + "userDelete End!!");
		return "user/userLoginAlert";
	}
	
	@RequestMapping(value="userMyPage")
	public String userMyPage(HttpSession session,HttpServletRequest request,HttpServletResponse response,Model model) throws Exception{
		String uNum = CmmUtil.nvl(request.getParameter("unum"));
		log.info(uNum);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNum);
		
		uDTO = userService.getUserDetail(uDTO);
		List<MilHistoryDTO> mList = userService.getUserMileage(uDTO);
		
		if(mList == null){
			mList = new ArrayList<MilHistoryDTO>();
		}
		if(uDTO == null){
			uDTO = new User_infoDTO();
		}
		
		log.info(uDTO.getUser_no());
		log.info(uDTO.getUser_name());
		log.info(uDTO.getEmail());
		
		model.addAttribute("uDTO", uDTO);
		model.addAttribute("mList", mList);
		return "user/userMyPage";
	}
	
	@RequestMapping(value = "userUpdateCheck")
	String userUpdateCheck(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		log.info(this.getClass().getName() + "userUpdateCheck Start!!");
		String uNum = CmmUtil.nvl(request.getParameter("uNum"));
		
		log.info(uNum);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNum);
		
		uDTO = userService.getUserDetail(uDTO);
		
		if(uDTO == null){
			uDTO = new User_infoDTO();
		}
		
		model.addAttribute("uDTO", uDTO);
		
		log.info(this.getClass().getName() + "userUpdateCheck END!!");
		
		return "user/userUpdateCheck";
	}
	
	@RequestMapping(value = "userUpdateCheckProc")
	String userUpdateCheckProc(HttpSession session,HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		log.info(this.getClass().getName() + "userUpdateCheckProc Start!!");
		
		String uNum = CmmUtil.nvl(request.getParameter("uNum"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		
		log.info("uNum : " + uNum );
		log.info("password : " + password);
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNum);
		uDTO.setPassword(password);
		
		uDTO = userService.userUpdateCheck(uDTO);
		
		String msg;
		String url;
		
		if(uDTO == null){
			msg = "비밀번호를 다시 확인해 주세요.";
			url = "userUpdateCheck.do?uNum="+uNum;
		}else{
			msg = "";
			url = "userUpdate.do?uNum=" + CmmUtil.nvl(uDTO.getUser_no());
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		log.info(this.getClass().getName() + "userUpdateCheckProc END!!");
		
		return "user/userUpdateAlert";
	}
	
	@RequestMapping(value="userSignInProc")
	public String userSignInProc(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		log.info("userSignInProc Start !!!");
		String email = CmmUtil.nvl(request.getParameter("email1")+"@"+request.getParameter("email2"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		String name = CmmUtil.nvl(request.getParameter("name"));
		String gender = CmmUtil.nvl(request.getParameter("gender"));
		String birthday = CmmUtil.nvl(request.getParameter("year"))+"."+CmmUtil.nvl(request.getParameter("month"))+"."+CmmUtil.nvl(request.getParameter("day"));
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
		return "redirect:userLogin.do";
	}
	
	@RequestMapping(value="userLoginProc")
	String userLoginProc(HttpSession session, HttpServletRequest request, HttpServletResponse response,Model model)throws Exception{
		log.info(this.getClass().getName() + "userLoginProc Start!!");
		String email = CmmUtil.nvl(request.getParameter("email"));
		String password = CmmUtil.nvl(request.getParameter("password"));
		
		User_infoDTO uDTO = new User_infoDTO();
		
		log.info(email);
		log.info(password);
		
		uDTO.setEmail(email);
		uDTO.setPassword(password);
		
		uDTO = userService.login(uDTO);

		if(uDTO==null){
			log.info("Login Fail!!");
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			model.addAttribute("url", "userLogin.do");
		}else{
			session.setAttribute("ss_user_email", CmmUtil.nvl(uDTO.getEmail()));
			session.setAttribute("ss_user_name", CmmUtil.nvl(uDTO.getUser_name()));
			session.setAttribute("ss_user_no", CmmUtil.nvl(uDTO.getUser_no()));
			session.setAttribute("ss_user_ca", CmmUtil.nvl(uDTO.getContact_addr()));
			model.addAttribute("url", "userMenuList.do");
		}
		return "user/userLoginAlert";
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
			model.addAttribute("msg","입력하신 정보가 일치하지 않습니다.");
			model.addAttribute("url","userFind.do");
		}else{
			model.addAttribute("msg", "고객님의 아이디는 "+uDTO.getEmail()+" 입니다.");
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
			model.addAttribute("msg", "입력하신 정보가 일치하지 않습니다");
			model.addAttribute("url", "userFind.do");
		}else{
			log.info("Send EMAIL!!!");
			
			sendEmail.setReciver(email);
			sendEmail.setSubject("거북목 컵밥 입니다");
			sendEmail.setContent("고객님의 임시 비밀번호는 " + uDTO.getPassword() + " 입니다.");
			log.info(sendEmail.getReciver());
			log.info(sendEmail.getSubject());
			log.info(sendEmail.getContent());
			
			emailSender.SendEmail(sendEmail);
			model.addAttribute("msg", "고객님의 임시 비밀번호를 이메일로 발송하였습니다.");
			model.addAttribute("url", "userLogin.do");
		}
		return "user/userFindAlert";
	}
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest req,HttpSession session, Model model)throws Exception{

		log.info(this.getClass().getName() + " adminLogout start");

		session.setAttribute("ss_user_email", "");
		session.setAttribute("ss_user_name", "");
		session.setAttribute("ss_user_no", "");
		session.setAttribute("ss_user_ca", "");

		log.info(this.getClass().getName() + " adminLogout end");
		
		return "redirect:userLogin.do";
	}
}
