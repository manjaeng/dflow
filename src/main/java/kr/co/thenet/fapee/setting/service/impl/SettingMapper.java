package kr.co.thenet.fapee.setting.service.impl;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface SettingMapper {

	int insertSettingQnaInfo(EgovMap egovMap) throws Exception;
}
