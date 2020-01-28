package kr.co.thenet.fapee.setting.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.common.model.RewardVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.setting.service.MyRewardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MyRewardRestController {

	@Autowired
	private MyRewardService rewardService;
	
	//내 리워드 목록.
	@RequestMapping("/app/setting/rest/reward_history.do")
	public Map<String, Object> rewardHistory(BaseSearchVO form, HttpServletRequest req) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//현재 사용자ID로 설정.
		form.setIdKey((SessionUtils.isLogin(req))? SessionUtils.getSessionData(req).getIdKey() : -99);
		
		List<RewardVO> list = rewardService.selectRewardList(form);
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
		}
		resultMap.put("form", form);
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@PostMapping("/app/setting/rest/accountInfo.do")
	public RestResultVO accountInfo(RewardVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setUserIdKey(SessionUtils.getSessionData(req).getIdKey());
			int cnt = rewardService.updateAccountInfo(form);
			
			return (cnt==0)? RestResultVO.of(-1, "저장에 실패하였습니다.") : RestResultVO.of(0, "저장되었습니다.");
		}

	}

}
