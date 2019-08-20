package kr.co.thenet.fapee.look.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface LookMapper {
	List<EgovMap> selectLookStyleList() throws Exception;
}
