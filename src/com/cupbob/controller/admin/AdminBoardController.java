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
		
		log.info(boardList.size());
		model.addAttribute("boardList", boardList);
		
		log.info(this.getClass() + "adminBoardList start!!!");
		return "admin/adminBoardList";
	}
	
	@RequestMapping(value="adminBoardReg",method=RequestMethod.GET)
	public String adminBoardReg(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + " adminBoardReg Start !! !!");
		
		log.info(this.getClass() + " adminBoardReg End !! !!");
		
		
		return "admin/adminBoardReg";
	}
	
	@RequestMapping(value="adminBoardProc",method=RequestMethod.POST)
	public String adminBoardProc(HttpServletRequest req, HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass() + " adminBoardProc Start !! ");
		String boardTitle = req.getParameter("board_title");
		String boardContent = req.getParameter("board_content");
		log.info("boardTitle  :  "  + boardTitle);
		log.info("boardContent  :  "  + boardContent);
		
		User_boardDTO uDTO = new User_boardDTO();
		
		
		uDTO.setTitle(boardTitle);
		
		boardService.insertBoard(uDTO);
				
		uDTO = null;
		
		log.info(this.getClass() + " adminBoardProc Ent !! ");
				
		return "redirect:adminBoardList.do";
		
		
	}
}
