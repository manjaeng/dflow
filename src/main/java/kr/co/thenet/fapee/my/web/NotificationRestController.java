package kr.co.thenet.fapee.my.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.setting.service.ReviewService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class NotificationRestController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/app/my/rest/alim.do")
	public Map<String, Object> alimList(BaseSearchVO form, HttpServletRequest req) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//현재 사용자ID로 설정.
		form.setIdKey((SessionUtils.isLogin(req))? SessionUtils.getSessionData(req).getIdKey() : -99);
		
		List<ReviewVO> list = reviewService.selectShoppingList(form);
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
		}
		resultMap.put("form", form);
		resultMap.put("list", list);
		
		return resultMap;
	}

}
