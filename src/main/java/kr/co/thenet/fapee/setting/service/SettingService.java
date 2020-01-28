package kr.co.thenet.fapee.setting.service;

import java.util.List;

import kr.co.thenet.fapee.common.util.EgovMap;

public interface SettingService {

	String insertSettingQnaInfo(EgovMap egovMap) throws Exception;

	List<EgovMap> selectQnaServiceAllList() throws Exception;
	EgovMap            selectQnaServiceInfo(int idKey) throws Exception;
	void                    updateQnaServiceInfo(EgovMap answerMap)  throws Exception;

	List<EgovMap> selectQnaServiceMyList(EgovMap egovMap) throws Exception;

	List<EgovMap> selectSettingInfo() throws Exception;
}
