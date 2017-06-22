package com.cupbob.persistance.mapper;

import java.util.List;

import com.cupbob.config.Mapper;
import com.cupbob.dto.Product_infoDTO;

@Mapper("MenuMapper")
public interface MenuMapper {
	public List<Product_infoDTO> getAdminMenuList() throws Exception;
}
