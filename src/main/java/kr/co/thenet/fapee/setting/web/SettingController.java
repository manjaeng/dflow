package kr.co.thenet.fapee.setting.web;

import java.util.List;

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
import kr.co.thenet.fapee.notice.service.NoticeService;
import kr.co.thenet.fapee.setting.service.SettingService;

@Controller
public class SettingController {

	@Autowired
	private SettingService settingService;
	
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/app/setting/setting.do")
	public String setting() throws Exception {
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
	
	@GetMapping("/admin/setting/list.do")
	public String list() throws Exception {
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
}
