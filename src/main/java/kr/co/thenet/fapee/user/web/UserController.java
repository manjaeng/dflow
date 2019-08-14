package kr.co.thenet.fapee.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.ResponseUtils;
import kr.co.thenet.fapee.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/app/login.do")
	public ResponseEntity<?> login1(@RequestBody FP_Login login, HttpServletRequest req) throws Exception {

		login = userService.selectUserServiceLogin(login, req);

		if (login.getHttpStatus().equals(HttpStatus.OK)) {
			return ResponseUtils.getResponse(login);
		} else {
			return ResponseUtils.getResponse(login.getHttpStatus());
		}
	}
	
	@PostMapping("/app/join.do")
	public ResponseEntity<?> join(@RequestBody FP_User user) throws Exception {
		return ResponseUtils.getResponse(userService.insertUserServiceJoin(user));
	}

	@GetMapping("/admin/login.do")
	public String login() throws Exception {
		return "admin/home/login";
	}

	@PostMapping("/admin/login.do")
	@ResponseBody
	public EgovMap login(@RequestBody FP_Login login, HttpServletRequest req) throws Exception {

		EgovMap egovMap = userService.selectUserServiceAdminLogin(login, req);

		return egovMap;
	}

	@GetMapping("/admin/user/list.do")
	public String userList(ModelMap model) throws Exception {

		List<FP_User> userList = userService.selectUserServiceList();

		model.addAttribute("userList", userList);

		return "user/list.admin";
	}
}
