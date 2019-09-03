package kr.co.thenet.fapee.setting.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.setting.service.SettingService;

@Service
public class SettingServiceImpl implements SettingService {

	@Autowired
	private SettingMapper settingMapper;

	@Override
	public String insertSettingQnaInfo(EgovMap egovMap) throws Exception {
		return (settingMapper.insertSettingQnaInfo(egovMap) == 1) ?  "success" : "fail";
	}

	@Override
	public List<EgovMap> selectQnaServiceAllList() throws Exception {
		return settingMapper.selectQnaServiceAllList();
	}

	@Override
	public EgovMap selectQnaServiceInfo(int idKey) throws Exception {
		return settingMapper.selectQnaServiceInfo(idKey);
	}

	@Override
	public void updateQnaServiceInfo(EgovMap answerMap) throws Exception {
		settingMapper.updateQnaServiceInfo(answerMap);
	}

	@Override
	public List<EgovMap> selectSettingInfo() throws Exception {
		return settingMapper.selectSettingInfo();
	}
	
}
