package kr.co.thenet.fapee.home.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.AttachFileVO;

public interface AttachService {

	List<AttachFileVO> selectAttachList(String grp) throws Exception;

	AttachFileVO selectAttachInfo(long fileKey) throws Exception;

	AttachFileVO selectAttachInfoByGrp(String grp) throws Exception;

	int saveAttachFile(AttachFileVO form) throws Exception;

	int saveAttachFileByGrp(AttachFileVO form) throws Exception;

	int saveImageFileByGrp(AttachFileVO form) throws Exception;	//TO S3 Bucket.

	int deleteAttachFile(long fileKey) throws Exception;

	int deleteAttachFile(String grp) throws Exception;

	String saveBizLicenseEmg(AttachFileVO form) throws Exception;	//TO S3 Bucket.

}
