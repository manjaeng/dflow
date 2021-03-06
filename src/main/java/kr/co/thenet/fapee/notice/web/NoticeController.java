package kr.co.thenet.fapee.notice.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.thenet.fapee.common.model.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/admin/notice/list.do")
	public String noticeList(ModelMap model) throws Exception{
		
		List<NoticeVO> noticeList = noticeService.selectNoticeServiceAllList();
		
		model.addAttribute("noticeList", noticeList);
		
		return "notice/list.admin";
	}
	
	@GetMapping("/admin/notice/add.do")
	public String noticeAdd(ModelMap model) throws Exception { 
		return "notice/add.admin"; 
		
	}
	
	@PostMapping("/admin/notice/add.do")
	public String noticeAdd(NoticeVO notice, HttpServletRequest req) throws Exception {
		
		noticeService.insertNoticeServiceInfo(notice);
		
		return "redirect:/admin/notice/list.do";
	}
	
	@GetMapping(value = "/admin/notice/modify.do")
	public String noticeDetail(@RequestParam(defaultValue = "1", required = false) int num, ModelMap model) throws Exception {

		NoticeVO noticeInfo = noticeService.selectNoticeServiceInfo(num);
		//noticeService.updateNoticeServiceViewCountInfo(num);

		model.addAttribute("noticeInfo", noticeInfo);

		return "notice/modify.admin";
	}
	
	@PostMapping("/admin/notice/modify.do")
	public String noticeModify(NoticeVO notice, HttpServletRequest req) throws Exception {
		
		noticeService.updateNoticeServiceInfo(notice);
		
		return "redirect:/admin/notice/list.do";
	}
	
	@GetMapping("/admin/notice/delete.do")
    public String noticeDelete(@RequestParam int idKey) throws Exception{
        
        noticeService.deleteNoticeServiceInfo(idKey);
        
        return "redirect:/admin/notice/list.do";
    }
	

}