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
	public int updateAdminMenuNoImg(Product_infoDTO pDTO) throws Exception;
	public int updateAdminMenuWithImg(Product_infoDTO pDTO) throws Exception;
	public int deleteAdminMenuChecked(Product_infoDTO pDTO) throws Exception;
	public List<Product_infoDTO> menuSearch(Product_infoDTO pDTO)throws Exception;
	public List<Product_infoDTO> getUserMenuList() throws Exception;
	public Product_infoDTO getUserMenuDetail(String menuNo) throws Exception;
}
