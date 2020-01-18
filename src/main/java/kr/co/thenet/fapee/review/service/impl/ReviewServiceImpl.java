package kr.co.thenet.fapee.review.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.DatatypeConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.ReviewImageVO;
import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.S3Utils;
import kr.co.thenet.fapee.review.service.ReviewService;

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
		
		//reviewIDKey가 있으면 내용만 수정이고... 이미지 수정은 없음.
		if(form.getReviewIdKey()!=null) return cnt;
		
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
			
			int seq = 0;
			S3Utils.init();
			for(ReviewImageVO item : imageList) {
				seq++;
				item.setReviewIdKey(data.getReviewIdKey());
				item.setSeq(seq);

				String destPath = String.format("review/%s/%010d-%02d.png"
						, LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"))
						, data.getReviewIdKey()
						, seq
						);
				
				int startIdx = item.getImageSrc().indexOf(",") + 1;
				byte[] imagedata = DatatypeConverter.parseBase64Binary(item.getImageSrc().substring(startIdx));

				item.setImageUrl(destPath);
				//아마존 S3에 저장.
				S3Utils.uploadFile(destPath, imagedata);
				
				item.setImageSrc(null);

				reviewMapper.insertReviewImage(item);
			}
		}
		
		return cnt;
	}
	
	
	@Override
	public int insertClickLog(ReviewVO form) throws Exception {
		if( form.getReviewIdKey() != null ) {
			form.setRewardCode(String.format("RD-%d", form.getReviewIdKey()));
		}
		return reviewMapper.insertClickLog(form);
	}
	
	
	@Override
	public int deleteClickLog(ReviewVO form) throws Exception {
		return reviewMapper.deleteClickLog(form);
	}

	
	@Override
	public List<ReviewVO> selectReviewList(BaseSearchVO form) throws Exception {
		List<ReviewVO> list = reviewMapper.selectReviewList(form);
		for(ReviewVO item : list) {
			if( !StringUtils.isEmpty(item.getImageUrl()) ) {
				item.setImageUrl(String.format("%s%s", Constants.S3_URL, item.getImageUrl()));
			}
		}
		return list;
	}
	
	@Override
	public ReviewVO selectReviewInfo(ReviewVO form) throws Exception {
		ReviewVO review = reviewMapper.selectReviewInfo(form);
		if(review != null) {
			if(review.getReviewMsg() != null) review.setReviewMsgHtml(review.getReviewMsg().replaceAll("\n", "<br>"));
			//리뷰 이미지 설정 및 S3 URL로 바꿈.
			review.setImageList(reviewMapper.selectReviewImageList(review));
			for(ReviewImageVO item : review.getImageList()) {
				if( !StringUtils.isEmpty(item.getImageUrl()) ) {
					item.setImageUrl(String.format("%s%s", Constants.S3_URL, item.getImageUrl()));
				}
			}
		}

		return review;
	}

}
