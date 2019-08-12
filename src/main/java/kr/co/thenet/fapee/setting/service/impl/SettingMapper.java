package kr.co.thenet.fapee.setting.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface SettingMapper {

	List<EgovMap> selectSettingFavoriteStyleList() throws Exception;
}
