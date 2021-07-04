package kr.co.thenet.fapee.user.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class UserAppRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/app/user/rest/memDis.do")
	public RestResultVO userMemMis(UserVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setIdKey(SessionUtils.getSessionData(req).getIdKey());
			int cnt = userService.updateUserWithdrawal(form);
			//세션 삭제.
			if(cnt > 0) {
				req.getSession().invalidate();
			}
			
			return (cnt==0)? RestResultVO.of(-1, "해당 사용자 정보를 찾지 못하였습니다.") : RestResultVO.of(0, "탈퇴 처리되었습니다.");
		}

	}

}
