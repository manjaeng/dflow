package kr.co.thenet.fapee.seller.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.seller.model.SellerCommentVO;
import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.seller.model.SellerUserVO;

public interface SellerUserService {
	
	List<SellerUserVO> selectSellerList(SellerSearchVO form) throws Exception;
	
	List<SellerUserVO> selectSellerSearchList(SellerSearchVO form) throws Exception;
	
	List<SellerUserVO> selectApplyList(SellerSearchVO form) throws Exception;

	SellerUserVO selectSellerInfo(String idKey) throws Exception;

	SellerUserVO selectSellerInfo(SellerSearchVO form) throws Exception;

	SellerUserVO selectSellerInfo(SellerUserVO form) throws Exception;

	RestResultVO updateSellerLogin(SellerUserVO form) throws Exception;

	RestResultVO insertSellerInfo(SellerUserVO form) throws Exception;

	RestResultVO updateSellerInfo(SellerUserVO form) throws Exception;

	RestResultVO updateSellerApplyStatus(SellerUserVO form) throws Exception;
	
	
	//코멘트.
	List<SellerCommentVO> selectSellerCommentList(SellerSearchVO form) throws Exception;

	RestResultVO insertSellerComment(SellerCommentVO form) throws Exception;

	RestResultVO deleteSellerComment(SellerCommentVO form) throws Exception;

}
