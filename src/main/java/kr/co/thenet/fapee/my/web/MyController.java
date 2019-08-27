package kr.co.thenet.fapee.my.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.thenet.fapee.my.service.MyService;

@Controller
public class MyController {

	@Autowired
	private MyService myService;
	
	@GetMapping("/app/my/profile.do")
	public String profile(@RequestParam(required=false) String id) throws Exception {
		return "my/profile.app";
	}
}
