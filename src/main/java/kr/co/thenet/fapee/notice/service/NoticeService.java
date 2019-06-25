package kr.co.thenet.fapee.notice.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.FP_Notice;

public interface NoticeService {

	List<FP_Notice> selectNoticeServiceAllList() throws Exception;
	
	List<FP_Notice> selectNoticeServiceList(int pageStart) throws Exception;

	int insertNoticeServiceInfo(FP_Notice notice) throws Exception;
	
	FP_Notice selectNoticeServiceInfo(int num) throws Exception;

	void updateNoticeServiceViewCountInfo(int num);

	int updateNoticeServiceInfo(FP_Notice notice) throws Exception;
	
	int deleteNoticeServiceInfo(int idKey) throws Exception;

}
