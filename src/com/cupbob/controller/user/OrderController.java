package com.cupbob.controller.user;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import com.cupbob.service.IOrderService;


@Controller
public class OrderController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name="OrderService")
	private IOrderService orderService;
}
