package com.cupbob.controller.user;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;

import com.cupbob.service.IBoardService;


@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BoardService")
	private IBoardService boardService;
}
