package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Product_infoDTO;

@Mapper("MenuMapper")
public interface MenuMapper {
	public List<Product_infoDTO> getAdminMenuList() throws Exception;
	public int insertAdminMenu(Product_infoDTO pDTO) throws Exception;
	public Product_infoDTO getAdminMenuDetail(Product_infoDTO pDTO) throws Exception;
	public int deleteAdminMenuOne(Product_infoDTO pDTO) throws Exception;
}
