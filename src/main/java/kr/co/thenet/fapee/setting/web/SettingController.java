package kr.co.thenet.fapee.setting.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.setting.service.SettingService;

@Controller
public class SettingController {

	@Resource
	private SettingService settingService;
	
	@GetMapping("/setting/hashtag.do")
	public String hashTagList() throws Exception {
		
		return "";
	}
	
	@GetMapping("/setting/style.do")
	public String styleList() throws Exception {

		return "";
	}
}
