package com.cupbob.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cupbob.dto.Chart_DTO;
import com.cupbob.service.IChartService;

@Controller
public class AdminChartController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource(name = "ChartService")
	private IChartService chartService;
	
	@RequestMapping(value="adminChart")
	public String getChart(HttpServletRequest req, HttpServletResponse resp, Model model) throws Exception{
		log.info(this.getClass().getName()+ " adminChart start");
		
		log.info(this.getClass().getName()+ " adminChart end");
		return "admin/adminChart";
	}
	
	@RequestMapping(value="monthChart")
	public @ResponseBody List<Chart_DTO> monthChart() throws Exception{
		log.info(this.getClass().getName()+ " monthChart start");
		
		Chart_DTO cDTO = new Chart_DTO();
		
		List<Chart_DTO> chList = chartService.getMonthChart(cDTO);
 		
		log.info(this.getClass().getName()+ " monthChart end");
		return chList;
	}
}
