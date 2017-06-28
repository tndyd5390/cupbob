package com.cupbob.controller.admin;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartFile;

import com.cupbob.dto.Product_infoDTO;
import com.cupbob.service.IMenuService;
import com.cupbob.util.CmmUtil;

@Controller
public class AdminMenuController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MenuService")
	private IMenuService menuService;
	
	String savePath="C:/Users/Data3811-32/git/cupbob/WebContent/menuImg/";

	@RequestMapping(value="adminMenuList", method = RequestMethod.GET)
	public String getUserList(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMenuList start!!");
		List<Product_infoDTO> pList = menuService.getAdminMenuList();
		if(pList == null){
			pList = new ArrayList<Product_infoDTO>();
		}
		model.addAttribute("pList", pList);
		pList = null;
		log.info(this.getClass() + "menuList end");
		return "admin/adminMenuList";
	}
	
	@RequestMapping(value="adminMenuReg", method = RequestMethod.GET)
	public String adminMenuReg(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMenuReg start!!");
		log.info(this.getClass() + ".adminMenuReg end!!");
		return "admin/adminMenuReg";
	}
	
	@RequestMapping(value="adminMenuRegProc", method = RequestMethod.POST)
	public String adminMenuRegProc(HttpServletRequest req, HttpServletResponse resp, Model model, @RequestParam("prdtimg") MultipartFile file, HttpSession session) throws Exception{
		log.info(this.getClass() + ".adminMenuRegProc start!!");
		String name = req.getParameter("name");
		log.info(this.getClass() + " name : " + name);
		String price = req.getParameter("price");
		log.info(this.getClass() + " price : " + price);
		String kcal = req.getParameter("kcal");
		log.info(this.getClass() + " kcal : " + kcal);
		String contents = req.getParameter("contents");
		log.info(this.getClass() + " contents : " + contents);
		
		String reFileName = "";
		String fileOrgName = file.getOriginalFilename();
		log.info(this.getClass() + ".file.getOriginalFilename() : " + file.getOriginalFilename());
		String extended = fileOrgName.substring(fileOrgName.indexOf("."), fileOrgName.length());
		String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
		Product_infoDTO pDTO = new Product_infoDTO();
		savePath = CmmUtil.nvl(savePath);
		reFileName = savePath + now + extended;
		File newFile = new File(reFileName);
		file.transferTo(newFile);
		pDTO.setFile_org_name(fileOrgName);
		pDTO.setFile_name(now + extended);
		pDTO.setFile_path(savePath);
		pDTO.setPrdt_kcal(kcal);
		pDTO.setPrdt_name(name);
		pDTO.setPrdt_price(price);
		pDTO.setContents(contents);
		
		int result = -1;
		result = menuService.insertAdminMenu(pDTO);
		if(result != 0){
			model.addAttribute("msg", "메뉴가 등록되었습니다.");
		}else{
			model.addAttribute("msg", "메뉴등록이 실패했습니다.");
		}
		model.addAttribute("url", "adminMenuList.do");
		name = null;
		price = null;
		kcal = null;
		contents = null;
		reFileName = null;
		fileOrgName = null;
		extended = null;
		now = null;
		pDTO = null;
		log.info(this.getClass() + ".adminMenuRegProc end!!");
		return "admin/boardAlert";
	}
	
	@RequestMapping(value="adminMenuDetail", method = RequestMethod.GET)
	public String adminMenuDetail(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMenuDetail start!!");
		String pnum = req.getParameter("pnum");
		log.info(this.getClass() + ".pnum : " + pnum);
		Product_infoDTO pDTO = new Product_infoDTO();
		pDTO.setPrdt_no(pnum);
		pDTO = menuService.getAdminMenuDetail(pDTO);
		if(pDTO == null){
			pDTO = new Product_infoDTO();
		}
		model.addAttribute("pDTO", pDTO);
		pDTO = null;
		pnum = null;
		log.info(this.getClass() + ".adminMenuRegDetail end!!");
		return "admin/adminMenuDetail";
	}
	
	@RequestMapping(value="adminMenuDeleteOne", method = RequestMethod.GET)
	public String adminMenuDeleteOne(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMenuDeleteOne start!!");
		String pnum = req.getParameter("pnum");
		log.info(this.getClass() + ".pnum " + pnum);
		Product_infoDTO pDTO = new Product_infoDTO();
		pDTO.setPrdt_no(pnum);
		int result = -1;
		result = menuService.deleteAdminMenuOne(pDTO, log);
		if(result != 0){
			model.addAttribute("msg", "메뉴가 삭제되었습니다.");
		}else{
			model.addAttribute("msg", "메뉴 삭제가 실패했습니다.");
		}
		model.addAttribute("url", "adminMenuList.do");
		pnum = null;
		pDTO = null;
		log.info(this.getClass() + ".adminMenuDeleteOne end!!");
		return "admin/boardAlert";
	}
	@RequestMapping(value="adminMenuUpdateView", method = RequestMethod.GET)
	public String adminMenuUpdateView(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMenuUpdateView start!!");
		String pnum = req.getParameter("pnum");
		Product_infoDTO pDTO = new Product_infoDTO();
		pDTO.setPrdt_no(pnum);
		pDTO = menuService.getAdminMenuDetail(pDTO);
		if(pDTO == null){
			pDTO = new Product_infoDTO();
		}
		model.addAttribute("pDTO", pDTO);
		pDTO = null;
		log.info(this.getClass() + ".adminMenuUpdateView end!!");
		return "admin/adminMenuUpdateView";
	}
	
	
	@RequestMapping(value="adminMenuUpdateProc", method = RequestMethod.POST)
	public String adminMenuUpdateProc(HttpServletRequest req, HttpServletResponse resp , Model model, @RequestParam("prdtimg") MultipartFile file) throws Exception{
		log.info(this.getClass() + ".adminMenuUpadateProc start!!");
		String pnum = req.getParameter("pnum");
		log.info(this.getClass() + ".adminMenuUpdateProc.pnum : " + pnum);
		String name = req.getParameter("name");
		log.info(this.getClass() + ".adminMenuUpdateProc.name : " + name);
		String price = req.getParameter("price");
		log.info(this.getClass() + ".adminMenuUpdateProc.price : " + price);
		String kcal = req.getParameter("kcal");
		log.info(this.getClass() + ".adminMenuUpdateProc.kcal : " + kcal);
		String contents = req.getParameter("contents");
		log.info(this.getClass() + ".adminMenuUpdateProc.contents : " + contents);
		
		Product_infoDTO pDTO = new Product_infoDTO();
		pDTO.setPrdt_no(pnum);
		pDTO.setPrdt_name(name);
		pDTO.setPrdt_price(price);
		pDTO.setPrdt_kcal(kcal);
		pDTO.setContents(contents);
		int result = -1;
		result = menuService.updateAdminMenu(pDTO, file, savePath, log);
		String msg;
		if(result != 0){
			msg = "메뉴가 수정되었습니다.";
		}else{
			msg = "메뉴 수정에 실패했습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", "adminMenuList.do");
		pnum = null;
		name = null;
		price = null;
		kcal = null;
		contents = null;
		pDTO = null;
		log.info(this.getClass() + ".adminMeneUpdateProc end!!");
		return "admin/boardAlert";
	}
	@RequestMapping(value="adminMenuCheckedDelete", method = RequestMethod.POST)
	public String adminMenuCheckedDelete(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass() + ".adminMeneCheckedDelete start!!");
		String[] del_check = req.getParameterValues("del_check");
		Product_infoDTO pDTO = new Product_infoDTO();
		pDTO.setAllCheck(del_check);
		if(menuService.deleteAdminMenuChecked(pDTO, log)){
			model.addAttribute("msg", "삭제되었습니다.");
		}else{
			model.addAttribute("msg", "삭제 실패");
		}
		model.addAttribute("url", "adminMenuList.do");
		pDTO = null;
		del_check = null;
		log.info(this.getClass() + ".adminMeneCheckedDelete end!!");
		return "admin/boardAlert";
	}
	@RequestMapping(value="menuSearch")
	public @ResponseBody List<Product_infoDTO> menuSearch(@RequestParam(value = "word") String word)throws Exception{
		log.info(this.getClass() + "menuSearch start!!");
		Product_infoDTO pDTO = new Product_infoDTO();
		pDTO.setPrdt_name(word);
		System.out.println(pDTO.getPrdt_name());
		List<Product_infoDTO> menuList = menuService.menuSearch(pDTO);
		
		if(menuList == null){
			menuList = new ArrayList<Product_infoDTO>();
		}
		
		log.info(this.getClass() + "menuSearch end!!");
		return menuList;
		
	}
}
