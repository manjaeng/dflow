package kr.co.thenet.fapee.seller.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.seller.model.SellerTermsVO;

@Mapper
public interface SellerTermsMapper {
	//약관.
	List<SellerTermsVO> selectSellerTermsList(SellerSearchVO form) throws Exception;

	SellerTermsVO selectSellerTermsInfo(String value) throws Exception;

	int insertSellerTerms(SellerTermsVO form) throws Exception;

	int updateSellerTerms(SellerTermsVO form) throws Exception;

	int deleteSellerTerms(SellerTermsVO form) throws Exception;

}
