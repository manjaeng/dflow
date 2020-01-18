package kr.co.thenet.fapee.review.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.review.service.ReviewService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	private String profileNoUrl = "/resources/app/images/common/profile_no.png";
	private String imageNoUrl = "/resources/app/images/common/image_no.png";
	
	//쇼핑 내역.
	@GetMapping("/app/setting/my_review.do")
	public String shoppingList() throws Exception {
		return "setting/my_review.app";
	}
	
	//리뷰 편집(사진올리기)
	@GetMapping("/app/setting/my_review_upload.do")
	public String reviewUpload(ReviewVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		
		ReviewVO data = reviewService.selectShoppingInfo(form);
		if(data!=null && StringUtils.isEmpty(data.getUserImageUrl())) {
			data.setUserImageUrl(profileNoUrl);
		}
		if(data!=null && StringUtils.isEmpty(data.getProductImageUrl())) {
			data.setProductImageUrl(imageNoUrl);
		}
		model.addAttribute("data", data);
		
		return "setting/my_review_upload.app";
	}
	
	//리뷰 편집
	@RequestMapping("/app/setting/my_review_write.do")
	public String reviewWrite(ReviewVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		
		ReviewVO data = null;
		if(form.getReviewIdKey()==null) {
			data = reviewService.selectShoppingInfo(form);
		}
		else {
			data = reviewService.selectReviewInfo(form);
		}
		
		if(data!=null && StringUtils.isEmpty(data.getUserImageUrl())) {
			data.setUserImageUrl(profileNoUrl);
		}
		if(data!=null && StringUtils.isEmpty(data.getProductImageUrl())) {
			data.setProductImageUrl(imageNoUrl);
		}
		model.addAttribute("data", data);
		
		return "setting/my_review_write.app";
	}
	
	//리뷰목록
	@GetMapping("/app/look/review.do")
	public String reviewList(ReviewVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		return "look/review.app";
	}
	
	//리뷰상세
	@GetMapping("/app/look/review_view.do")
	public String reviewView(ReviewVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		
		ReviewVO data = reviewService.selectReviewInfo(form);
		data.setOwner((data.getUserIdKey()==SessionUtils.getIdKey()));	//구매자인지가 현재 사용자인지 여부 설정.
		
		if(data!=null && StringUtils.isEmpty(data.getUserImageUrl())) {
			data.setUserImageUrl(profileNoUrl);
		}
		if(data!=null && StringUtils.isEmpty(data.getProductImageUrl())) {
			data.setProductImageUrl(imageNoUrl);
		}
		model.addAttribute("data", data);

		return "look/review_view.app";
	}

}
