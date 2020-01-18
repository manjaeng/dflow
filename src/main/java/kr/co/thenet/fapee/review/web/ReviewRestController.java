package kr.co.thenet.fapee.review.web;

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
import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.review.service.ReviewService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class ReviewRestController {

	@Autowired
	private ReviewService reviewService;
	
	private String profileNoUrl = "/resources/app/images/common/profile_no.png";
	private String imageNoUrl = "/resources/app/images/common/image_no.png";
	
	//나의 쇼핑 목록.
	@RequestMapping("/app/setting/rest/my_review.do")
	public Map<String, Object> myReview(BaseSearchVO form, HttpServletRequest req) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//현재 사용자ID로 설정.
		form.setIdKey((SessionUtils.isLogin(req))? SessionUtils.getSessionData(req).getIdKey() : -99);
		
		List<ReviewVO> list = reviewService.selectShoppingList(form);
		list.forEach(item -> {
			if(StringUtils.isEmpty(item.getUserImageUrl())) {
				item.setUserImageUrl(profileNoUrl);
			}
			if(StringUtils.isEmpty(item.getProductImageUrl())) {
				item.setProductImageUrl(imageNoUrl);
			}
			if( !"Y".equals(item.getSettleYn()) && !"Y".equals(item.getRewardYn()) && item.getReviewIdKey()==null ) {
				item.setDeletable(true);
			}
		});
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
	
	//쇼핑 로그 등록.
	@PostMapping("/app/setting/rest/my_click_insert.do")
	public RestResultVO myClickInsert(ReviewVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setUserIdKey(SessionUtils.getSessionData(req).getIdKey());
			ReviewVO reward = reviewService.selectReviewInfo(form);
			if(form.getUserIdKey()==reward.getUserIdKey()) {
				log.info("구매 클릭...등록자 SKIP");
				return RestResultVO.of(0, "REVIEW 들록자...SKIP...");
			}

			int cnt = reviewService.insertClickLog(form);
			
			return (cnt==0)? RestResultVO.of(-1, "해당 구매 정보를 찾지 못하였습니다.") : RestResultVO.of(0, "삭제되었습니다.");
		}

	}
	
	//쇼핑 로그 삭제.
	@PostMapping("/app/setting/rest/my_click_delete.do")
	public RestResultVO myClickDelete(ReviewVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setUserIdKey(SessionUtils.getSessionData(req).getIdKey());
			int cnt = reviewService.deleteClickLog(form);
			
			return (cnt==0)? RestResultVO.of(-1, "해당 구매 정보를 찾지 못하였습니다.") : RestResultVO.of(0, "삭제되었습니다.");
		}

	}
	
	//제품에 대한 리뷰 목록.
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
