package com.cupbob.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cupbob.dto.Chart_DTO;
import com.cupbob.persistance.mapper.ChartMapper;
import com.cupbob.service.IChartService;
import com.cupbob.util.CmmUtil;

@Service("ChartService")
public class ChartService implements IChartService {
	@Resource(name="ChartMapper")
	private ChartMapper chartMapper;

	@Override
	public List<Chart_DTO> getMonthChart() throws Exception {
		return chartMapper.getMonthChart();
	}

	@Override
	public List<Chart_DTO> getWeekChart() throws Exception {
		return chartMapper.getWeekChart();
	}

	@Override
	public List<Chart_DTO> getWeekOrdPrice() throws Exception {
		return chartMapper.getWeekOrdPrice();
	}

	@Override
	public List<Chart_DTO> getWeekGender() throws Exception {
		List<Chart_DTO> chList = chartMapper.getWeekGender();
		Chart_DTO reDTO = new Chart_DTO();
		for(int i=0; i<chList.size();i++){
			if(i>1){
				if(chList.get(i).getReg_dt().equals(chList.get(i-1).getReg_dt())){
					int malecount = Integer.parseInt(CmmUtil.nvlInt(chList.get(i).getMale_count()))+Integer.parseInt(CmmUtil.nvlInt(chList.get(i-1).getMale_count()));
					int femalecount = Integer.parseInt(CmmUtil.nvlInt(chList.get(i).getFemale_count()))+Integer.parseInt(CmmUtil.nvlInt(chList.get(i-1).getFemale_count()));
					
					reDTO.setReg_dt(chList.get(i).getReg_dt());
					reDTO.setMale_count(String.valueOf(malecount));
					reDTO.setFemale_count(String.valueOf(femalecount));
					
					chList.add(reDTO);
				}
			}
		};
		return chList;
	}
}