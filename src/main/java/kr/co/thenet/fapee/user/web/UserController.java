package kr.co.thenet.fapee.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.SessionUtils;
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
		
		UserVO user = userService.selectUserInfo(egovMap);
		
		if(user == null) {
			
			String randomNum = CommonUtils.getRandomNum(6);
			
			SessionUtils.setData(req, "verification", randomNum);
			
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
		
		if(!SessionUtils.isEmpty(req, "verification") && SessionUtils.getData(req, "verification").equals(verification)) {
			SessionUtils.removeData(req, "verification");
			return "t";
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
		
		UserVO user = userService.selectUserInfo(egovMap);
		
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
	public String joinComplete(@RequestBody UserVO user, HttpServletRequest req) throws Exception {
		
		int insertCount = userService.insertUserInfo(user);
		
		if (insertCount == 1) {
			
			SessionVO sessionVO = new SessionVO();
			sessionVO.setIdKey(user.getIdKey());
			sessionVO.setUserId(user.getUserId());
			sessionVO.setUserType(user.getUserType());
			sessionVO.setMobile(user.getMobile());
			sessionVO.setEmail(user.getEmail());
			sessionVO.setDeviceId(user.getDeviceId());
			
			SessionUtils.setSessionData(req, sessionVO);
			
			return "t";
		} else {
			return "f";
		}
	}
	
	@GetMapping("app/user/login.do")
	public String login() throws Exception {
		return "user/login.app";
	}
	
	@PostMapping("app/user/login.do")
	@ResponseBody
	public String login(@RequestBody EgovMap loginMap, HttpServletRequest req) throws Exception {
		
		UserVO user = userService.selectUserLogin(loginMap);
		
		if(user == null) {
			return "f";
		} else {
			
			userService.updateUserLastLoginInfo(user.getIdKey());
			
			SessionVO sessionVO = new SessionVO();
			sessionVO.setIdKey(user.getIdKey());
			sessionVO.setUserId(user.getUserId());
			sessionVO.setUserType(user.getUserType());
			sessionVO.setMobile(user.getMobile());
			sessionVO.setEmail(user.getEmail());
			sessionVO.setDeviceId(user.getDeviceId());
			
			SessionUtils.setSessionData(req, sessionVO);
		}
		
		return "t";
		
	}
	
    @GetMapping("/admin/user/list.do")
    public String userList(ModelMap model) throws Exception {

        List<UserVO> userList = userService.selectUserList();

        model.addAttribute("userList", userList);

        return "user/list.admin";
    }
}
