package com.cupbob.persistance.mapper;

import java.util.List;
import java.util.Map;
import com.cupbob.config.Mapper;
import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.dto.TotalOrderItemDTO;

@Mapper("OrderMapper")
public interface OrderMapper {
	public List<TotalOrderInfoDTO> getTotalOrderInfoList() throws Exception;
	public List<TotalOrderItemDTO> getTotalOrderItemList(String orderNo) throws Exception;
	public int updateAdminOrderProc(Map<String, String> map) throws Exception;
	public int insertOrderInfo(Order_infoDTO oDTO) throws Exception;
	public int insertOrderItem(List<Order_itemDTO> oList) throws Exception;
	public int test() throws Exception;
}