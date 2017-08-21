package com.cupbob.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cupbob.dto.Chart_DTO;
import com.cupbob.persistance.mapper.ChartMapper;
import com.cupbob.service.IChartService;

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
		HashMap<String, String> rMap = new HashMap<String, String>();
		
		for(Chart_DTO cDTO : chList){
			if(rMap.containsKey(cDTO.getReg_dt())){
				String e[] = rMap.get(cDTO.getReg_dt()).split(",");
				int e1 = Integer.parseInt(e[0])+Integer.parseInt(cDTO.getMale_count()); 
				int e2 = Integer.parseInt(e[1])+Integer.parseInt(cDTO.getFemale_count());
				
				rMap.put(cDTO.getReg_dt(), String.valueOf(e1)+","+String.valueOf(e2));
				
			}else{
				rMap.put(cDTO.getReg_dt(), cDTO.getMale_count()+","+cDTO.getFemale_count());
			}
			
		}
		chList.clear();
		
		for(String key : rMap.keySet()){
			Chart_DTO ctDTO = new Chart_DTO();
			ctDTO.setReg_dt(key);
			String male = rMap.get(key).toString().split(",")[0];
			String fmale =  rMap.get(key).toString().split(",")[1];
			ctDTO.setMale_count(male);
			ctDTO.setFemale_count(fmale);
			chList.add(ctDTO);
			System.out.println(ctDTO.getReg_dt());
			System.out.println(ctDTO.getMale_count());
			System.out.println(ctDTO.getFemale_count());
			
		}
		
		/*
		Chart_DTO reDTO = new Chart_DTO();
		
		for(int i=0; i<chList.size();i++){
			if(i>1){
				if(chList.get(i).getReg_dt().equals(chList.get(i-1).getReg_dt())){
					int malecount = Integer.parseInt(CmmUtil.nvlInt(chList.get(i).getMale_count()))+Integer.parseInt(CmmUtil.nvlInt(chList.get(i-1).getMale_count()));
					int femalecount = Integer.parseInt(CmmUtil.nvlInt(chList.get(i).getFemale_count()))+Integer.parseInt(CmmUtil.nvlInt(chList.get(i-1).getFemale_count()));
					
					reDTO.setReg_dt(chList.get(i).getReg_dt());
					reDTO.setMale_count(String.valueOf(malecount));
					reDTO.setFemale_count(String.valueOf(femalecount));
					
					sDTO[i] = reDTO;
				}else{
					reDTO.setReg_dt(chList.get(i).getReg_dt());
					reDTO.setMale_count(chList.get(i).getMale_count());
					reDTO.setFemale_count(chList.get(i).getMale_count());
					sDTO[i] = reDTO;
				}
			}
		};
		*/
		return chList;
	}
}