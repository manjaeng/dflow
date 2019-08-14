package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HomeMapper {
	
	public List<HashMap<String, Object>> selectHomeUserList() throws Exception;
}
