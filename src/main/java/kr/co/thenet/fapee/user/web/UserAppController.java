package kr.co.thenet.fapee.user.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserAppController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/app/user/memDis.do")
	public String userMemMis() throws Exception {
		return "user/memDis.app";
	}

}
