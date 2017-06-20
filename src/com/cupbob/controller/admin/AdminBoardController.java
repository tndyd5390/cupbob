package com.cupbob.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cupbob.dto.Tmp_boardDTO;
import com.cupbob.dto.User_boardDTO;
import com.cupbob.service.IBoardService;

@Controller
public class AdminBoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BoardService")
	private IBoardService boardService;
	
	@RequestMapping(value="adminBoardList", method=RequestMethod.GET)
	public String adminBoardList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "adminBoardList start!!!");
		List<User_boardDTO> boardList = boardService.getBoardList();
		if(boardList == null){
			boardList = new ArrayList<>();
		}
		
		model.addAttribute("boardList", boardList);
		
		log.info(this.getClass() + "adminBoardList start!!!");
		return "admin/adminBoardList";
	}
	
}
