package kr.co.thenet.fapee.user.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/app/user/join_intro.do")
	public String joinIntro() throws Exception {
		return "user/join_intro.app";
	}
	
	@GetMapping("/app/user/join_mobileCertified.do")
	public String joinMobileCertified() throws Exception {
		return "user/join_mobileCertified.app";
	}
	
	@PostMapping("/app/user/join_mobileCertified.do")
	@ResponseBody
	public String joinMobileCertified(@RequestParam String mobile, HttpServletRequest req) throws Exception {
		
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
	public String joinMobileCertified2(@RequestParam String verification, HttpServletRequest req) throws Exception {
		
		HttpSession session = req.getSession();
		String sessionVerification = "";
		
		if(session.getAttribute("verification") != null) {
			sessionVerification = (String)session.getAttribute("verification");
			
			if(sessionVerification.equals(verification)) {
				session.removeAttribute("verification");
				return "t";
			}
		}
		
		return "f";
		
	}
	
	@GetMapping("/app/user/join_id.do")
	public String joinId() throws Exception {
		return "user/join_id.app";
	}
	
	@PostMapping("/app/user/join_id.do")
	@ResponseBody
	public String joinId(@RequestParam String userId) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("userId", userId);
		
		FP_User user = userService.selectUserInfo(egovMap);
		
		if(user == null) {
			return "ok";
		} else {
			return "exist";
		}
		
	}
	
	@GetMapping("/app/user/join_password.do")
	public String joinPassword() throws Exception {
		return "user/join_password.app";
	}
	
	@GetMapping("/app/user/join_email.do")
	public String joinEmail() throws Exception {
		return "user/join_email.app";
	}
	
	@PostMapping("/app/user/join_complete.do")
	@ResponseBody
	public String joinComplete(@RequestBody FP_User user) throws Exception {
		
		int insertCount = userService.insertUserInfo(user);
		
		if(insertCount == 1) {
			return "t";
		} else {
			return "f";
		}
	}
	
	@GetMapping("app/user/login.do")
	public String login() throws Exception {
		return "user/login.app";
	}
	
}
