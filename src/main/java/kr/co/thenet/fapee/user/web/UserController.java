package kr.co.thenet.fapee.user.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.model.CM_User;
import kr.co.thenet.fapee.user.service.UserService;

@Controller
public class UserController {
	
	@Resource
	private UserService userService;
 
	@GetMapping()
	public String login(ModelMap model) throws Exception {

		List<CM_User> userList = userService.selectUserServiceList();
		
		model.addAttribute("userList", userList);
		
		return "";
	}
}
