package kr.co.thenet.fapee.home.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.home.service.HomeService;
//import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@Resource
	private HomeService homeService;

	@RequestMapping("/home.do")
	public String initHome(ModelMap model, HttpServletRequest req) throws Exception {

		log.info(CommonUtils.getRemoteIP(req));

		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			log.info("cookies length : " + cookies.length);

			for (Cookie c : cookies) {
				log.info(c.getName() + " : " + c.getValue());
			}
		}
		
		List<HashMap<String, Object>> homeList = homeService.selectHomeUserList();

		model.addAttribute("homeList", homeList);

		return "home/home";
	}

}
