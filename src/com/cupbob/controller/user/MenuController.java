package com.cupbob.controller.user;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import com.cupbob.service.IMenuService;


@Controller
public class MenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MenuService")
	private IMenuService menuService;
}
