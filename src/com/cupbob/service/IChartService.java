package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.Chart_DTO;

public interface IChartService {

	List<Chart_DTO> getMonthChart() throws Exception;

	List<Chart_DTO> getWeekChart() throws Exception;

	List<Chart_DTO> getWeekOrdPrice() throws Exception;

	List<Chart_DTO> getWeekGender() throws Exception;

}
