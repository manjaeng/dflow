package kr.co.thenet.fapee.intro.service;

import java.util.List;

import kr.co.thenet.fapee.common.util.EgovMap;

public interface IntroService {

	List<EgovMap> selectIntroFavoriteStyleList() throws Exception;

	EgovMap selectIntroSizeCount(EgovMap egovMap) throws Exception;

}
