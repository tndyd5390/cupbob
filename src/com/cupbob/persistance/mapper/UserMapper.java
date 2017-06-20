package com.cupbob.persistance.mapper;

import java.util.List;
import com.cupbob.config.Mapper;


@Mapper("UserMapper")
public interface UserMapper {
	public List getUserList();
}
