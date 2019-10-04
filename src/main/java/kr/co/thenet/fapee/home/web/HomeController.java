package kr.co.thenet.fapee.home.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.ReportType;
import kr.co.thenet.fapee.home.service.HomeService;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@GetMapping("/app/home/home.do")
	public String initHome(ModelMap model, HttpServletRequest req) throws Exception {

		return "home/home.app";
	}
	
	@GetMapping("/app/home/search_tag.do")
	public String searchTag() throws Exception {
		return "home/search_tag.app";
	}

	
	@PostMapping("/app/home/report.do")
	@ResponseBody
	public String insertReport(@RequestBody EgovMap egovMap) throws Exception {
		
		//.FIXME 신고 제한을 둬야 하는데.. 제한정의 필요함..
		if(egovMap.get("type").equals("look")) {
			egovMap.put("type", ReportType.LOOK.getType());
		} else {
			egovMap.put("type", ReportType.USER.getType());
		}
		homeService.insertReport(egovMap);
		return "";
	}
}
