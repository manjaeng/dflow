package kr.co.thenet.fapee.user.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.user.service.UserService;

@Controller
public class UserController {

	@Resource
	private UserService userService;

	@GetMapping("/login.do")
	public String login() throws Exception {
		return "main/login";
	}

	@PostMapping("/login.do")
	@ResponseBody
	public EgovMap login(@RequestBody FP_Login login, HttpServletRequest req) throws Exception {

		EgovMap egovMap = userService.selectUserServiceAdminLogin(login, req);

		return egovMap;
	}

	@GetMapping("/user/list.do")
	public String userList(ModelMap model) throws Exception {

		List<FP_User> userList = userService.selectUserServiceList();

		model.addAttribute("userList", userList);

		return "user/list.tiles";
	}
}
