package com.cupbob.controller.admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cupbob.dto.Comment_infoDTO;
import com.cupbob.service.ICommentService;
import com.cupbob.util.CmmUtil;

@Controller
public class AdminCommentController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="CommnetService")
	private ICommentService commentService;
	
	@RequestMapping(value="commTest")
	public String commTest(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {
		log.info(this.getClass().getName() + " commTest start");
		
		
		log.info(this.getClass().getName() + " commTest end");
		return "admin/test";
	}
	
	@RequestMapping(value="cmtCreate")
	public @ResponseBody List<Comment_infoDTO> cmtCreate(@RequestParam(value = "contents") String cmtContents, @RequestParam(value="pNo") String pNo,HttpSession session) throws Exception{
		log.info(this.getClass().getName()+"cmtCreate start");
		String user_no = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
				
		Comment_infoDTO ctDTO = new Comment_infoDTO();
		
		ctDTO.setUser_no("1");
		ctDTO.setContents(cmtContents);
		ctDTO.setPost_no(pNo);
		
		commentService.createComment(ctDTO);
		List<Comment_infoDTO> cList= commentService.getCommentList(ctDTO);
		
		log.info(this.getClass().getName()+"cmtCreate end");
		
		return cList;
	}
	@RequestMapping(value="cmtDelete")
	public @ResponseBody List<Comment_infoDTO> cmtDelete(@RequestParam(value="cmtNo", required=false) String cmtNo, @RequestParam(value="pNo") String pNo) throws Exception{
		log.info(this.getClass().getName()+"cmtDelete start");
		System.out.println(cmtNo);
		Comment_infoDTO ctDTO = new Comment_infoDTO();
		ctDTO.setCmt_no(cmtNo);
		ctDTO.setPost_no(pNo);
		commentService.deleteComment(ctDTO);
		
		List<Comment_infoDTO> cList= commentService.getCommentList(ctDTO);
		
		if(cList==null){
			
		}
		ctDTO = null;
		log.info(this.getClass().getName()+"cmtDelete end");
		return cList;
	}
	
}
