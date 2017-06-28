package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.Chart_DTO;

public interface IChartService {

	List<Chart_DTO> getMonthChart(Chart_DTO cDTO) throws Exception;

}
