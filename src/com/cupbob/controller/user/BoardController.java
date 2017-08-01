package com.cupbob.controller.user;

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

import com.cupbob.dto.User_boardDTO;
import com.cupbob.service.IBoardService;
import com.cupbob.util.CmmUtil;


@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BoardService")
	private IBoardService boardService;
	
	@RequestMapping(value="userBoardList", method = RequestMethod.GET)
	public String userBoardList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userBoardList start!!!");
		
		List<User_boardDTO> userBoardList = boardService.getAdminBoardList();
		
		if(userBoardList == null){
			userBoardList = new ArrayList<User_boardDTO>();
		}
		
		System.out.println(userBoardList.size());
		
		model.addAttribute("userBoardList", userBoardList);
		userBoardList = null;
		
		log.info(this.getClass() + "userBoardList end!!!");
		return "user/userBoardList";
	}
	
	@RequestMapping(value="userBoardReg", method = RequestMethod.GET)
	public String userBoardReg(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userBoardReg start!!!");
		
		log.info(this.getClass() + "userBoardReg end!!!");
		return "user/userBoardReg";
	}
	
	@RequestMapping(value="userBoardProc", method = RequestMethod.POST)
	public String userBoardProc(HttpServletRequest req, HttpServletResponse resp, Model model,  HttpSession session) throws Exception{
		log.info(this.getClass() + "userBoardProc start!!!");
		
		String boardTitle = CmmUtil.nvl(req.getParameter("title"));
		String boardContent = CmmUtil.nvl(req.getParameter("detail"));
		String user_no = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		
		log.info("boardTitle  :  " + boardTitle);
		log.info("boardContent  :  " + boardContent);
		log.info("ss_user_no : " + user_no);
		
		User_boardDTO bDTO = new User_boardDTO();
		
		bDTO.setTitle(boardTitle);
		bDTO.setContents(boardContent);
		bDTO.setUser_no(user_no);
		
		boardService.insertAdminBoard(bDTO);
		
		bDTO = null;
		
		log.info(this.getClass() + "userBoardProc end!!!");
		return "redirect:userBoardList.do";
	}
	
	

}
