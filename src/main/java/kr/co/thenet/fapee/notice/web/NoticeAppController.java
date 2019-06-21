package kr.co.thenet.fapee.notice.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.notice.service.NoticeService;

@RestController
@RequestMapping("/rest/{version}/notice")
public class NoticeAppController {

	@Resource
	private NoticeService noticeService;
	
	@PostMapping("/list/{pageStart}")
	public List<FP_Notice> selectNoticeServiceList() throws Exception {
	
		List<FP_Notice> noticeLsit = noticeService.selectNoticeServiceList();
	
		return noticeLsit;
	}
}
