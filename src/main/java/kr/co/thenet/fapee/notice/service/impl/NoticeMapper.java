package kr.co.thenet.fapee.notice.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.NoticeVO;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface NoticeMapper {

	List<NoticeVO> selectNoticeServiceAllList() throws Exception;
	
	List<EgovMap> selectNoticeServiceList(EgovMap egovMap) throws Exception;

	int insertNoticeServiceInfo(NoticeVO notice) throws Exception;

	NoticeVO selectNoticeServiceInfo(int num) throws Exception;

	void updateNoticeServiceViewCountInfo(int num);
	
	int updateNoticeServiceInfo(NoticeVO notice) throws Exception;
	
	int deleteNoticeServiceInfo(int idKey) throws Exception;

}
