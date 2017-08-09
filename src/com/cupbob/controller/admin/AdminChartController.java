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
		
		List<Chart_DTO> chList = chartService.getMonthChart();
 		
		log.info(this.getClass().getName()+ " monthChart end");
		return chList;
	}
	
	@RequestMapping(value="weekChart")
	public @ResponseBody List<Chart_DTO> weekChart() throws Exception{
		log.info(this.getClass().getName() + " weekChart Start!");

		List<Chart_DTO> chList = chartService.getWeekChart();
		
		log.info(this.getClass().getName() + " weekChart End!");
		return chList;
	}
	@RequestMapping(value="weekOrdPriceChart")
	public @ResponseBody List<Chart_DTO> weekOrdPrice() throws Exception{
		log.info(this.getClass().getName() + " weekOrdPrice start !");
		
		List<Chart_DTO> chList = chartService.getWeekOrdPrice();
		
		log.info(this.getClass().getName() + " weekOrdPrice end !");
		return chList;
	}
	@RequestMapping(value="weekGenderChart")
	public @ResponseBody List<Chart_DTO> weekGender() throws Exception{
		log.info(this.getClass().getName() + " weekGender start !");
		
		List<Chart_DTO> chList = chartService.getWeekGender();
		
		log.info(this.getClass().getName() + " weekGender end !");
		return chList;
	}
}
