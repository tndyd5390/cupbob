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

import com.cupbob.dto.Comment_infoDTO;
import com.cupbob.dto.User_boardDTO;
import com.cupbob.service.IBoardService;
import com.cupbob.service.ICommentService;
import com.cupbob.util.CmmUtil;

@Controller
public class AdminBoardController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "BoardService")
	private IBoardService boardService;
	@Resource(name = "CommnetService")
	private ICommentService commentService;


	@RequestMapping(value = "adminBoardList", method = RequestMethod.GET)
	public String adminBoardList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		log.info(this.getClass() + ".adminBoardList start!!!");
		List<User_boardDTO> boardList = boardService.getAdminBoardList();
		if (boardList == null) {
			boardList = new ArrayList<User_boardDTO>();
		}
		
		log.info(boardList.size());
		model.addAttribute("boardList", boardList);
		log.info(this.getClass() + "adminBoardList end!!!");
		boardList = null;
		log.info(this.getClass() + ".adminBoardList end!!!");
		return "admin/adminBoardList";
	}

	@RequestMapping(value = "adminBoardDetail", method = RequestMethod.GET)
	public String adminBoardDetail(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		log.info(this.getClass() + ".adminBoardDetail start !!");
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		log.info("bnum : " + bnum);
		User_boardDTO bdto = new User_boardDTO();
		bdto.setPost_no(bnum);
		bdto = boardService.getAdminBoardDetail(bdto);
		if (bdto == null) {
			bdto = new User_boardDTO();
		}
		bdto.setContents(CmmUtil.exchangeEscape(bdto.getContents()));//특수문자 처리
		
		Comment_infoDTO cDTO = new Comment_infoDTO();
		cDTO.setPost_no(bnum);
		
		List<Comment_infoDTO> cList = commentService.getCommentList(cDTO);
		
		
		
		model.addAttribute("bdto", bdto);
		model.addAttribute("cList", cList);
		cList=null;
		bdto = null;
		bnum = null;
		log.info(this.getClass() + ".adminBoardDetail end !!");
		return "admin/adminBoardDetail";
	}

	@RequestMapping(value = "adminBoardDetailDelete", method = RequestMethod.GET)
	public String adminBoardDetailDelete(HttpServletRequest req, HttpServletResponse resp, Model model)
			throws Exception {
		log.info(this.getClass() + ".adminBoardDetailDelete start !!");
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		log.info("bnum : " + bnum);
		User_boardDTO bdto = new User_boardDTO();
		bdto.setPost_no(bnum);
		int result = boardService.deleteAdminBoardDetailDelete(bdto);
		String msg = "";
		String url = "";
		if (result > 0) {
			msg = "삭제되었습니다.";
			url = "adminBoardList.do";
		} else {
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

	@RequestMapping(value = "adminBoardReg", method = RequestMethod.GET)
	public String adminBoardReg(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		log.info(this.getClass() + " adminBoardReg Start !! !!");
		log.info(this.getClass() + " adminBoardReg End !! !!");
		return "admin/adminBoardReg";
	}

	@RequestMapping(value = "adminBoardProc", method = RequestMethod.POST)
	public String adminBoardProc(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception {
		log.info(this.getClass() + " adminBoardProc Start !! ");
		String boardTitle = CmmUtil.nvl(req.getParameter("board_title"));
		String boardContent = CmmUtil.nvl(req.getParameter("contents"));
		log.info("boardTitle  :  " + boardTitle);
		log.info("boardContent  :  " + boardContent);
		User_boardDTO bDTO = new User_boardDTO();
		bDTO.setTitle(boardTitle);
		bDTO.setContents(boardContent);
		boardService.insertAdminBoard(bDTO);
		bDTO = null;
		log.info(this.getClass() + " adminBoardProc Ent !! ");
		return "redirect:adminBoardList.do";
	}
	
	@RequestMapping(value="adminBoardCheckedDelete", method = RequestMethod.POST)
	public String adminBoardCheckedDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		String[] del_check = req.getParameterValues("del_check");
		log.info(this.getClass() + (del_check + ""));
		User_boardDTO bdto = new User_boardDTO();
		bdto.setAllCheck(del_check);
		if(boardService.deleteAdminAllCheck(bdto)){
			model.addAttribute("msg", "삭제되었습니다.");
		}else{
			model.addAttribute("msg", "삭제 실패");
		}
		model.addAttribute("url", "adminBoardList.do");
		bdto = null;
		del_check = null;
		return "admin/boardAlert";
	}
	
	@RequestMapping(value="adminBoardUpdateView",method=RequestMethod.GET)
	public String adminBoardUpdateView(HttpServletRequest req,HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass() + "adminBoardUpdateView Start!!");
		String bnum = CmmUtil.nvl(req.getParameter("bnum"));
		log.info("bnum :: " + bnum);
		User_boardDTO bdto = new User_boardDTO();
		bdto.setPost_no(bnum);
		bdto=boardService.getAdminBoardDetail(bdto);
		if(bdto == null){
			bdto = new User_boardDTO();
		}
		bdto.setContents(CmmUtil.exchangeEscape(bdto.getContents()));//특수문자 처리
		model.addAttribute("bdto",bdto);
		bdto = null;
		bnum = null;
		log.info(this.getClass() + "adminBoardUpdateView END!!");
		return "admin/adminBoardUpdateView";
	}
	
	@RequestMapping(value="adminBoardUpdate",method=RequestMethod.POST)
	public String adminBoardUpdate(HttpServletRequest req,HttpServletResponse resp,Model model) throws Exception{
		log.info(this.getClass() + "adminBoardUpdate Start !!");
		String bnum=CmmUtil.nvl(req.getParameter("bnum"));
		log.info(this.getClass() + ".bnum :" + bnum);
		String title = CmmUtil.nvl(req.getParameter("title"));
		log.info(this.getClass() + ".title : " + title);
		String contents = CmmUtil.nvl(req.getParameter("contents"));
		log.info(this.getClass() + ".contents : " + contents);
		User_boardDTO bdto = new User_boardDTO();
		bdto.setPost_no(bnum);
		bdto.setTitle(title);
		bdto.setContents(contents);
		int result = boardService.updateAdminBoard(bdto);
		if(result != 0){
			model.addAttribute("msg", "수정되었습니다.");
		}else{
			model.addAttribute("msg", "수정 실패");
		}
		model.addAttribute("url" , "adminBoardDetail.do?bnum=" + bnum);
		bnum = null;
		title = null;
		contents = null;
		bdto = null;
		log.info(this.getClass() + "adminBoardUpdate END !!");
		return "admin/boardAlert";
	}
}
