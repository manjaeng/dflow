package kr.co.thenet.fapee.intro.service.impl;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface IntroMapper {
	
	EgovMap selectIntroServiceInfo(int idKey) throws Exception;
}
