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

@Controller
public class AdminUserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@RequestMapping(value = "adminUserList", method = RequestMethod.GET)
	public String adminUserList(HttpSession session, HttpServletRequest req, HttpServletResponse res, Model model) throws Exception{
		log.info(this.getClass() + "adminUserList start!!!");

		List<User_infoDTO> UserList = userService.getUserList();

		if (UserList == null) {
			UserList = new ArrayList<>();
		}

		model.addAttribute("UserList", UserList);

		log.info(this.getClass() + "adminUserList end!!!");
		return "admin/adminUserList";
	}
}
