package kr.co.thenet.fapee.home.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.ReportType;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.home.service.HomeService;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@GetMapping("/app/home/home.do")
	public String initHome(ModelMap model, HttpServletRequest req) throws Exception {
		EgovMap egovMap = new EgovMap();
		egovMap.put("userIdKey", SessionUtils.getIdKey());
		
		//최적 컨텐츠.
		List<EgovMap> fitLookList = new ArrayList<EgovMap>();
		
		//로그인한 사용자만(자신의 사이즈를 등록한 경우)
		//if(SessionUtils.isLogin(req)) {
			fitLookList = homeService.selectLookListByFit(egovMap);
			//이미지 경로 설정.
			for(EgovMap map : fitLookList) {
				String imageUrl = (String) map.get("imageUrl");
				if( !StringUtils.isEmpty(imageUrl) && !imageUrl.startsWith("http")) {
					map.put("imageUrl", String.format("%s%s", Constants.CDN_URL, imageUrl));
				}
			}
		//}
			
		model.addAttribute("fitLookList", fitLookList);
		
		//연관 컨텐츠.
		List<EgovMap> maybeLookList = homeService.selectLookListByMaybe(egovMap);
		//이미지 경로 설정.
		for(EgovMap map : maybeLookList) {
			String imageUrl = (String) map.get("imageUrl");
			if( !StringUtils.isEmpty(imageUrl) && !imageUrl.startsWith("http")) {
				map.put("imageUrl", String.format("%s%s", Constants.CDN_URL, imageUrl));
			}
		}
		model.addAttribute("maybeLookList", maybeLookList);
		
		//태그 및 룩 목록.
		EgovMap recentTag = homeService.selectRecentTag();
		List<EgovMap> tagLookList = homeService.selectLookListByRecentTag(recentTag);
		//이미지 경로 설정.
		for(EgovMap map : tagLookList) {
			String imageUrl = (String) map.get("imageUrl");
			if( !StringUtils.isEmpty(imageUrl) && !imageUrl.startsWith("http")) {
				map.put("imageUrl", String.format("%s%s", Constants.CDN_URL, imageUrl));
			}
		}
		model.addAttribute("recentTag", recentTag);
		model.addAttribute("tagLookList", tagLookList);
		
		return "home/home.app";
	}
	@GetMapping("/app/home/about.do")
	public String aboutHome(ModelMap model, HttpServletRequest req) throws Exception {
		return "home/about.app";
	}


	@GetMapping("/app/home/search_tag.do")
	public String searchTag() throws Exception {
		return "home/search_tag.app";
	}

	@GetMapping("/app/home/version.do")
	@ResponseBody
	public String appVsesionSelect() throws Exception {
		 Map<String,String> appversion =  homeService.selectVersion();
		 return new ObjectMapper().writeValueAsString(appversion);
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
		
		//.FIXME 신고 제한을 둬야 하는데.. 제한 정의 필요함..
		if(egovMap.get("type").equals("look")) {
			egovMap.put("type", ReportType.LOOK.getType());
		} else {
			egovMap.put("type", ReportType.USER.getType());
		}
		homeService.insertReport(egovMap);
		return "";
	}
	
	@GetMapping("/admin/report/list.do")
	public String reportList(@RequestParam(defaultValue = "0", required = false)  int reportType, ModelMap model) throws Exception {
		
		List<EgovMap> reportList = homeService.selectReportList(reportType);
		model.addAttribute("reportList", reportList);
		return "report/list.admin";
	}
}
