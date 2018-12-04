package com.cupbob.crontab;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cupbob.dto.Order_infoDTO;
import com.cupbob.dto.Order_itemDTO;
import com.cupbob.dto.TotalOrderDTO;
import com.cupbob.service.IOrderService;
import com.cupbob.util.CmmUtil;

@Component
public class Scheduler { 
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="OrderService")
	private IOrderService orderService;
	
	@Scheduled(cron = "0 0 02 * * *") 
	public void cronTest1() throws Exception{ 
		String[] prdt_no = {"17","18","19","20","21","22","23","24","25","26"};
		String[] prdt_price = {"3000","3000","3000","2500","3000","2000","2000","1500","1500","3000"};
		String[] yn = {"y", "n"};
		String[] userNo = {"70", "71"};
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmms");
		String ordNo = sf.format(new Date());
		
		int orderUserQty = CmmUtil.randomRange(2, 10);
		int result = 0;
		for(int i = 1; i<= orderUserQty; i++){
			int randomNo = CmmUtil.randomRange(0, 9);
			int qty = CmmUtil.randomRange(1, 20);
			int rec_yn = CmmUtil.randomRange(0, 1);
			//int price = Integer.parseInt(prdt_price[randomNo]) * qty;
			ordNo = (Long.parseLong(ordNo) + 1) + "";
			Order_infoDTO oDTO = new Order_infoDTO();
			oDTO.setOrd_no(ordNo);
			//oDTO.setTotal_ord_price(price + "");
			//oDTO.setReal_ord_price(price + "");
			oDTO.setPayment_tp("P");
			oDTO.setUsr_rcv_time("12:00");
			oDTO.setRcv_yn(yn[rec_yn]);
			oDTO.setUser_no(userNo[rec_yn]);
			oDTO.setTid("P1710210000008");
			
			Set<String> set = new HashSet<String>();
			int tmp = CmmUtil.randomRange(1, 9);
			int price = 0;
			for(int j = 0;j< tmp; j++){
				int prdtNo = CmmUtil.randomRange(0, 9);
				set.add(prdt_no[prdtNo]);
				price += Integer.parseInt(prdt_price[prdtNo]) * qty;
			}
			
			List<Order_itemDTO> oList = new ArrayList<Order_itemDTO>();
			for(String prdtNo : set){				   
				Order_itemDTO oiDTO = new Order_itemDTO();
				oiDTO.setPrdt_no(prdtNo);
				oiDTO.setOrd_amnt(qty + "");
				oiDTO.setReg_user_no(userNo[rec_yn]);
				oList.add(oiDTO);
			}
			
			oDTO.setReal_ord_price(price + "");
			oDTO.setTotal_ord_price(price + "");
			result += orderService.insertDummyData(oDTO, oList);
		}
	} 
}

