package kr.co.thenet.fapee.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Resource
	private NoticeService noticeService;
	
	@GetMapping("/notice.do")
	public String noticeList(ModelMap model) throws Exception{
		
		List<FP_Notice> noticeList = noticeService.selectNoticeServiceList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "notice/notice";
	}
}
