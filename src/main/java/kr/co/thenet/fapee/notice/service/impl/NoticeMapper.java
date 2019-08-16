package kr.co.thenet.fapee.notice.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.FP_Notice;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface NoticeMapper {

	List<FP_Notice> selectNoticeServiceAllList() throws Exception;
	
	List<EgovMap> selectNoticeServiceList(EgovMap egovMap) throws Exception;

	int insertNoticeServiceInfo(FP_Notice notice) throws Exception;

	FP_Notice selectNoticeServiceInfo(int num) throws Exception;

	void updateNoticeServiceViewCountInfo(int num);
	
	int updateNoticeServiceInfo(FP_Notice notice) throws Exception;
	
	int deleteNoticeServiceInfo(int idKey) throws Exception;

}
