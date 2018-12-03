package com.cupbob.service;

import java.util.List;
import java.util.Map;

import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.dto.User_infoDTO;

public interface IOrderService {
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception;
	public List<TotalOrderDTO> updateAdminOrdNo(String ordNo, String statNo) throws Exception;
	public List<TotalOrderInfoDTO> getAdminOrderRemainTime() throws Exception;
	public boolean insertOrderSuccess(Order_infoDTO oDTO, List<Order_itemDTO> oList, Map<String, String> milMap) throws Exception;
	public Order_infoDTO getOrderNo(String userNo) throws Exception;
	public User_infoDTO getUserMil(String userNo) throws Exception;
	public int test() throws Exception;
	public List<TotalOrderDTO> selectOrderList(String user_no) throws Exception;
	public List<TotalOrderDTO> orderListMore(String count, String uNum) throws Exception;
	public int updateOrderCancel(String tid) throws Exception;
	public List<Order_itemDTO> getOrdItem(Order_itemDTO otDTO) throws Exception;
	public int insertDummyData(Order_infoDTO oDTO, List<Order_itemDTO> oList) throws Exception;
}