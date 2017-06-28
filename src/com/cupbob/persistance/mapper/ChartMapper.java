package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Chart_DTO;

@Mapper("ChartMapper")
public interface ChartMapper {

	List<Chart_DTO> getMonthChart(Chart_DTO cDTO) throws Exception;
	
}
