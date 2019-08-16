package kr.co.thenet.fapee.notice.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.notice.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/admin/notice/list.do")
	public String noticeList(ModelMap model) throws Exception{
		
		List<FP_Notice> noticeList = noticeService.selectNoticeServiceAllList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "notice/list.admin";
	}
	
	@GetMapping("/admin/notice/add.do")
	public String noticeAdd(ModelMap model) throws Exception { 
		return "notice/add.admin"; 
		
	}
	
	@PostMapping("/admin/notice/add.do")
	public String noticeAdd(FP_Notice notice, HttpServletRequest req) throws Exception {
		
		noticeService.insertNoticeServiceInfo(notice);
		
		return "redirect:/admin/notice/list.do";
	}
	
	@GetMapping(value = "/admin/notice/modify.do")
	public String noticeDetail(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model) throws Exception {

		FP_Notice noticeInfo = noticeService.selectNoticeServiceInfo(num);
		noticeService.updateNoticeServiceViewCountInfo(num);

		model.addAttribute("noticeInfo", noticeInfo);

		return "notice/modify.admin";
	}
	
	@PostMapping("/notice/modify.do")
	public String noticeModify(FP_Notice notice, HttpServletRequest req) throws Exception {
		
		noticeService.updateNoticeServiceInfo(notice);
		
		return "redirect:/admin/notice/list.do";
	}
	
	@GetMapping("/admin/notice/delete.do")
    public String noticeDelete(@RequestParam int idKey) throws Exception{
        
        noticeService.deleteNoticeServiceInfo(idKey);
        
        return "redirect:/notice/list.do";
    }
	

}