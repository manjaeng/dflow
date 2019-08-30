package kr.co.thenet.fapee.home.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.home.service.HomeService;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;

	@GetMapping("/app/home/home.do")
	public String initHome(ModelMap model, HttpServletRequest req) throws Exception {

		return "home/home.app";
	}

}
