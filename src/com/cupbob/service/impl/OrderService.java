package com.cupbob.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cupbob.dto.MilHistoryDTO;
import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.dto.TotalOrderInfoDTO;
import com.cupbob.dto.TotalOrderItemDTO;
import com.cupbob.dto.User_infoDTO;
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
			for(int i = 0; i< tItemList.size();i++){
				prdtName += tItemList.get(i).getPrdt_name() + "</br>";
				ordAmnt += tItemList.get(i).getOrd_amnt() + "</br>";
				price += Integer.parseInt(tItemList.get(i).getPrdt_price()) * Integer.parseInt(tItemList.get(i).getOrd_amnt());
			}
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
			//====================================
			//남은 시간 세팅
			tDTO.setOrd_remainTime(getRemainTime(tDTO.getUsr_rcv_time()));
			totalList.add(tDTO);
		}
		return totalList;
	}

	@Override
	public List<TotalOrderDTO> updateAdminOrdNo(String ordNo, String statNo) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("ordNo", ordNo);
		map.put("statNo", statNo);
		orderMapper.updateAdminOrderProc(map);
		List<TotalOrderDTO> oList = getTotalOrderDTO();
		return oList;
	}

	@Override
	public List<TotalOrderInfoDTO> getAdminOrderRemainTime() throws Exception {
		List<TotalOrderInfoDTO> tList = orderMapper.getTotalOrderInfoList();
		for(TotalOrderInfoDTO tDTO : tList){
			tDTO.setOrd_remainTime(getRemainTime(tDTO.getUsr_rcv_time()));
		}
		return tList;
	}
	

	public String getRemainTime(String userRcvTime) throws Exception {
		Calendar c = Calendar.getInstance();
		String tmp = "";
		tmp += String.valueOf(c.get(Calendar.YEAR));
		tmp += "-" + String.valueOf(c.get(Calendar.MONDAY) + 1);
		tmp += "-" + String.valueOf(c.get(Calendar.DATE));
		tmp += " " + userRcvTime + ":00";
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss", Locale.KOREA);
		String now = sf.format(new Date());
		Date order = sf.parse(tmp);
		Date nowTime = sf.parse(now);
		long duration = order.getTime() - nowTime.getTime();
		long min = duration/60000;
		long hour = min/60;
		min = min-(hour*60);
		System.out.println("duration: " + duration + ", min : " + (duration/60000));
		return hour + ":" + min;
	}

	@Override
	public int test() throws Exception {
		
		return orderMapper.test();
	}

	@Override
	public boolean insertOrderSuccess(Order_infoDTO oDTO, List<Order_itemDTO> oList, Map<String, String> milMap) throws Exception {
		boolean result = false;
		boolean updateResult = false;
		int insertOrderInfo = orderMapper.insertOrderInfo(oDTO);
		int insertOrderItem = orderMapper.insertOrderItem(oList);
		if(milMap.containsKey("dec")){
			/**
			 * 마일리지 감소
			 */
			User_infoDTO uDTO = new User_infoDTO();
			uDTO.setUser_no(oDTO.getUser_no());
			uDTO.setMileage(milMap.get("dec"));
			int update = orderMapper.updateUserMilDec(uDTO);
			MilHistoryDTO mDTO = new MilHistoryDTO();
			mDTO.setOrd_no(oDTO.getOrd_no());
			mDTO.setSpend(milMap.get("dec"));
			mDTO.setUser_no(oDTO.getUser_no());
			mDTO.setReg_user_no(oDTO.getUser_no());
			mDTO.setHistory("사용");
			int insert = orderMapper.insertMilHistory(mDTO);
			if(update != 0 && insert != 0){
				updateResult = true;
			}
		}else{
			/**
			 * 마일리지 증가
			 */
			User_infoDTO uDTO = new User_infoDTO();
			uDTO.setUser_no(oDTO.getUser_no());
			uDTO.setMileage(milMap.get("inc"));
			int update = orderMapper.updateUserMilInc(uDTO);
			MilHistoryDTO mDTO = new MilHistoryDTO();
			mDTO.setOrd_no(oDTO.getOrd_no());
			mDTO.setSave(milMap.get("inc"));
			mDTO.setUser_no(oDTO.getUser_no());
			mDTO.setReg_user_no(oDTO.getUser_no());
			mDTO.setHistory("적립");
			int insert = orderMapper.insertMilHistory(mDTO);
			if(update != 0 && insert != 0){
				updateResult = true;
			}
		}
		if(insertOrderInfo > 0 && insertOrderItem > 0 && updateResult){
			result = true;
		}
		return result;
	}

	@Override
	public Order_infoDTO getOrderNo(String userNo) throws Exception {
		return orderMapper.getOrderNo(userNo);
	}

	@Override
	public User_infoDTO getUserMil(String userNo) throws Exception {
		return orderMapper.getUserMil(userNo);
	}

}