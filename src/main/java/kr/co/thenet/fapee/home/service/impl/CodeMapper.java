package kr.co.thenet.fapee.home.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.CodeVO;

@Mapper
public interface CodeMapper {
	
	public List<CodeVO> selectCodeList(String grp) throws Exception;
	
}
