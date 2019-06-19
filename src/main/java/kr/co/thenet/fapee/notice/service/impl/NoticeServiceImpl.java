package kr.co.thenet.fapee.notice.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Resource
	private NoticeMapper noticeMapper;

	@Override
	public List<FP_Notice> selectNoticeServiceList() throws Exception {
		return noticeMapper.selectNoticeServiceList();
	}
	
}
