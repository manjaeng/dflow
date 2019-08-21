package kr.co.thenet.fapee.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.ResponseUtils;
import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/app/user/join_intro.do")
	public String intro() throws Exception {
		return "user/join_intro.app";
	}
	
	@GetMapping("/app/user/join_mobileCertified.do")
	public String join_mobileCertified() throws Exception {
		return "user/join_mobileCertified.app";
	}
	
	@PostMapping("/app/user/join_mobileCertified.do")
	@ResponseBody
	public String mobileCertified(@RequestParam String mobile, HttpServletRequest req) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("mobile", mobile);
		
		FP_User user = userService.selectUserInfo(egovMap);
		
		if(user == null) {
			
			HttpSession session = req.getSession();
			String randomNum = CommonUtils.getRandomNum(6);
			
			session.setAttribute("verification", randomNum);
			
			log.info("moblile : " + mobile);
			log.info("randomNum : " + randomNum);
			
			return "send";
		} else {
			return "exist";
		}
		
	}
	
	@PostMapping("/app/user/join_mobileCertified2.do")
	@ResponseBody
	public String mobileCertified2(@RequestParam String verification, HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		String sessionVerification = "";
		
		if(session.getAttribute("verification") != null) {
			sessionVerification = (String)session.getAttribute("verification");
			
			if(sessionVerification.equals(verification)) {
				return "t";
			}
		}
		
		return "f";
		
	}
	
	@GetMapping("/app/user/join_id.do")
	public String join_id() throws Exception {
		return "user/join_id.app";
	}
	
	@GetMapping("/app/user/join_password.do")
	public String join_password() throws Exception {
		return "user/join_password.app";
	}
	
	@GetMapping("/app/user/join_email.do")
	public String join_email() throws Exception {
		return "user/join_email.app";
	}
	
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
