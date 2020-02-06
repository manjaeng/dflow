package kr.co.thenet.fapee.common.model;

import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UploadFileVO {
	private int seq;
	private String type;
	private String fileName;
	private String savedPath;
	private boolean isThumbnail;
	private String thumbnailPath;
	
	private List<MultipartFile> files;

    public static UploadFileVO of(String fileName, String savedPath, String type) {
    	UploadFileVO fileItem = new UploadFileVO();
    	fileItem.setFileName(fileName);
    	fileItem.setSavedPath(savedPath);
    	fileItem.setType(type);
    	
        return fileItem;
    }

}
