package com.cupbob.persistance.mapper;

import java.util.List;
import java.util.Map;
import com.cupbob.config.Mapper;
import com.cupbob.dto.MilHistoryDTO;
import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.dto.TotalOrderItemDTO;
import com.cupbob.dto.User_infoDTO;

@Mapper("OrderMapper")
public interface OrderMapper {
	public List<TotalOrderInfoDTO> getTotalOrderInfoList() throws Exception;
	public List<TotalOrderItemDTO> getTotalOrderItemList(String orderNo) throws Exception;
	public int updateAdminOrderProc(Map<String, String> map) throws Exception;
	public int insertOrderInfo(Order_infoDTO oDTO) throws Exception;
	public int insertOrderItem(List<Order_itemDTO> oList) throws Exception;
	public Order_infoDTO getOrderNo(String userNo) throws Exception;
	public User_infoDTO getUserMil(String userNo) throws Exception;
	public int updateUserMilDec(User_infoDTO uDTO) throws Exception;
	public int insertMilHistory(MilHistoryDTO mDTO) throws Exception;
	public int updateUserMilInc(User_infoDTO uDTO) throws Exception;
	public int test() throws Exception;
}