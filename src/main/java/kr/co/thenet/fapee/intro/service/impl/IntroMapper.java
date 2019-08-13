package kr.co.thenet.fapee.intro.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface IntroMapper {
	
	List<EgovMap> selectIntroFavoriteStyleList() throws Exception;

	EgovMap selectIntroSizeCount(EgovMap egovMap) throws Exception;
}
