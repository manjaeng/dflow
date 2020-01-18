package kr.co.thenet.fapee.my.web;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.AlimSettingVO;
import kr.co.thenet.fapee.common.model.AlimVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.my.service.AlimService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AlimRestController {

	@Autowired
	private AlimService alimService;
	
	@RequestMapping("/app/my/rest/alim.do")
	public Map<String, Object> alimList(AlimVO form, HttpServletRequest req) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//현재 사용자ID로 설정.
		form.setReceiverIdKey((SessionUtils.isLogin(req))? SessionUtils.getSessionData(req).getIdKey() : -99);
		
		List<AlimVO> list = alimService.selectAlimList(form);
		list.forEach(item -> {
			if( StringUtils.isEmpty(item.getSenderImageUrl()) ) {
				item.setSenderImageUrl("/resources/app/images/common/profile_no.png");
			}
			else {
				item.setSenderImageUrl(String.format("%s%s", Constants.S3_URL, item.getSenderImageUrl()));
			}
			
			long minutes = Duration.between(item.getSendDate(), LocalDateTime.now()).toMinutes();
			if(minutes < 60) {
				item.setElapsedTime(String.format("%d분 전", minutes));
			}
			else if(minutes < (60 * 24)) {
				item.setElapsedTime(String.format("%d시간 전", Math.ceil(minutes/60.0)));
			}
			else {
				item.setElapsedTime(String.format("%s", item.getSendDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))));
			}
		});
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
		}
		resultMap.put("form", form);
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@RequestMapping("/app/setting/rest/setting_alim.do")
	public RestResultVO alimSetting(AlimSettingVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setUserIdKey(SessionUtils.getIdKey());
			int cnt = alimService.saveAlimSetting(form);
			
			return (cnt==0)? RestResultVO.of(-1, "저장에 실패하였습니다.") : RestResultVO.of(0, "저장되었습니다.");
		}
	}

}
