package kr.co.thenet.fapee.my.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.setting.service.ReviewService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NotificationController {

	@Autowired
	private ReviewService reviewService;
	
	//쇼핑 내역.
	@GetMapping("/app/my/alim.do")
	public String alim() throws Exception {
		return "my/alim.app";
	}

}
