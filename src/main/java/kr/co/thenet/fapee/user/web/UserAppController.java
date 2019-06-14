package kr.co.thenet.fapee.user.web;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.CM_Login;
import kr.co.thenet.fapee.common.model.CM_User;
import kr.co.thenet.fapee.common.model.CM_UserSumup;
import kr.co.thenet.fapee.common.util.AuthToken;
import kr.co.thenet.fapee.common.util.CommonFunc;
import kr.co.thenet.fapee.common.util.ResponseUtil;
import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/{version}/user")
public class UserAppController {

	@Resource
	private UserService userService;

	@PostMapping("/login.do")
	public ResponseEntity<?> login(@RequestBody CM_Login login) throws Exception {
		try {
			
			log.info(login);

			if (login.getUserId() == null || login.getUserId().length() == 0 || login.getPassword() == null
					|| login.getPassword().length() == 0) {
				return ResponseUtil.getResponse(HttpStatus.BAD_REQUEST);
			}

			CM_User existUser = userService.selectUserServiceInfo(login.getUserId());
			if (existUser == null) {
				return ResponseUtil.getResponse(HttpStatus.NOT_FOUND);
			}

			CM_UserSumup existUserSumup = userService.selectUserServiceSumupInfo(existUser.getIdKey());

			if (existUserSumup == null) {
				return ResponseUtil.getResponse(HttpStatus.NOT_FOUND);
			}
			if (existUser.getPassword() != null) {
				if (!existUser.getPassword()
						.equals(CommonFunc.getHashedPassword(login.getPassword(), login.getUserId()))) {
					existUserSumup.setLoginFailCount(existUserSumup.getLoginFailCount() + 1);
					userService.updateUserServiceSumupInfo(existUserSumup);
					return ResponseUtil.getResponse(HttpStatus.NOT_ACCEPTABLE);
				}
			} else {
				return ResponseUtil.getResponse(HttpStatus.FORBIDDEN);
			}
			if (existUser.getStatus() != null) {
				if (existUser.getStatus().equals("9")) {
					return ResponseUtil.getResponse(HttpStatus.FORBIDDEN);
				}
			}
			if (existUserSumup.getLoginFailCount() >= 5) {
				return ResponseUtil.getResponse(HttpStatus.FORBIDDEN);
			}

			CM_Login result = new CM_Login();
			long tenYearTime = (new Date()).getTime() + (1000 * 60 * 60 * 24 * 365); // 1년
			long lastSeq = existUserSumup.getLastLoginSeq() + 1;
			result.setAuthToken(
					AuthToken.getToken(existUser.getIdKey(), tenYearTime, existUser.getUserType(), lastSeq));
			result.setUserId(existUser.getUserId());
			result.setUserIdKey(existUser.getIdKey());
			result.setUserName(existUser.getUserName());
			result.setUserType(existUser.getUserType());

			existUserSumup.setLoginFailCount(0);
			existUserSumup.setLastLoginDate(new Date());
			existUserSumup.setLastLoginSeq(lastSeq);
			userService.updateUserServiceSumupInfo(existUserSumup);

			return ResponseUtil.getResponse(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ResponseUtil.getResponse(HttpStatus.BAD_REQUEST);
	}
}
