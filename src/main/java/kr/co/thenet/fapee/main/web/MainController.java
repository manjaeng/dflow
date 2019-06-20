package kr.co.thenet.fapee.main.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.main.service.MainService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MainController {

	@Resource
	private MainService mainService;

	@RequestMapping("/main.do")
	public String initMain(ModelMap model, HttpServletRequest req) throws Exception {

		log.info(CommonUtils.getRemoteIP(req));

		Cookie[] cookies = req.getCookies();

		if (cookies != null) {
			log.info("cookies length : " + cookies.length);

			for (Cookie c : cookies) {
				log.info(c.getName() + " : " + c.getValue());
			}
		}

		List<HashMap<String, Object>> mainList = mainService.selectMainServiceUserList();

		model.addAttribute("mainList", mainList);

		return "main/main";
	}

}
