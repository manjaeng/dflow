package kr.co.thenet.fapee.intro.web;

import java.util.List;

import kr.co.thenet.fapee.common.util.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.intro.service.IntroService;
import kr.co.thenet.fapee.user.service.UserService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IntroController {

	@Autowired
	private IntroService introService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/app/intro/step1.do")
	public String step1(ModelMap model, HttpServletRequest req) throws Exception {
		if (SessionUtils.isLogin(req)) {
			return  "home/home.app";
		}else {
			return "intro/step1.app";
		}
	}
	
	@GetMapping("/app/intro/step2.do")
	public String step2(ModelMap model, HttpServletRequest req) throws Exception {
		if (SessionUtils.isLogin(req)) {
			return  "home/home.app";
		}else {

			List<EgovMap> styleList = introService.selectIntroStyleList();
			model.addAttribute("styleList", styleList);

			return "intro/step2.app";
		}

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
	
	@PostMapping("/app/intro/intro_complte.do")
	@ResponseBody
	public String introComplete(@RequestBody EgovMap introMap) throws Exception {
		
		boolean isSuccess = userService.insertUserFilterInfo(introMap);

		if(isSuccess) {
			return "t";
		} else {
			return "f";
		}
		
	}
}
