package kr.co.thenet.fapee.common.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import kr.co.thenet.fapee.common.model.UploadFileVO;
import kr.co.thenet.fapee.common.model.UploadResultVO;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.S3Utils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/app/common")
public class UploadRestController {
	
	@Autowired
	ServletContext context;
	
	/**
	 * 제품 정보 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/file_upload.do")
	@JsonInclude(Include.NON_EMPTY)
	public Map<String, Object> fileUpload(UploadFileVO form, HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			//S3Utils 초기화
			S3Utils.init();
			
			List<MultipartFile> uploadFiles = form.getFiles();
			if(form.getFiles().size()==0) {
				if(form.getParam00() != null) uploadFiles.add(form.getParam00());
				if(form.getParam01() != null) uploadFiles.add(form.getParam01());
				if(form.getParam02() != null) uploadFiles.add(form.getParam02());
				if(form.getParam03() != null) uploadFiles.add(form.getParam03());
				if(form.getParam04() != null) uploadFiles.add(form.getParam04());
				if(form.getParam05() != null) uploadFiles.add(form.getParam05());
				if(form.getParam06() != null) uploadFiles.add(form.getParam06());
				if(form.getParam07() != null) uploadFiles.add(form.getParam07());
				if(form.getParam08() != null) uploadFiles.add(form.getParam08());
				if(form.getParam09() != null) uploadFiles.add(form.getParam09());

				if(form.getParam10() != null) uploadFiles.add(form.getParam10());
				if(form.getParam11() != null) uploadFiles.add(form.getParam11());
				if(form.getParam12() != null) uploadFiles.add(form.getParam12());
				if(form.getParam13() != null) uploadFiles.add(form.getParam13());
				if(form.getParam14() != null) uploadFiles.add(form.getParam14());
				if(form.getParam15() != null) uploadFiles.add(form.getParam15());
				if(form.getParam16() != null) uploadFiles.add(form.getParam16());
				if(form.getParam17() != null) uploadFiles.add(form.getParam17());
				if(form.getParam18() != null) uploadFiles.add(form.getParam18());
				if(form.getParam19() != null) uploadFiles.add(form.getParam19());
			}
			
			log.info("FileCount={}", uploadFiles.size());
			
			String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			String thumbnailSuffix = ".thumbnail.png";
			
			String savedFoler = null;
			String savedPath = null;
			int seq = 0;
			List<UploadResultVO> fileList = new ArrayList<UploadResultVO>();
			for(MultipartFile mfile : uploadFiles) {
				String originFileName = mfile.getOriginalFilename();
				
				//썸네일인 경우 SKIP.
				if(originFileName.endsWith(thumbnailSuffix)) continue;
				seq++;
				
			    String mimeType = new Tika().detect(mfile.getBytes());
			    boolean isVideo = (mimeType!=null && mimeType.startsWith("video"));
			    
			    savedFoler = String.format("%s/%s"
											, (isVideo)? "videos/app" : "images/app"
											, today);

			    savedPath = String.format("%s/%s.%s"
												, savedFoler
												, UUID.randomUUID().toString()
												, FilenameUtils.getExtension(originFileName));
				log.info("...{}", (isVideo)? "video" : "image");
				log.info("...{}", originFileName);
				log.info("...{}", savedPath);

				//mfile.transferTo(file);
				S3Utils.uploadFile(savedPath, mfile.getBytes(), mimeType);
				
				String viewUrl = String.format("%s%s", Constants.CDN_URL, savedPath);
				UploadResultVO uploadInfo = UploadResultVO.of(originFileName, viewUrl, ((isVideo)? "video" : "image"), mimeType, seq);
				
				if(isVideo) {
					String thumbnailName = String.format("%s%s", originFileName, thumbnailSuffix);
					MultipartFile thumbnail = uploadFiles
												.stream()
												.filter(v -> v.getOriginalFilename().equals(thumbnailName))
												.findFirst().orElse(null);
					if(thumbnail != null) {
						String thumbnailPath = String.format("%s%s", savedPath, thumbnailSuffix);
						//썸네일 업로드
					    String thumbMimeType = new Tika().detect(thumbnail.getBytes());
						S3Utils.uploadFile(thumbnailPath, thumbnail.getBytes(), thumbMimeType);
						//썸네일 경로 설정.
						uploadInfo.setThumbnailPath(String.format("%s%s", viewUrl, thumbnailSuffix));
					}
				}
			    
				fileList.add(uploadInfo);
			}
			
			result.put("result", 0);
			result.put("list", fileList);
		}
		catch(Exception e) {
			log.error("ERROR-upload...{}", e);
			result.put("result", 500);
			result.put("message", String.format("파일 처리중 오류가 발생하였습니다.(reason=%s)", e.getMessage()));
		}

		return result;
	}

}
