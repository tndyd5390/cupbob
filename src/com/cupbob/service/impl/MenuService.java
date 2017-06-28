package com.cupbob.service.impl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cupbob.dto.Product_infoDTO;
import com.cupbob.persistance.mapper.MenuMapper;
import com.cupbob.service.IMenuService;
import com.cupbob.util.CmmUtil;

@Service("MenuService")
public class MenuService implements IMenuService{
	@Resource(name="MenuMapper")
	private MenuMapper menuMapper;

	@Override
	public List<Product_infoDTO> getAdminMenuList() throws Exception {
		return menuMapper.getAdminMenuList();
	}

	@Override
	public int insertAdminMenu(Product_infoDTO pDTO) throws Exception {
		return menuMapper.insertAdminMenu(pDTO);
	}

	@Override
	public Product_infoDTO getAdminMenuDetail(Product_infoDTO pDTO) throws Exception {
		return menuMapper.getAdminMenuDetail(pDTO);
	}

	@Override
	public int deleteAdminMenuOne(Product_infoDTO pDTO, Logger log) throws Exception {
		pDTO = menuMapper.getAdminMenuDetail(pDTO);
		File f = new File(pDTO.getFile_path() + pDTO.getFile_name());
		if(f.delete()) log.info(this.getClass() + ".deleteAdminMenuOne file delete succes");
		else log.info(this.getClass() + ".deleteAdminMenuOne file delete fail");
		return menuMapper.deleteAdminMenuOne(pDTO);
	}

	@Override
	public int updateAdminMenu(Product_infoDTO pDTO, MultipartFile file, String savePath, Logger log) throws Exception {
		int result = 0;
		if (file.getOriginalFilename().equals("")) {
			// 파일이 없을때
			result = menuMapper.updateAdminMenuNoImg(pDTO);
		} else {
			// 파일이 있을때
			Product_infoDTO preDTO = menuMapper.getAdminMenuDetail(pDTO);
			File f = new File(preDTO.getFile_path() + preDTO.getFile_name());
			if(f.delete()) log.info(this.getClass() + ".deleteAdminMenuOne file delete succes");
			else log.info(this.getClass() + ".deleteAdminMenuOne file delete fail");
			String reFileName = "";
			String fileOrgName = file.getOriginalFilename();
			String extended = fileOrgName.substring(fileOrgName.indexOf("."), fileOrgName.length());
			String now = new SimpleDateFormat("yyyyMMddhmsS").format(new Date());
			savePath = CmmUtil.nvl(savePath);
			reFileName = savePath + now + extended;
			File newFile = new File(reFileName);
			file.transferTo(newFile);
			pDTO.setFile_org_name(fileOrgName);
			pDTO.setFile_name(now + extended);
			pDTO.setFile_path(savePath);
			result = menuMapper.updateAdminMenuWithImg(pDTO);
		}
		return result;
	}

	@Override
	public boolean deleteAdminMenuChecked(Product_infoDTO pDTO, Logger log) throws Exception {
		boolean result = false;
		String[] prdtNo = pDTO.getAllCheck();
		for (int i = 0; i < prdtNo.length; i++) {
			Product_infoDTO preDTO = new Product_infoDTO();
			preDTO.setPrdt_no(prdtNo[i]);
			preDTO = menuMapper.getAdminMenuDetail(preDTO);
			File f = new File(CmmUtil.nvl(preDTO.getFile_path()) + CmmUtil.nvl(preDTO.getFile_name()));
			if(f.delete()) log.info(this.getClass() + ".deleteAdminMenuOne file delete succes");
			else log.info(this.getClass() + ".deleteAdminMenuOne file delete fail");
		}
		int resultInt = menuMapper.deleteAdminMenuChecked(pDTO);
		if (resultInt != 0) {
			result = true;
		}
		return result;
	}

	@Override
	public List<Product_infoDTO> menuSearch(Product_infoDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return menuMapper.menuSearch(pDTO);
	}
}
