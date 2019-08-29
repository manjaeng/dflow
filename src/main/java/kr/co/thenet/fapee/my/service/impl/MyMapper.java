package kr.co.thenet.fapee.my.service.impl;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface MyMapper {
	EgovMap selectMyProfileInfo(long idKey) throws Exception;

	int updateMyProfileInfo(EgovMap profileMap) throws Exception;
}
