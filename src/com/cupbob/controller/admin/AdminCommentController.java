package com.cupbob.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping(value="createComment",method={RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<Comment_infoDTO> cmtJson(@RequestParam(value = "contents") String cmtContents, @RequestParam(value="pNo") String pNo,HttpSession session) throws Exception{
		log.info("createComment Start !!");
		String user_no = CmmUtil.nvl((String) session.getAttribute("ss_user_no"));
				
		System.out.println(cmtContents + " 콘텐");
		System.out.println(pNo + " 피넘");
		
		Comment_infoDTO ctDTO = new Comment_infoDTO();
		
		ctDTO.setUser_no("1");
		ctDTO.setContents(cmtContents);
		ctDTO.setPost_no(pNo);
		
		
		commentService.createComment(ctDTO);
		List<Comment_infoDTO> cList= commentService.getCommentList(ctDTO);
		
		
		log.info("createComment END !!");
		
		return cList;
	}
	
}
