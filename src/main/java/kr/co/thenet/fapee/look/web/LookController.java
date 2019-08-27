package kr.co.thenet.fapee.look.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.FileUtils;
import kr.co.thenet.fapee.look.service.LookService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LookController {

	@Autowired
	private LookService lookService;
	
	@GetMapping("/app/look/look.do")
	public String look() throws Exception {
		
		return "look/look.app";
	}
	
	@GetMapping("/app/look/look_upload.do")
	public String lookUpload() throws Exception {
		
		return "look/look_upload.app";
	}
	
	@GetMapping("/app/look/look_cate.do")
	public String lookCate(ModelMap model) throws Exception {
		
		List<EgovMap> lookStyleList = lookService.selectLookStyleList();
		model.addAttribute("lookStyleList", lookStyleList);
		
		return "look/look_cate.app";
	}
	
	@GetMapping("/admin/look/list.do")
	public String lookList() throws Exception {
		
		return "look/list.admin";
	}
	
	@GetMapping("/admin/look/add.do")
	public String lookAdd() throws Exception {
		return "look/add.admin";
	}
	
	@PostMapping("/admin/look/add.do")
	public String lookAdd(@RequestParam("pro-image") List<MultipartFile> multipartFiles, HttpServletRequest request, ModelMap model) throws Exception {
		
		//TODO: 업로드 성공, "ex) 디렉토리형식 업로드도 가능(/images/ab/ab/)"
//		S3Utils.init();
//		S3Utils.uploadFile("1.png", FileUtils.MultipartToFile(file));

		FileUtils.uploadFiles(multipartFiles);
		
		return "look/add.admin";
	}
}
