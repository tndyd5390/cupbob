package com.cupbob.controller.admin;

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
import com.cupbob.service.ICommentService;
import com.cupbob.util.CmmUtil;

@Controller
public class AdminCommentController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CommentService")
	private ICommentService commentService;
	
	@RequestMapping(value="commTest")
	public String commTest(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {
		log.info(this.getClass().getName() + " commTest start");
		
		
		
		log.info(this.getClass().getName() + " commTest end");
		return "admin/test";
	}
	
	@RequestMapping(value="createComment",method={RequestMethod.GET,RequestMethod.POST})
	public void createComment(HttpSession session, HttpServletRequest req,HttpServletResponse resp,Model model) throws Exception{
		String cmtContents = CmmUtil.nvl(req.getParameter("textarea"));
		String user_no = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
		String post_no = CmmUtil.nvl(req.getParameter("pNo"));
				
		Comment_infoDTO cDTO = new Comment_infoDTO();
		
		cDTO.setUser_no(user_no);
		cDTO.setContents(cmtContents);
		log.info("createComment Start !!");
		
		commentService.createComment(cDTO);
		
		log.info("createComment END !!");
		
		resp.getWriter().flush();
	}
	
}
