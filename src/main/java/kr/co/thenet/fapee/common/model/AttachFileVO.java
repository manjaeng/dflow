package kr.co.thenet.fapee.common.model;

import java.time.LocalDateTime;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachFileVO {
	private long fileKey;  //파일식별키
	private String grp;  //파일그룹
	private String logicalFileName;  //논리파일명
	private String physicalFullPath;  //파일저장경로
	private long size;  //파일크기
	private String extension;  //확장자
	private String deleteYn;  //삭제여부
	private String createId;  //생성자ID
	private LocalDateTime createDate;  //생성일시
	private String lastUpdateId;  //최종수정자ID
	private LocalDateTime lastUpdateDate;  //최종수정일시
	
	private MultipartFile mfile;
	
    public static AttachFileVO of(MultipartFile mfile, long fileKey, String grp) {
    	AttachFileVO attachVO = new AttachFileVO();
    	attachVO.setFileKey(fileKey);
    	attachVO.setGrp(grp);
    	attachVO.setLogicalFileName(mfile.getOriginalFilename());
    	attachVO.setSize(mfile.getSize());
    	attachVO.setExtension(FilenameUtils.getExtension(mfile.getOriginalFilename()));
    	attachVO.setMfile(mfile);
    	
        return attachVO;
    }
	
    public static AttachFileVO of(MultipartFile mfile, String grp) {
    	AttachFileVO attachVO = new AttachFileVO();
    	attachVO.setGrp(grp);
    	attachVO.setLogicalFileName(mfile.getOriginalFilename());
    	attachVO.setSize(mfile.getSize());
    	attachVO.setExtension(FilenameUtils.getExtension(mfile.getOriginalFilename()));
    	attachVO.setMfile(mfile);
    	
        return attachVO;
    }
	
    public static AttachFileVO of(MultipartFile mfile, long fileKey) {
    	AttachFileVO attachVO = new AttachFileVO();
    	attachVO.setFileKey(fileKey);
    	attachVO.setLogicalFileName(mfile.getOriginalFilename());
    	attachVO.setSize(mfile.getSize());
    	attachVO.setExtension(FilenameUtils.getExtension(mfile.getOriginalFilename()));
    	attachVO.setMfile(mfile);
    	
        return attachVO;
    }
	
}
