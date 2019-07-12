package kr.co.thenet.fapee.setting.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.setting.service.SettingService;

@Service
public class SettingServiceImpl implements SettingService {

	@Resource
	private SettingMapper settingMapper;
}
