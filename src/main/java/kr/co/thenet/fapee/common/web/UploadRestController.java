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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.thenet.fapee.common.model.RestResultVO;
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
	public Map<String, Object> fileUpload(UploadFileVO form, HttpSession session) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		
		log.info("FileCount={}", form.getFiles().size());
		
		try {
			String basePath = context.getRealPath("/").replaceAll("\\\\", "/");
			String uploadPath = String.format("/upload-files/%s", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")));
			
			String savedPath = null;
			int cnt = 0;
			List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
			Map<String, Object> fileMap = null;
			for(MultipartFile mfile : form.getFiles()) {
				fileMap = new HashMap<String, Object>();
				cnt++;
				savedPath = String.format("%s/%s.%s"
												, uploadPath
												, UUID.randomUUID().toString()
												, FilenameUtils.getExtension(mfile.getOriginalFilename()));
				String fileFullPath = String.format("%s%s", basePath, savedPath).replaceAll("//", "/");
				
				log.info("...{}", mfile.getContentType());
				log.info("...{}", mfile.getOriginalFilename());
				log.info("...{}", savedPath);
				log.info("...{}", fileFullPath);
				
				File file = new File(fileFullPath);
				//오늘 날짜 폴더가 없는 경우 생성.
				if( !file.getParentFile().exists() ) {
					file.getParentFile().mkdirs();
				}
				mfile.transferTo(file);
				
				fileMap.put("seq", cnt);
				fileMap.put("fileName", mfile.getOriginalFilename());
				fileMap.put("savedPath", savedPath);
				fileList.add(fileMap);
			}
			
			result.put("result", 0);
			result.put("list", fileList);
		}
		catch(Exception e) {
			log.error("ERROR-upload...{}", e);
			result.put("result", 500);
			result.put("message", "파일 처리중 오류가 발생하였습니다.");
		}

		return result;
	}

}
