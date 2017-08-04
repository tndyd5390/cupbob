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

import com.cupbob.dto.Comment_infoDTO;
import com.cupbob.dto.User_boardDTO;
import com.cupbob.service.IBoardService;
import com.cupbob.service.ICommentService;
import com.cupbob.util.CmmUtil;


@Controller
public class BoardController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="BoardService")
	private IBoardService boardService;
	@Resource(name = "CommentService")
	private ICommentService commentService;
	
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
		boardTitle = CmmUtil.exchangeEscape(boardTitle);
		String boardContent = CmmUtil.nvl(req.getParameter("detail"));
		boardTitle = CmmUtil.exchangeEscape(boardTitle);
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
	
	
	@RequestMapping(value="userBoardDetail", method = RequestMethod.GET)
	public String userBoardDetail(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userBoardDetail start!!!");
		
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		System.out.println(bnum);
		
		User_boardDTO bDTO = new User_boardDTO();
		bDTO.setPost_no(bnum);
		bDTO = boardService.getAdminBoardDetail(bDTO);
		if(bDTO == null){
			bDTO = new User_boardDTO();
		}
		bDTO.setContents(CmmUtil.exchangeEscape(bDTO.getContents()));
		
		Comment_infoDTO cDTO = new Comment_infoDTO();
		cDTO.setPost_no(bnum);
		
		List<Comment_infoDTO> cList = commentService.getCommentList(cDTO);
		
		model.addAttribute("bDTO", bDTO);
		model.addAttribute("cList", cList);
		
		cList = null;
		bnum = null;
		bDTO = null;
		
		log.info(this.getClass() + "userBoardDetail end!!!");
		return "user/userBoardDetail";
	}
	

	@RequestMapping(value="userBoardDelete", method = RequestMethod.GET)
	public String userBoardDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + "userBoardDelete start!!!");
		
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		System.out.println(bnum);
		
		User_boardDTO bDTO = new User_boardDTO();
		bDTO.setPost_no(bnum);
		
		int result = boardService.deleteAdminBoardDetailDelete(bDTO);
		
		String msg = "";
		String url = "";
		
		if(result > 0){
			msg = "삭제되었습니다.";
			url = "userBoardList.do";
		}else{
			msg = "오류";
			url = "userBoardDetail.do?bnum="+bnum;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		url = null;
		msg = null;
		bDTO = null;
		
		log.info(this.getClass() + "userBoardDelete end!!!");
		return "user/userBoardAlert";
	}
	
	@RequestMapping(value="userBoardUpdateView", method=RequestMethod.GET)
	public String userBoardUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".userBoardUpdateView start!!!");
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		log.info(this.getClass() + " bnum : " + bnum);
		User_boardDTO bDTO = new User_boardDTO();
		bDTO.setPost_no(bnum);
		bDTO = boardService.getAdminBoardDetail(bDTO);
		if(bDTO == null){
			bDTO = new User_boardDTO();
		}
		model.addAttribute("bDTO", bDTO);
		bnum = null;
		bDTO = null;
		log.info(this.getClass() + ".userBoardUpdateView end!!!");
		return "user/userBoardUpdateView";
	}
	@RequestMapping(value="userBoardUpdateProc", method=RequestMethod.POST)
	public String userBoardUpdateProc(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session) throws Exception{
		log.info(this.getClass() + ".userBoardUpdateProc start!!!");
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		log.info(this.getClass() + " bnum : " + bnum);
		String title = CmmUtil.nvl(req.getParameter("title"));
		log.info(this.getClass() + " title : " + title);
		title = CmmUtil.exchangeEscape(title);
		String detail = CmmUtil.nvl(req.getParameter("detail"));
		detail = CmmUtil.exchangeEscape(detail);
		log.info(this.getClass() + " detail : " + detail);
		String userNo = CmmUtil.nvl((String)session.getAttribute("ss_user_no"));
		User_boardDTO bDTO = new User_boardDTO();
		bDTO.setPost_no(bnum);
		bDTO.setTitle(title);
		bDTO.setContents(detail);
		bDTO.setUser_no(userNo);
		boolean result = false;
		result = boardService.updateUserBoard(bDTO);
		String msg, url;
		if(result){
			msg = "수정 되었습니다.";
			url = "userBoardList.do";
		}else{
			msg = "오류";
			url = "userBoardDetail.do?bnum="+bnum;
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info(this.getClass() + ".userBoardUpdateProc end!!!");
		return "user/userBoardAlert";
	}
}
