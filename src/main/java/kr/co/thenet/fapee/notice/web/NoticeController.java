package kr.co.thenet.fapee.notice.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Resource
	private NoticeService noticeService;
	
	@GetMapping("/notice/list.do")
	public String noticeList(ModelMap model) throws Exception{
		
		List<FP_Notice> noticeList = noticeService.selectNoticeServiceAllList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "notice/list.tiles";
	}
	
	@GetMapping("/notice/add.do")
	public String noticeAdd(ModelMap model) throws Exception { 
		return "notice/add.tiles"; 
		
	}
	
	@PostMapping("/notice/add.do")
	public String noticeAdd(FP_Notice notice, HttpServletRequest req) throws Exception {

		noticeService.insertNoticeServiceInfo(notice);
		return "notice/list.tiles";
	}
	
	

}