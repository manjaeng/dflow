package kr.co.thenet.fapee.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.user.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {
	
	@Resource
	private UserService userService;
 
	@GetMapping("/login.do")
	public String login() throws Exception {
		return "main/login";
	}
	
	@GetMapping("/user/list.do")
	public String userList(ModelMap model) throws Exception {

		List<FP_User> userList = userService.selectUserServiceList();
		
		model.addAttribute("userList", userList);
		
		return "user/userList.tiles";
	}
}
