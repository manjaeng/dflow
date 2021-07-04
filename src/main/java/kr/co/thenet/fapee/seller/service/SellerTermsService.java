package kr.co.thenet.fapee.seller.service;

import java.util.List;

import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.seller.model.SellerTermsVO;

public interface SellerTermsService {
	//약관.
	List<SellerTermsVO> selectSellerTermsList(SellerSearchVO form) throws Exception;

	SellerTermsVO selectSellerTermsInfo(SellerSearchVO form) throws Exception;

	SellerTermsVO selectSellerTermsInfo(String value) throws Exception;

	RestResultVO insertSellerTerms(SellerTermsVO form) throws Exception;

	RestResultVO updateSellerTerms(SellerTermsVO form) throws Exception;

	RestResultVO deleteSellerTerms(SellerTermsVO form) throws Exception;

}
