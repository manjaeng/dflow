package kr.co.thenet.fapee.intro.web;

import java.util.List;

import kr.co.thenet.fapee.common.model.CodeVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.home.service.CodeService;
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

	@Autowired
	private CodeService codeService;

	@GetMapping("/app/intro/intro.do")
	public String intor(ModelMap model, HttpServletRequest req) throws Exception {

			return "intro/intro.app";

	}

	@GetMapping("/app/intro/intro2.do")
	public String intor2(ModelMap model, HttpServletRequest req) throws Exception {

		return "intro/intro2.app";

	}
	
	@GetMapping("/app/intro/step1.do")
	public String step1(ModelMap model, HttpServletRequest req) throws Exception {
				return "intro/step1.app";
		}
	
	@GetMapping("/app/intro/step2.do")
	public String step2(ModelMap model, HttpServletRequest req) throws Exception {

		List<CodeVO>  productType = codeService.selectCodeList("0001");
		model.addAttribute("productType", productType);

		List<CodeVO> styleList = codeService.selectCodeList("0002");
		model.addAttribute("styleList", styleList);
		if (SessionUtils.isLogin(req)) {
			return  "home/home.app";
		}else {
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
	public String introComplete(@RequestBody EgovMap introMap, HttpServletRequest req) throws Exception {
		
		boolean isSuccess = userService.insertUserFilterInfo(introMap, req);

		if(isSuccess) {
			return "t";
		} else {
			return "f";
		}
		
	}
}
