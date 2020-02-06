package kr.co.thenet.fapee.common.web;

import java.io.File;
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
		
		log.info("FileCount={}", form.getFiles().size());
		
		try {
			String basePath = context.getRealPath("/").replaceAll("\\\\", "/");
			String uploadPath = String.format("/upload-files/%s", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")));
			
			String savedPath = null;
			List<UploadFileVO> fileList = new ArrayList<UploadFileVO>();
			for(MultipartFile mfile : form.getFiles()) {
				savedPath = String.format("%s/%s.%s"
												, uploadPath
												, UUID.randomUUID().toString()
												, FilenameUtils.getExtension(mfile.getOriginalFilename()));
				String fileFullPath = String.format("%s%s", basePath, savedPath).replaceAll("//", "/");
				
			    String mimeType = new Tika().detect(mfile.getBytes());
			    String contentType = (mimeType!=null && mimeType.startsWith("video"))? "video" : "image";

				log.info("...{}", contentType);
				log.info("...{}", mfile.getOriginalFilename());
				log.info("...{}", savedPath);
				log.info("...{}", fileFullPath);
				
				File file = new File(fileFullPath);
				//오늘 날짜 폴더가 없는 경우 생성.
				if( !file.getParentFile().exists() ) {
					file.getParentFile().mkdirs();
				}
				mfile.transferTo(file);
			    
				fileList.add(UploadFileVO.of(mfile.getOriginalFilename(), savedPath, contentType));
			}

			//비디오 파일들에 대해 썸네일 이미지를 찾아서 설정.
			fileList.stream()
				.filter(item -> "video".equals(item.getType()))
				.forEach(video -> {
					String videoName = FilenameUtils.getBaseName(video.getFileName());
					UploadFileVO thumbnail = fileList.stream().filter(thumb -> {
						String thumbName = String.format("%s.png", videoName);	//비디오명에 png를 붙여 썸네일을 찾는다.
						return thumbName.equals(thumb.getFileName());
					}).findFirst().orElse(null);
					
					//썸네일인 경우 해당 경로를 비디오의 썸네일 경로에 설정한다.
					if(thumbnail != null) {
						thumbnail.setThumbnail(true);
						video.setThumbnailPath(thumbnail.getSavedPath());
					}
				});
			
			//최종 목록 계산.
			List<UploadFileVO> finalList = new ArrayList<UploadFileVO>();
			int i = 0;
			for(UploadFileVO item : fileList) {
				if(item.isThumbnail()) continue;
				i++;
				item.setSeq(i);
				finalList.add(item);
			}
			
			result.put("result", 0);
			result.put("list", finalList);
		}
		catch(Exception e) {
			log.error("ERROR-upload...{}", e);
			result.put("result", 500);
			result.put("message", "파일 처리중 오류가 발생하였습니다.");
		}

		return result;
	}

}
