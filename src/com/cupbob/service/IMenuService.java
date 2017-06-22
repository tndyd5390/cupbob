package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.Product_infoDTO;

public interface IMenuService {
	public List<Product_infoDTO> getAdminMenuList() throws Exception;
}
