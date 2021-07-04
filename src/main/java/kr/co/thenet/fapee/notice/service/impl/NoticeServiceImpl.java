package kr.co.thenet.fapee.notice.service.impl;

import java.util.List;

import kr.co.thenet.fapee.notice.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.NoticeVO;
import kr.co.thenet.fapee.common.util.EgovMap;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeVO> selectNoticeServiceAllList() throws Exception {
		return noticeMapper.selectNoticeServiceAllList();
	}

	@Override
	public List<EgovMap> selectNoticeServiceList(EgovMap egovMap) throws Exception {
		return noticeMapper.selectNoticeServiceList(egovMap);
	}

	@Override
	public int insertNoticeServiceInfo(NoticeVO notice) throws Exception {
		return noticeMapper.insertNoticeServiceInfo(notice);
		
	}
	
	@Override
	public NoticeVO selectNoticeServiceInfo(int num) throws Exception {
		return noticeMapper.selectNoticeServiceInfo(num);
	}

	@Override
	public void updateNoticeServiceViewCountInfo(int num) {
		noticeMapper.updateNoticeServiceViewCountInfo(num);
	}

	@Override
	public int updateNoticeServiceInfo(NoticeVO notice) throws Exception {
		return noticeMapper.insertNoticeServiceInfo(notice);
	}
	
	@Override
    public int deleteNoticeServiceInfo(int idKey) throws Exception{
        return noticeMapper.deleteNoticeServiceInfo(idKey);
    }
	
}