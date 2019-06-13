package kr.co.thenet.fapee.app.intro.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IntroController {

	@RequestMapping("/intro.do")
	@ResponseBody
	public String initIntro(ModelMap model) throws Exception {
		
		return "initIntro";
	}

}
