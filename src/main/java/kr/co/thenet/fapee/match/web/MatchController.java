package kr.co.thenet.fapee.match.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.MatchVO;
import kr.co.thenet.fapee.common.util.Base64;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.FileUtils;
import kr.co.thenet.fapee.common.util.S3Utils;
import kr.co.thenet.fapee.match.service.MatchService;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchService;
	
	@GetMapping("/app/match/match.do")
	public String match() throws Exception {
		
		return "match/match.app";
	}
	
	@GetMapping("/app/match/match_upload.do")
	public String matchUpload() throws Exception {
		
		return "match/match_upload.app";
	}
	
	@GetMapping("/app/match/match_cate.do")
	public String matchCate(ModelMap model) throws Exception {
		
		List<EgovMap> matchStyleList = matchService.selectMatchStyleList();
		model.addAttribute("matchStyleList", matchStyleList);
		
		return "match/match_cate.app";
	}
	
	@GetMapping("/admin/match/list.do")
	public String matchList(ModelMap model) throws Exception {
		
		List<EgovMap> matchList = matchService.selectMatchAllList();
		model.addAttribute("matchList", matchList);
		
		return "match/list.admin";
	}
	
	@GetMapping("/admin/match/list2.do")
	public String matchList2(ModelMap model) throws Exception {
		
		List<EgovMap> matchList = matchService.selectMatchAllList();
		model.addAttribute("matchList", matchList);
		
		return "match/list2.admin";
	}
	
	
	@GetMapping("/admin/match/add.do")
	public String matchAdd(ModelMap model) throws Exception {
		
		List<EgovMap> matchStyleList = matchService.selectMatchStyleList();
		model.addAttribute("matchStyleList", matchStyleList);
		
		return "match/add.admin";
	}

	@PostMapping("/app/match/regist.do")
	@ResponseBody
	public String matchRegist(@RequestBody MatchVO match, HttpServletRequest req) throws Exception {
		
		String pathPrefix = "images/";
		List<String> images = null;
		
		
		
		matchService.insertMatch(match);
		
		return "";
	}
	
    @PostMapping("/admin/match/updateInfo.do")
    @ResponseBody
    public String matchUpdateInfo(@RequestBody EgovMap matchInfoMap) throws Exception {
        
        matchService.updateMatchInfo(matchInfoMap);
        
        return "match/list.admin";
    }
    
    @GetMapping("/admin/match/modify.do")
    public String matchDetail(int idKey, ModelMap model) throws Exception {
    	
    	EgovMap matchDetail = matchService.selectMatchDetail(idKey);
    	
    	return "match/modify.admin";
    }
}
