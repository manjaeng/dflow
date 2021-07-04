package kr.co.thenet.fapee.product.service;

import java.util.List;

import kr.co.thenet.fapee.product.model.ProductCommentVO;
import kr.co.thenet.fapee.product.model.ProductHistoryVO;
import kr.co.thenet.fapee.product.model.ProductLookVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.product.model.ProductSearchVO;
import kr.co.thenet.fapee.product.model.ProductVO;

public interface ProductService {

	List<ProductVO> selectInspectionList(ProductSearchVO form) throws Exception;

	List<ProductVO> selectSalesList(ProductSearchVO form) throws Exception;

	ProductVO selectProductInfo(ProductSearchVO form) throws Exception;

	RestResultVO registProduct(ProductVO form) throws Exception;

	RestResultVO updateProductInspectionStatus(ProductVO form) throws Exception;

	RestResultVO updateProductSalesStatus(ProductVO form) throws Exception;

	RestResultVO deleteProduct(ProductVO form) throws Exception;
	
	
	//코멘트.
	List<ProductCommentVO> selectProductCommentList(ProductSearchVO form) throws Exception;

	RestResultVO insertProductComment(ProductCommentVO form) throws Exception;

	RestResultVO deleteProductComment(ProductCommentVO form) throws Exception;

	
	//게시룩..
	List<ProductLookVO> selectProductLookList(ProductSearchVO form) throws Exception;
	
	
	//상품변경히스토리..
	List<ProductHistoryVO> selectProductHistoryList(ProductSearchVO form) throws Exception;

	RestResultVO insertProductHistory(ProductVO form, String eventType) throws Exception;

}
