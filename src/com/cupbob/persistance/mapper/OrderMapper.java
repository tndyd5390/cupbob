package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.dto.TotalOrderItemDTO;

@Mapper("OrderMapper")
public interface OrderMapper {
	public List<TotalOrderInfoDTO> getTotalOrderInfoList() throws Exception;
	public List<TotalOrderItemDTO> getTotalOrderItemList(String orderNo) throws Exception;
}
