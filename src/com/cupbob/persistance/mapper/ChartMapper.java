package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Chart_DTO;

@Mapper("ChartMapper")
public interface ChartMapper {

	List<Chart_DTO> getMonthChart() throws Exception;

	List<Chart_DTO> getWeekChart() throws Exception;

	List<Chart_DTO> getWeekOrdPrice() throws Exception;

	List<Chart_DTO> getWeekGender() throws Exception;

	List<Chart_DTO> getMale() throws Exception;
	
	List<Chart_DTO> getFemale() throws Exception;
	
}
