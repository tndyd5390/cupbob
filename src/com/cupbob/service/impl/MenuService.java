package com.cupbob.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.cupbob.dto.Product_infoDTO;
import com.cupbob.persistance.mapper.MenuMapper;
import com.cupbob.service.IMenuService;

@Service("MenuService")
public class MenuService implements IMenuService{
	@Resource(name="MenuMapper")
	private MenuMapper menuMapper;

	@Override
	public List<Product_infoDTO> getAdminMenuList() throws Exception {
		return menuMapper.getAdminMenuList();
	}
}
