package kr.co.thenet.fapee.setting.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.setting.service.SettingService;

@Controller
public class SettingController {

	@Resource
	private SettingService settingService;
	
	@GetMapping("/setting/set.do")
	public String hashtag() throws Exception {
		
		return "setting/set.tiles";
	}
	
}
