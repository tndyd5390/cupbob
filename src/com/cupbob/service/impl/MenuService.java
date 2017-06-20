package com.cupbob.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.cupbob.persistance.mapper.MenuMapper;
import com.cupbob.service.IMenuService;

@Service("MenuService")
public class MenuService implements IMenuService{
	@Resource(name="MenuMapper")
	private MenuMapper menuMapper;
}
