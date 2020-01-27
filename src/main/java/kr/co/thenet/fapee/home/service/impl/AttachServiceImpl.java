package kr.co.thenet.fapee.home.service.impl;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.thenet.fapee.common.model.AttachFileVO;
import kr.co.thenet.fapee.common.util.S3Utils;
import kr.co.thenet.fapee.home.service.AttachService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttachServiceImpl implements AttachService {
	
	@Autowired
	private AttachMapper mapper;
	
	@Autowired
	private HttpSession session;


	private static final String ATTACH_BASE_PATH ="/usr/local/tomcat9-2/upload";


	private static final  String S3_URL ="https://s3thenet.s3.ap-northeast-2.amazonaws.com";

	@Override
	public List<AttachFileVO> selectAttachList(String grp) throws Exception {
		return mapper.selectAttachList(grp);
	}

	@Override
	public AttachFileVO selectAttachInfo(long fileKey) throws Exception {
		return mapper.selectAttachInfo(fileKey);
	}

	@Override
	public AttachFileVO selectAttachInfoByGrp(String grp) throws Exception {
		return mapper.selectAttachInfoByGrp(grp);
	}

	@Override
	public int saveAttachFile(AttachFileVO form) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		if(form.getFileKey() > 0) {
			return mapper.updateAttachFile(form);
		}
		else {
			return mapper.insertAttachFile(form);
		}
	}

	//일반 첨부파일 저장.
	@Override
	public int saveAttachFileByGrp(AttachFileVO form) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		AttachFileVO attach = mapper.selectAttachInfoByGrp(form.getGrp());
		
		MultipartFile mfile = form.getMfile();
		LocalDateTime today = LocalDateTime.now();
		String destPath = String.format("/%s/%s%s.%s"
								, today.format(DateTimeFormatter.ofPattern("yyyyMM"))
								, today.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"))
								, UUID.randomUUID().toString().replaceAll("-", "").substring(0,10)
								, form.getExtension()
							);
		//파일저장
		File destFile = new File(String.format("%s%s", ATTACH_BASE_PATH, destPath));
		//없는 경로는 자동 생성.
		destFile.getParentFile().mkdirs();
		
		mfile.transferTo(destFile);
		form.setPhysicalFullPath(destPath);
		
		if(attach != null) {
			//기존 파일 삭제.
			String fullPath = String.format("%s%s", ATTACH_BASE_PATH, attach.getPhysicalFullPath());
			File file = new File(fullPath);
			if(file.exists()) {
				try { file.delete(); } catch(Exception e) { }
			}
			
			int iAffected = mapper.updateAttachFileByGrp(form);
			if(iAffected==0) {
				iAffected = mapper.insertAttachFile(form);
			}
			return iAffected;
		}
		else {
			return mapper.insertAttachFile(form);
		}
	}

	//S3에 이미지 저장.
	@Override
	public int saveImageFileByGrp(AttachFileVO form) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		AttachFileVO attach = mapper.selectAttachInfoByGrp(form.getGrp());
		
		MultipartFile mfile = form.getMfile();
		LocalDateTime today = LocalDateTime.now();
		String destPath = String.format("%s/%s%s.%s"
								, today.format(DateTimeFormatter.ofPattern("yyyyMM"))
								, today.format(DateTimeFormatter.ofPattern("yyyyMMddHHmmss"))
								, UUID.randomUUID().toString().replaceAll("-", "").substring(0,10)
								, form.getExtension()
							);
		//S3에 이미지 저장.
		if(S3Utils.s3Client==null) S3Utils.init();
		S3Utils.uploadFile(destPath, mfile.getBytes());
		//이미지 경로.
		form.setPhysicalFullPath(String.format("%s/%s", S3_URL, destPath));
		
		if(attach != null) {
			int iAffected = mapper.updateAttachFileByGrp(form);
			if(iAffected==0) {
				iAffected = mapper.insertAttachFile(form);
			}
			return iAffected;
		}
		else {
			return mapper.insertAttachFile(form);
		}
	}

	@Override
	public int deleteAttachFile(long fileKey) throws Exception {
		AttachFileVO form = new AttachFileVO();
		form.setFileKey(fileKey);
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));

		return mapper.deleteAttachFile(form);
	}

	@Override
	public int deleteAttachFile(String grp) throws Exception {
		AttachFileVO form = new AttachFileVO();
		form.setGrp(grp);
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));

		return mapper.deleteAttachFileByGrp(form);
	}

}
