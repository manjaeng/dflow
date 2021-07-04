package kr.co.thenet.fapee.product.web;

import javax.servlet.http.HttpSession;

import kr.co.thenet.fapee.product.model.ProductCommentVO;
import kr.co.thenet.fapee.product.model.ProductVO;
import kr.co.thenet.fapee.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.RestResultVO;

@RestController
@RequestMapping("/app/product")
public class ProductRestController {

	@Autowired
	private ProductService service;

	/**
	 * 제품 정보 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/regist.do")
	public RestResultVO regist(ProductVO form, HttpSession session) throws Exception {
		form.setCreateId((String)session.getAttribute("SSMcpUserId"));
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.registProduct(form);
	}

	/**
	 * 제품 검수 상태 업데이트
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/inspectionStatus.do")
	public RestResultVO updateInspection(ProductVO form, HttpSession session) throws Exception {
		form.setInspectionId((String)session.getAttribute("SSMcpUserId"));
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.updateProductInspectionStatus(form);
	}

	/**
	 * 제품 판매 상태 업데이트
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/salesStatus.do")
	public RestResultVO salesStatus(ProductVO form, HttpSession session) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.updateProductSalesStatus(form);
	}

	/**
	 * 제품 코멘트 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/comment.do")
	public RestResultVO comment(ProductCommentVO form, HttpSession session) throws Exception {
		form.setCreateId((String)session.getAttribute("SSMcpUserId"));
		return service.insertProductComment(form);
	}

	/**
	 * 제품 코멘트 삭제
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/deleteComment.do")
	public RestResultVO deleteComment(ProductCommentVO form, HttpSession session) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.deleteProductComment(form);
	}

}
