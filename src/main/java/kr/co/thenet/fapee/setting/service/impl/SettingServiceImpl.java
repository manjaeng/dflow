package kr.co.thenet.fapee.setting.service.impl;

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
}
