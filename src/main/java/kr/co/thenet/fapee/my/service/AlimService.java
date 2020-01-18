package kr.co.thenet.fapee.my.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.AlimSettingVO;
import kr.co.thenet.fapee.common.model.AlimVO;

public interface AlimService {
	
	List<AlimVO> selectAlimList(AlimVO form) throws Exception;
	
	int insertAlim(AlimVO form) throws Exception;
	
	AlimSettingVO selectAlimSetting(AlimSettingVO form) throws Exception;
	
	int saveAlimSetting(AlimSettingVO form) throws Exception;
	
}
