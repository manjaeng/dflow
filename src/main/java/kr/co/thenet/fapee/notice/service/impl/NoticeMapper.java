package kr.co.thenet.fapee.notice.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.FP_Notice;

@Mapper
public interface NoticeMapper {

	List<FP_Notice> selectNoticeServiceAllList() throws Exception;
	
	List<FP_Notice> selectNoticeServiceList() throws Exception;

}
