package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.TotalOrderDTO;

public interface IOrderService {
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception;
	public List<TotalOrderDTO> updateAdminOrdNo(String ordNo, String statNo) throws Exception;
}