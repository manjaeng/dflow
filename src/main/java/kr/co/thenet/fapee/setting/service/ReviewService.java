package kr.co.thenet.fapee.setting.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.ReviewVO;

public interface ReviewService {
	
	List<ReviewVO> selectShoppingList(BaseSearchVO form) throws Exception;
	
	ReviewVO selectShoppingInfo(ReviewVO form) throws Exception;
	
	int saveReview(ReviewVO form) throws Exception;
	
	List<ReviewVO> selectReviewList(BaseSearchVO form) throws Exception;
	
	ReviewVO selectReviewInfo(ReviewVO form) throws Exception;

}
