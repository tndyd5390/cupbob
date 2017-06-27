package com.cupbob.service.impl;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.dto.TotalOrderItemDTO;
import com.cupbob.persistance.mapper.OrderMapper;
import com.cupbob.service.IOrderService;
@Service("OrderService")
public class OrderService implements IOrderService {
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;

	@Override
	public List<TotalOrderDTO> getTotalOrderDTO() throws Exception {
		List<TotalOrderInfoDTO> oInfoList = orderMapper.getTotalOrderInfoList();
		List<TotalOrderDTO> totalList = new ArrayList<TotalOrderDTO>();
		for(TotalOrderInfoDTO oDTO : oInfoList){
			TotalOrderDTO tDTO = new TotalOrderDTO();
			List<TotalOrderItemDTO> tItemList = orderMapper.getTotalOrderItemList(oDTO.getOrd_no());
			String prdtName = "";
			String ordAmnt = "";
			int price = 0;
			for(int i = 0; i< tItemList.size()-2;i++){
				prdtName += tItemList.get(i).getPrdt_name() + "</br>";
				ordAmnt += tItemList.get(i).getOrd_amnt() + "</br>";
				price += Integer.parseInt(tItemList.get(i).getPrdt_price());
			}
			prdtName += tItemList.get(tItemList.size()-1).getPrdt_name();
			ordAmnt += tItemList.get(tItemList.size()-1).getOrd_amnt();
			price += Integer.parseInt(tItemList.get(tItemList.size()-1).getPrdt_price());
			tDTO.setOrd_no(oDTO.getOrd_no());
			tDTO.setTotal_ord_price(oDTO.getTotal_ord_price());
			tDTO.setPayment_tp(oDTO.getPayment_tp());
			tDTO.setOrd_dt(oDTO.getOrd_dt());
			tDTO.setOrd_stat(oDTO.getOrd_stat());
			tDTO.setUsr_rcv_time(oDTO.getUsr_rcv_time());
			tDTO.setRcv_time(oDTO.getRcv_time());
			tDTO.setRcv_yn(oDTO.getRcv_yn());
			tDTO.setOrd_cancel_yn(oDTO.getOrd_cancel_yn());
			tDTO.setOrd_cancel_time(oDTO.getOrd_cancel_time());
			tDTO.setUser_name(oDTO.getUser_name());
			tDTO.setPrdt_name(prdtName);
			tDTO.setPrdt_price(price + "");
			tDTO.setOrd_amnt(ordAmnt);
			totalList.add(tDTO);
		}
		return totalList;
	}
	
}
