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
	@Resource(name = "BoardService")
	private IBoardService boardService;
	@RequestMapping(value="adminBoardList", method=RequestMethod.GET)
	public String adminBoardList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminBoardList start!!!");
		List<User_boardDTO> boardList = boardService.getBoardList();
		if (boardList == null) {
			boardList = new ArrayList<>();
		}
		model.addAttribute("boardList", boardList);
		log.info(this.getClass() + "adminBoardList end!!!");
		boardList = null;
		log.info(this.getClass() + ".adminBoardList end!!!");
		return "admin/adminBoardList";
	}
	@RequestMapping(value="adminBoardDetail", method=RequestMethod.GET)
	public String adminBoardDetail(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminBoardDetail start !!");
		String bnum = req.getParameter("bnum");
		log.info("bnum : " + bnum);
		User_boardDTO bdto = new User_boardDTO();
		bdto.setPost_no(bnum);
		bdto = boardService.getBoardDetail(bdto);
		if(bdto == null){
			bdto = new User_boardDTO();
		}
		model.addAttribute("bdto", bdto);
		bdto = null;
		log.info(this.getClass() + ".adminBoardDetail end !!");
		return "admin/adminBoardDetail";
	}
	@RequestMapping(value="adminBoardDetailDelete", method=RequestMethod.GET)
	public String adminBoardDetailDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminBoardDetailDelete start !!");
		String bnum = req.getParameter("bnum");
		log.info("bnum : " + bnum);
		User_boardDTO bdto = new User_boardDTO();
		bdto.setPost_no(bnum);
		int result = boardService.deleteBoardDetailDelete(bdto);
		String msg = "";
		String url = "";
		if(result>0){
			msg = "삭제되었습니다";
			url = "adminBoardList.do";
		}else{
			msg = "삭제 실패";
			url = "adminBoardDetail.do?bnum=" + bnum;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		msg = null;
		url = null;
		bdto = null;
		log.info(this.getClass() + ".adminBoardDetailDelete end !!");
		return "admin/boardAlert";
	}
}
