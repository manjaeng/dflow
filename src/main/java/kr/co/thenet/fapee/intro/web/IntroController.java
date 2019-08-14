package kr.co.thenet.fapee.intro.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.intro.service.IntroService;

@Controller
public class IntroController {

	@Autowired
	private IntroService introService;
	
	@GetMapping("/app/intro/step1.do")
	public String step1() throws Exception {
		return "intro/step1.app";
	}
	
	@GetMapping("/app/intro/step2.do")
	public String step2(ModelMap model) throws Exception {
		
		List<EgovMap> styleList = introService.selectIntroStyleList();
		model.addAttribute("styleList", styleList);
		
		return "intro/step2.app";
	}
	
	@GetMapping("/app/intro/step3.do")
	public String step3() throws Exception {
		return "intro/step3.app";
	}
	
	@GetMapping("/app/intro/step4.do")
	public String step4(ModelMap model) throws Exception {
		
		EgovMap sizeCount = introService.selectIntroSizeCount(new EgovMap());
		model.addAttribute("sizeCount", sizeCount);
		
		return "intro/step4.app";
	}
	
}
