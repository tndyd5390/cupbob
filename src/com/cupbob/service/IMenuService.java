package com.cupbob.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import com.cupbob.dto.Product_infoDTO;

public interface IMenuService {
	public List<Product_infoDTO> getAdminMenuList() throws Exception;
	public int insertAdminMenu(Product_infoDTO pDTO) throws Exception;
	public Product_infoDTO getAdminMenuDetail(Product_infoDTO pDTO) throws Exception;
	public int deleteAdminMenuOne(Product_infoDTO pDTO, Logger log) throws Exception;
	public int updateAdminMenu(Product_infoDTO pDTO, MultipartFile file, String savePath, Logger log) throws Exception;
	public boolean deleteAdminMenuChecked(Product_infoDTO pDTO, Logger log) throws Exception;
	public List<Product_infoDTO> menuSearch(Product_infoDTO pDTO)throws Exception;
	public List<Product_infoDTO> getUserMenuList() throws Exception;
	public Product_infoDTO getUserMenuDetail(String menuNo) throws Exception;
}
