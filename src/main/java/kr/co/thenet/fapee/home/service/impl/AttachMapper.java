package kr.co.thenet.fapee.home.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.AttachFileVO;

@Mapper
public interface AttachMapper {

	List<AttachFileVO> selectAttachList(String grp) throws Exception;

	AttachFileVO selectAttachInfo(long fileKey) throws Exception;

	AttachFileVO selectAttachInfoByGrp(String grp) throws Exception;

	int insertAttachFile(AttachFileVO form) throws Exception;

	int updateAttachFile(AttachFileVO form) throws Exception;

	int updateAttachFileByGrp(AttachFileVO form) throws Exception;

	int deleteAttachFile(AttachFileVO form) throws Exception;

	int deleteAttachFileByGrp(AttachFileVO form) throws Exception;
	
}
