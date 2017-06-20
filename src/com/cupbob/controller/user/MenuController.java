package com.cupbob.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.service.IUserService;


@Controller
public class MenuController {
	private Logger log = Logger.getLogger(this.getClass());
<<<<<<< HEAD
	
	@Resource(name="UserService")
	private IUserService userService;

	@RequestMapping(value="menuList")
	public String getUserList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		
		log.info("getUserList start");
		
		List userList = userService.getUserList();
		if(userList == null){
			userList = new ArrayList<>();
		}
		model.addAttribute("userList", userList);
		log.info("getUserList end");
		return "admin/adminUserJoin";
		
	}
=======

>>>>>>> refs/remotes/origin/test
}
