package kr.co.thenet.fapee.look.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.look.service.LookService;

@Controller
public class LookController {

	@Resource
	private LookService lookService;
	
	@GetMapping("/app/look/look.do")
	public String look() throws Exception {
		
		return "look/look.app";
	}
	
	@GetMapping("/admin/look/list.do")
	public String lookList() throws Exception {
		
		return "look/list.admin";
	}
}
