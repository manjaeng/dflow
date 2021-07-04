package kr.co.thenet.fapee.review.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.ReviewImageVO;
import kr.co.thenet.fapee.common.model.ReviewVO;

@Mapper
public interface ReviewMapper {
	
	List<ReviewVO> selectShoppingList(BaseSearchVO form) throws Exception;
	
	ReviewVO selectShoppingInfo(ReviewVO form) throws Exception;
	
	int insertReview(ReviewVO form) throws Exception;
	
	int updateReview(ReviewVO form) throws Exception;
	
	int insertClickLog(ReviewVO form) throws Exception;
	
	int deleteClickLog(ReviewVO form) throws Exception;
	
	List<ReviewVO> selectReviewList(BaseSearchVO form) throws Exception;
	
	ReviewVO selectReviewInfo(ReviewVO form) throws Exception;
	
	List<ReviewImageVO> selectReviewImageList(ReviewVO form) throws Exception;
	
	int insertReviewImage(ReviewImageVO form) throws Exception;
	
	int deleteReviewImage(ReviewVO form) throws Exception;
	
}
