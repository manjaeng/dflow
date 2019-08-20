package kr.co.thenet.fapee.look.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.look.service.LookService;

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
}
