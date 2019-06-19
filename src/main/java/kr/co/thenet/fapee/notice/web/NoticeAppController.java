package kr.co.thenet.fapee.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.notice.service.NoticeService;

@RestController
@RequestMapping("{version}/notice")
public class NoticeAppController {

	@Resource
	private NoticeService noticeService;
	
	public List<FP_Notice> selectNoticeServiceList() throws Exception {
	
		List<FP_Notice> noticeLsit = noticeService.selectNoticeServiceList();
		
		return noticeLsit;
	}
}
