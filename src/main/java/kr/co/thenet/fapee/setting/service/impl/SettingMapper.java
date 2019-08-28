package kr.co.thenet.fapee.setting.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface SettingMapper {

	int insertSettingQnaInfo(EgovMap egovMap) throws Exception;
	
	List<EgovMap> selectQnaServiceAllList() throws Exception;
	EgovMap            selectQnaServiceInfo(int idKey) throws Exception;
	void                    updateQnaServiceInfo(EgovMap qnaAnswer) throws Exception;
}
