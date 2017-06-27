package com.cupbob.controller.admin;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cupbob.dto.User_infoDTO;
import com.cupbob.service.IUserService;
import com.cupbob.util.CmmUtil;
import com.cupbob.util.Email;
import com.cupbob.util.EmailSender;

@Controller
public class AdminUserController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	private IUserService userService;

	@Autowired
	private EmailSender emailSender;
	
	@RequestMapping(value = "adminUserList", method = RequestMethod.GET)
	public String adminUserList(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model)
			throws Exception {
		log.info(this.getClass().getName() + " adminUserList start!!!");
		List<User_infoDTO> userList = userService.getUserList();

		if (userList == null) {
			userList = new ArrayList<User_infoDTO>();
		}

		model.addAttribute("userList", userList);

		log.info(this.getClass().getName() + " adminUserList end!!!");
		return "admin/adminUserList";
	}

	@RequestMapping(value = "adminLogin")
	public String adminLogin(HttpSession session,HttpServletRequest req, HttpServletRequest resp, Model model) {
		log.info(this.getClass().getName() + " adminLogin Start");
		log.info(session.getAttribute("ss_user_email"));
		log.info(session.getAttribute("ss_user_name"));
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

		return "redirect:orderList.do";
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
		log.info(this.getClass().getName() + " [ajax] overlapEmail start");
		String email = CmmUtil.nvl(req.getParameter("email"));
		User_infoDTO uDTO = new User_infoDTO();

		uDTO.setEmail(email);
		int check = userService.overlapEmail(uDTO);
		System.out.println(check);
		resp.getWriter().print(check);
		resp.getWriter().flush();
		resp.getWriter().close();
		log.info(this.getClass().getName() + " [ajax] overlapEmail end");
	}
	@RequestMapping(value = "adminUserDetail", method = RequestMethod.GET)
	public String adminUserDetail(HttpServletRequest req, HttpServletResponse res, Model model) throws Exception {
		log.info(this.getClass().getName() + " adminUserDetail start");

		String unum = CmmUtil.nvl(req.getParameter("unum"));
		User_infoDTO udto = new User_infoDTO();
		udto.setUser_no(unum);
		udto = userService.getUserDetail(udto);

		if (udto == null) {
			udto = new User_infoDTO();
		}
		log.info("유저번호 = " + udto.getUser_no());
		log.info("이름 = " + udto.getUser_name());
		log.info("이메일 = " + udto.getEmail());
		log.info("성별 = " + udto.getGender());
		log.info("생년월일 = " + udto.getBirthday());
		log.info("전화번호 = " + udto.getContact_addr());

		model.addAttribute("udto", udto);
		udto = null;

		log.info(this.getClass().getName() + " adminUserDetail end");
		return "admin/adminUserDetail";
	}

	@RequestMapping(value = "adminUserDelete", method = RequestMethod.GET)
	public String adminUserDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		log.info(this.getClass().getName() + " adminUserDelete start");

		String unum = CmmUtil.nvl(req.getParameter("unum"));
		log.info(unum);
		User_infoDTO udto = new User_infoDTO();

		udto.setUser_no(unum);
		log.info(unum);

		int result = userService.userDelete(udto);

		String msg = " ";
		String url = " ";

		if (result > 0) {
			msg = "삭제완료되었습니다.";
			url = "adminUserList.do";
		} else {
			msg = "삭제실패했습니다.";
			url = "adminUserDetail.do?unum=" + unum;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info(this.getClass().getName() + " adminUserDelete end");
		return "admin/userAlert";
	}
	
	@RequestMapping(value="adminUserUpdateProc")
	public String adminUserUpdateProc(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model){
		log.info(this.getClass().getName() + " adminUserUpdateProc start");
		
		String uNum = CmmUtil.nvl(req.getParameter("uNum"));
		String user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		String email = CmmUtil.nvl(req.getParameter("email"));
		String user_name = CmmUtil.nvl(req.getParameter("user_name"));
		String gender = CmmUtil.nvl(req.getParameter("gender"));
		String birthday = CmmUtil.nvl(req.getParameter("birthday"));
		String contactAddr = CmmUtil.nvl(req.getParameter("phone"));
		
		User_infoDTO uDTO = new User_infoDTO();
		
		uDTO.setUser_no(uNum);
		uDTO.setUser_name(user_name);
		uDTO.setEmail(email);
		uDTO.setGender(gender);
		uDTO.setBirthday(birthday);
		uDTO.setContact_addr(contactAddr);
		uDTO.setChg_user_no(uNum);
		
		int result=0;
		result = userService.updateUserDetail(uDTO);
		
		uDTO=null;
		if(result!=0){
			model.addAttribute("msg","수정되었습니다.");
			model.addAttribute("url","adminUserDetail.do?unum="+uNum);
		}else{
			model.addAttribute("msg","실패하였습니다.");
			model.addAttribute("url","adminUserDetail.do?unum="+uNum);
		}
		
		log.info(this.getClass().getName() + " adminUserUpdateProc end");
		return "admin/userAlert";
	}
	
	@RequestMapping(value="adminUserCheckedDelete",method=RequestMethod.POST)
	public String adminUserCheckedDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + " Start !!");
		
		String[] del_check = req.getParameterValues("del_check");
		log.info("del_check" + del_check.length);
		User_infoDTO uDTO = new User_infoDTO();
		uDTO.setAllCheck(del_check);
		if(userService.deleteUserAllChecked(uDTO)){
			model.addAttribute("msg","삭제되었습니다.");
			
		}else {
			model.addAttribute("msg","삭제 실패하였습니다.");
		}
		model.addAttribute("url","adminUserList.do");
		uDTO = null;
		del_check = null;
		
		log.info(this.getClass() + " End !!");
		
		return "admin/userAlert";
	
	}

	@RequestMapping(value="commJson")
	public @ResponseBody List<User_infoDTO> commJson() throws Exception{
		log.info(this.getClass().getName()+ " commJson start");
		
		List<User_infoDTO> userList = userService.getUserList();

		if (userList == null) {
			userList = new ArrayList<User_infoDTO>();
		}
		
		log.info(this.getClass().getName()+ " commJson end");
		
		return userList;
	}
	
	@RequestMapping(value="adminUserFindInfo")
	public String adminUserFindInfo (HttpServletRequest req, HttpServletResponse resp) throws Exception{
		log.info(this.getClass().getName() + " adminUserFindInfo start");
		
		log.info(this.getClass().getName() + " adminUserFindInfo end");
		return "admin/adminUserFindInfo";
	}
	
	@RequestMapping(value="adminUserFindEmail", method=RequestMethod.POST)
	public String adminUserFindInId (HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass().getName() + " adminUserFindEmail start");
		
		String user_name = CmmUtil.nvl(req.getParameter("user_name"));
		String birthday = CmmUtil.nvl(req.getParameter("birthday"));
		
		log.info("name = " + user_name);
		log.info("birthday = " + birthday);
		
		User_infoDTO udto = new User_infoDTO();
		
		udto.setUser_name(user_name); 
		udto.setBirthday(birthday);
		
		udto = userService.getUserFindEmail(udto);
		
		if(udto == null){
			udto = new User_infoDTO();
		}
		
		model.addAttribute("email", udto.getEmail());
		
		udto = null;
		
		log.info(this.getClass().getName() + " adminUserFindEmail end");
		return "admin/userFindEmail";
	}
	
	@RequestMapping(value="adminUserFindPw")
	public String adminUserFindInPw (HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass().getName() + " adminUserInfo start");

		Email sandEmail = new Email();
		
		String email = CmmUtil.nvl(req.getParameter("email"));
		String user_name = CmmUtil.nvl(req.getParameter("user_name"));
		String birthday = CmmUtil.nvl(req.getParameter("birthday"));
		
		log.info("email = " + email);
		log.info("user_name = " + user_name);
		log.info("birthday = " + birthday);
				
		User_infoDTO udto = new User_infoDTO();
		udto.setEmail(email);
		udto.setUser_name(user_name);
		udto.setBirthday(birthday);
		
		udto = userService.getUserFindPw(udto);
		
		if(udto == null){
			return "admin/userFindPw";
		}
		else{
			log.info("password = " + udto.getPassword());
			
			sandEmail.setReciver(email);
			System.out.println(sandEmail.getReciver());
			
			sandEmail.setSubject("소라 밥집 입니다.");
			System.out.println(sandEmail.getSubject());
			
			sandEmail.setContent("회원님의 임시 비밀번호는" + udto.getPassword() + "입니다.");
			System.out.println(sandEmail.getContent());
			
			emailSender.SendEmail(sandEmail);
			
			model.addAttribute("resultPw", udto.getPassword());
			udto = null;
			
		}
		
		log.info(this.getClass().getName() + " adminUserInfo end");
		return "admin/userFindPw";
	}
}