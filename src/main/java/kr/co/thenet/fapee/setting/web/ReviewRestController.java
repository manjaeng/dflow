package kr.co.thenet.fapee.setting.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.setting.service.ReviewService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ReviewRestController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping("/app/setting/rest/my_review.do")
	public Map<String, Object> myReview(BaseSearchVO form, HttpServletRequest req) throws Exception {
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
	
	@PostMapping("/app/setting/rest/my_review_save.do")
	public RestResultVO myReviewSave(ReviewVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setUserIdKey(SessionUtils.getSessionData(req).getIdKey());
			int cnt = reviewService.saveReview(form);
			
			return (cnt==0)? RestResultVO.of(-1, "해당 구매 정보를 찾지 못하였습니다.") : RestResultVO.of(0, "저장되었습니다.");
		}

	}
	
	@RequestMapping("/app/look/rest/review.do")
	public Map<String, Object> reviewList(BaseSearchVO form, HttpServletRequest req) throws Exception {
		//13건씩.
		form.setRows(13);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<ReviewVO> list = reviewService.selectReviewList(form);
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
		}
		resultMap.put("form", form);
		resultMap.put("list", list);
		
		return resultMap;
	}

}
