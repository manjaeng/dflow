package kr.co.thenet.fapee.product.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.product.model.ProductCommentVO;
import kr.co.thenet.fapee.product.model.ProductHistoryVO;
import kr.co.thenet.fapee.product.model.ProductLookVO;
import kr.co.thenet.fapee.product.model.ProductSearchVO;
import kr.co.thenet.fapee.product.model.ProductVO;

@Mapper
public interface ProductMapper {

	List<ProductVO> selectInspectionList(ProductSearchVO form) throws Exception;

	List<ProductVO> selectSalesList(ProductSearchVO form) throws Exception;

	ProductVO selectProductInfo(ProductSearchVO form) throws Exception;

	ProductVO selectProductInfo(String pcode, Long idKey) throws Exception;

	String selectNewPcode() throws Exception;

	int insertProduct(ProductVO form) throws Exception;

	int updateProduct(ProductVO form) throws Exception;

	int updateProductInspectionStatus(ProductVO form) throws Exception;

	int updateProductSalesStatus(ProductVO form) throws Exception;

	int deleteProduct(ProductVO form) throws Exception;

	//코멘트.
	List<ProductCommentVO> selectProductCommentList(ProductSearchVO form) throws Exception;

	int insertProductComment(ProductCommentVO form) throws Exception;

	int deleteProductComment(ProductCommentVO form) throws Exception;

	//게시룩.
	List<ProductLookVO> selectProductLookList(ProductSearchVO form) throws Exception;

	//상품변경히스토리.
	List<ProductHistoryVO> selectProductHistoryList(ProductSearchVO form) throws Exception;

	int insertProductHistory(ProductHistoryVO form) throws Exception;

}
