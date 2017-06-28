package com.cupbob.service.impl;

import java.util.List;

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
	public List<Chart_DTO> getMonthChart(Chart_DTO cDTO) throws Exception {
		return chartMapper.getMonthChart(cDTO);
	}
	
	
}