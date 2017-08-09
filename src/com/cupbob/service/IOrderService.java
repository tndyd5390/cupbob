package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.dto.TotalOrderInfoDTO;

public interface IOrderService {
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception;
	public List<TotalOrderDTO> updateAdminOrdNo(String ordNo, String statNo) throws Exception;
	public List<TotalOrderInfoDTO> getAdminOrderRemainTime() throws Exception;
	public boolean insertOrderSuccess(Order_infoDTO oDTO, List<Order_itemDTO> oList) throws Exception;
	public int test() throws Exception;
	public List<TotalOrderDTO> selectOrderList(String user_no) throws Exception;
}