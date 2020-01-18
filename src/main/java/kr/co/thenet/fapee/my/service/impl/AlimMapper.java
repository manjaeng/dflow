package kr.co.thenet.fapee.my.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.AlimSettingVO;
import kr.co.thenet.fapee.common.model.AlimVO;
import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.ReviewImageVO;
import kr.co.thenet.fapee.common.model.ReviewVO;

@Mapper
public interface AlimMapper {
	
	List<AlimVO> selectAlimList(AlimVO form) throws Exception;
	
	int insertAlim(AlimVO form) throws Exception;
	
	AlimSettingVO selectAlimSetting(AlimSettingVO form) throws Exception;
	
	int insertAlimSetting(AlimSettingVO form) throws Exception;
	
	int updateAlimSetting(AlimSettingVO form) throws Exception;
	
}
