package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UploadResultVO {
	private int seq;
	private String type;
	private String mimeType;
	private String fileName;
	private String savedPath;
	private String thumbnailPath;

    public static UploadResultVO of(String fileName, String savedPath, String type, String mimeType, int seq) {
    	UploadResultVO fileItem = new UploadResultVO();
    	fileItem.setFileName(fileName);
    	fileItem.setSavedPath(savedPath);
    	fileItem.setType(type);
    	fileItem.setMimeType(mimeType);
    	fileItem.setSeq(seq);
    	
        return fileItem;
    }

}
