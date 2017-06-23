package com.cupbob.service;

import java.util.List;

import com.cupbob.dto.Product_infoDTO;

public interface IMenuService {
	public List<Product_infoDTO> getAdminMenuList() throws Exception;
	public int insertAdminMenu(Product_infoDTO pDTO) throws Exception;
	public Product_infoDTO getAdminMenuDetail(Product_infoDTO pDTO) throws Exception;
	public int deleteAdminMenuOne(Product_infoDTO pDTO) throws Exception;
}
