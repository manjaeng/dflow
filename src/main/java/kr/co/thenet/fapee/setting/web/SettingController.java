package kr.co.thenet.fapee.setting.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.intro.service.IntroService;
import kr.co.thenet.fapee.notice.service.NoticeService;
import kr.co.thenet.fapee.setting.service.SettingService;
import kr.co.thenet.fapee.user.service.UserService;

@Controller
public class SettingController {

	@Autowired
	private SettingService settingService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private IntroService introService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/app/setting/setting.do")
	public String setting(ModelMap model) throws Exception {
		model.addAttribute("currentAppVersion", "1.0.2");
		return "setting/setting.app";
	}
	
	@GetMapping("/app/setting/qna.do")
	public String qna() throws Exception {
		return "setting/qna.app";
	}
	
	@PostMapping("/app/setting/qna.do")
	@ResponseBody
	public String qna(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {
		
		if (SessionUtils.isLogin(req)) {
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			egovMap.put("userIdKey", sessionVO.getIdKey());
			return settingService.insertSettingQnaInfo(egovMap);
		}
		
		return "f";
		
	}
	
	@GetMapping("/app/setting/notice.do")
	public String notice() throws Exception {
		return "setting/notice.app";
	}
	
	@PostMapping("/app/setting/notice.do")
	@ResponseBody
	public List<EgovMap> notice(@RequestParam int pageStart) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("pageStart", pageStart * Constants.APP_NOTICE_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_NOTICE_PAGE_SIZE);
		
		return noticeService.selectNoticeServiceList(egovMap);
	}
	
	@GetMapping("/app/setting/password_change.do")
	public String passwordChange() throws Exception {
		return "setting/password_change.app";
	}
	
	@PostMapping("/app/setting/password_change.do")
	@ResponseBody
	public String passwordChange(@RequestBody EgovMap map, HttpServletRequest req) throws Exception {
		
		if (SessionUtils.isLogin(req)) {
			
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			map.put("idKey", sessionVO.getIdKey());
			
			return userService.updateUserLoginInfo(map);
		} else {
			return "noSession";
		}
		
	}
	
	@GetMapping("/app/setting/app_version.do")
	public String appVersion(ModelMap model) throws Exception {
		model.addAttribute("currentAppVersion", "1.0.2");
		return "setting/app_version.app";
	}
	
	@GetMapping("/admin/setting/list.do")
	public String settingList(ModelMap model) throws Exception {
		
		List<EgovMap> settingInfo = settingService.selectSettingInfo();
		List<EgovMap> styleList = introService.selectIntroStyleList();
		
		model.addAttribute("styleList", styleList);
		
		for(int i = 0; i < settingInfo.size(); ++i) {
			EgovMap record  = (EgovMap) settingInfo.get(i);
			if(Constants.HashTag.equals(record.get("code"))) {
				model.addAttribute("hashtag", record.get("data"));
			}
		}
		
		return "setting/list.admin";
	}
	
	@GetMapping("/admin/qna/list.do")
	public String qnaList(ModelMap model) throws Exception {
		
		List<EgovMap> qnaList = settingService.selectQnaServiceAllList();
		
		model.addAttribute("qnaList",qnaList);
		
		return "qna/list.admin";
	}
	@PostMapping("/admin/qna/answer.do")
	public String qnaAnswer(@RequestParam(value="idKey", required=false, defaultValue="0") int idKey, 
												@RequestParam(value="answerContent", required=false, defaultValue="") String answerContent ) throws Exception {
		
		EgovMap answerMap = new EgovMap();
		answerMap.put("idKey", idKey);
		answerMap.put("answerContent", answerContent);
		
		settingService.updateQnaServiceInfo(answerMap);
		
		return "redirect:/admin/qna/list.do";
	}
	
	@GetMapping("/admin/qna/answer.do")
	public String qnaAnswer(@RequestParam(value="num", required=false, defaultValue="0") int idKey, ModelMap model) throws Exception {
		
		EgovMap qnaAnswer = settingService.selectQnaServiceInfo(idKey);
		
		model.addAttribute("qnaAnswer", qnaAnswer);
		
		return "qna/answer.admin";
	}
	
	@PostMapping("/admin/setting/style.do")
	public String settingStyle(@RequestBody Map<String, Object> params, HttpServletRequest req) throws Exception {
		
		return "redirect:/admin/setting/list.do";
	}
}
