package com.cupbob.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cupbob.service.IOrderService;


@Controller
public class OrderController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	@RequestMapping(value="map")
	public String map(HttpSession session) throws Exception{
		log.info("map start");
		
		log.info("map end");
		return "user/map";
	}
	
	
	
}
