package kr.co.thenet.fapee.my.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.model.AlimSettingVO;
import kr.co.thenet.fapee.common.model.AlimVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.my.service.AlimService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AlimController {

	@Autowired
	private AlimService alimService;
	
	//알림 목록
	@GetMapping("/app/my/alim.do")
	public String alim(AlimVO form, Model model) throws Exception {
		if(StringUtils.isEmpty(form.getGrp())) form.setGrp("ME");
		model.addAttribute("form", form);
		
		return "my/alim.app";
	}
	
	//알림 설정
	@GetMapping("/app/setting/setting_alim.do")
	public String settingAlim(AlimSettingVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		
		form.setUserIdKey(SessionUtils.getIdKey());
		model.addAttribute("data", alimService.selectAlimSetting(form));
		
		return "setting/setting_alim.app";
	}

}
