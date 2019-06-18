package kr.co.thenet.fapee.user.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.util.ResponseUtil;
import kr.co.thenet.fapee.user.service.UserService;

@RestController
@RequestMapping("/{version}/user")
public class UserAppController {

	@Resource
	private UserService userService;

	@PostMapping("/login.do")
	public ResponseEntity<?> login(@RequestBody FP_Login login, HttpServletRequest req) throws Exception {

		login = userService.selectUserServiceLoginInfo(login, req);

		if (login.getHttpStatus().equals(HttpStatus.OK)) {
			return ResponseUtil.getResponse(login);
		} else {
			return ResponseUtil.getResponse(login.getHttpStatus());
		}

	}
}
