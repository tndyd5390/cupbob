package com.cupbob.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cupbob.persistance.mapper.OrderMapper;
import com.cupbob.service.IOrderService;
@Service("OrderService")
public class OrderService implements IOrderService {
	@Resource(name="OrderMapper")
	private OrderMapper orderMapper;
	
}
