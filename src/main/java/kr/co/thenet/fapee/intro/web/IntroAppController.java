package kr.co.thenet.fapee.intro.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.intro.service.IntroService;

@Controller
public class IntroAppController {

	@Resource
	private IntroService introService;
	
	@GetMapping("/intro.do")
	private String selectIntroServiceInfo(ModelMap model) throws Exception {
		
		int idKey = 1;
		
		EgovMap intro = introService.selectIntroServiceInfo(idKey);
		model.addAttribute("intro", intro);
		return "intro/intro";
	}
}
