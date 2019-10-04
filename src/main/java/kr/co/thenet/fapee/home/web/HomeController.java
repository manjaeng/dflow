package kr.co.thenet.fapee.home.web;

import java.util.List;

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
import kr.co.thenet.fapee.common.util.Constants;
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
	
	@GetMapping("/app/home/search_result_div.do")
	public String searchResultDiv() throws Exception {
		return "app/home/search_result_div";
	}
	
	@PostMapping("/app/home/searchList.do")
	@ResponseBody
	public EgovMap searchList(@RequestBody EgovMap egovMap,HttpServletRequest req) throws Exception {
		
		int pageStart = (int)egovMap.get("pageStart");
		String type = (String) egovMap.get("type");
		
		egovMap.put("pageStart", pageStart * Constants.APP_SEARCH_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_SEARCH_PAGE_SIZE);
		
		if ("look".equals(type)) {
			egovMap.put("type","look");
		} else if ("acct".equals(type)) {
			egovMap.put("type","acct");
		}
		
		List<EgovMap> searchList = homeService.selectHomeSearchList(egovMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("searchList", searchList);
		
		return resultMap;
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
