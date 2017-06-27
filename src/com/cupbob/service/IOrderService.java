package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.TotalOrderDTO;

public interface IOrderService {
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception;
}
