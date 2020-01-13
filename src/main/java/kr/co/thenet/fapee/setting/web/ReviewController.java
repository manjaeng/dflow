package kr.co.thenet.fapee.setting.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import kr.co.thenet.fapee.common.model.ReviewVO;
import kr.co.thenet.fapee.setting.service.ReviewService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	//쇼핑 내역.
	@GetMapping("/app/setting/my_review.do")
	public String shoppingList() throws Exception {
		return "setting/my_review.app";
	}
	
	//리뷰 편집(사진올리기)
	@GetMapping("/app/setting/my_review_upload.do")
	public String reviewUpload(ReviewVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		model.addAttribute("data", reviewService.selectShoppingInfo(form));
		return "setting/my_review_upload.app";
	}
	
	//리뷰 편집
	@PostMapping("/app/setting/my_review_write.do")
	public String reviewWrite(ReviewVO form, Model model) throws Exception {
		model.addAttribute("form", form);
		model.addAttribute("data", reviewService.selectShoppingInfo(form));
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
		model.addAttribute("data", reviewService.selectReviewInfo(form));
		return "look/review_view.app";
	}

}
