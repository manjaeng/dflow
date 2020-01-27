package kr.co.thenet.fapee.seller.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.seller.model.SellerCommentVO;
import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.seller.model.SellerUserVO;

@Mapper
public interface SellerUserMapper {

	List<SellerUserVO> selectSellerList(SellerSearchVO form) throws Exception;

	List<SellerUserVO> selectSellerSearchList(SellerSearchVO form) throws Exception;	//모달 팝업 조회용.

	List<SellerUserVO> selectApplyList(SellerSearchVO form) throws Exception;

	SellerUserVO selectSellerInfo(SellerSearchVO form) throws Exception;

	SellerUserVO selectSellerInfo(SellerUserVO form) throws Exception;

	SellerUserVO selectSellerInfo(long dataKey) throws Exception;

	int insertSellerInfo(SellerUserVO form) throws Exception;

	int updateSellerInfo(SellerUserVO form) throws Exception;

	int updateUserPassword(SellerUserVO form) throws Exception;

	int updateSellerLogin(SellerUserVO form) throws Exception;

	int updateSellerApplyStatus(SellerUserVO form) throws Exception;

	//코멘트.
	List<SellerCommentVO> selectSellerCommentList(SellerSearchVO form) throws Exception;

	int insertSellerComment(SellerCommentVO form) throws Exception;

	int deleteSellerComment(SellerCommentVO form) throws Exception;

	int deleteRejectSellerForRegist(SellerUserVO form) throws Exception;

	int deleteRejectCommentForRegist(SellerUserVO form) throws Exception;

}
