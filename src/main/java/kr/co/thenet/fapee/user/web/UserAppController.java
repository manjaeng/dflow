package kr.co.thenet.fapee.user.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.ResponseUtils;
import kr.co.thenet.fapee.user.service.UserService;

@RestController
@RequestMapping("/rest/{version}/user")
public class UserAppController {

	@Autowired
	private UserService userService;

	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody FP_Login login, HttpServletRequest req) throws Exception {

		login = userService.selectUserServiceLogin(login, req);

		if (login.getHttpStatus().equals(HttpStatus.OK)) {
			return ResponseUtils.getResponse(login);
		} else {
			return ResponseUtils.getResponse(login.getHttpStatus());
		}
	}

	@PostMapping("/join")
	public ResponseEntity<?> join(@RequestBody FP_User user) throws Exception {
		return ResponseUtils.getResponse(userService.insertUserServiceJoin(user));
	}
}
