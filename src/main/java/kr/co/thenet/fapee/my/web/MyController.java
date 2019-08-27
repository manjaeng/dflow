package kr.co.thenet.fapee.my.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.my.service.MyService;

@Controller
public class MyController {

	@Autowired
	private MyService myService;
	
	@GetMapping("/app/my/profile.do")
	public String profile(@RequestParam(required=false) String key, ModelMap model) throws Exception {

		if ( key == null) {
			
		} else {
			EgovMap egovMap = new EgovMap();
			
			if(CommonUtils.isNumeric(key)) {
				egovMap.put("mobile", key);
			} else {
				egovMap.put("userId", key);
			}
		}
		
		return "my/profile.app";
	}
	
}
