package kr.co.thenet.fapee.setting.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.ReviewImageVO;
import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.setting.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewVO> selectShoppingList(BaseSearchVO form) throws Exception {
		return reviewMapper.selectShoppingList(form);
	}
	
	@Override
	public ReviewVO selectShoppingInfo(ReviewVO form) throws Exception {
		return reviewMapper.selectShoppingInfo(form);
	}
	
	@Override
	public int saveReview(ReviewVO form) throws Exception {
		int cnt = reviewMapper.updateReview(form);
		if(cnt==0) {
			ReviewVO data = reviewMapper.selectShoppingInfo(form);
			data.setReviewName(form.getReviewName());
			data.setReviewMsg(form.getReviewMsg());
			
			cnt = reviewMapper.insertReview(data);
		}

		ReviewVO data = reviewMapper.selectShoppingInfo(form);
		if(data != null) {
			//해당 리뷰에 대한 이미지 일괄 삭제.
			reviewMapper.deleteReviewImage(data);

			//System.out.println(form.getImageSrcList());
			ObjectMapper mapper = new ObjectMapper();
			List<ReviewImageVO> imageList = mapper.readValue(form.getImageSrcList(), new TypeReference<ArrayList<ReviewImageVO>>() {});
			
			int seq = 1;
			for(ReviewImageVO item : imageList) {
				item.setReviewIdKey(data.getReviewIdKey());
				item.setSeq(seq++);
				reviewMapper.insertReviewImage(item);
			}
		}
		
		return cnt;
	}
	
	;
	
	;
	
	@Override
	public List<ReviewVO> selectReviewList(BaseSearchVO form) throws Exception {
		return reviewMapper.selectReviewList(form);
	}
	
	@Override
	public ReviewVO selectReviewInfo(ReviewVO form) throws Exception {
		ReviewVO review = reviewMapper.selectReviewInfo(form);
		if(review.getReviewMsg() != null) review.setReviewMsgHtml(review.getReviewMsg().replaceAll("\n", "<br>"));
		review.setImageList(reviewMapper.selectReviewImageList(review));

		return review;
	}

}
