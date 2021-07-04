package kr.co.thenet.fapee.reward.service.impl;

import java.util.List;

import kr.co.thenet.fapee.reward.model.ApprovalVO;
import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.reward.model.RewardCommentVO;
import kr.co.thenet.fapee.reward.model.RewardProductByUserVO;
import kr.co.thenet.fapee.reward.model.RewardProductVO;
import kr.co.thenet.fapee.reward.model.RewardSearchVO;
import kr.co.thenet.fapee.reward.model.RewardSummaryVO;
import kr.co.thenet.fapee.reward.model.RewardVO;
import kr.co.thenet.fapee.reward.model.SettleVO;
import kr.co.thenet.fapee.reward.model.WithdrawalVO;

@Mapper
public interface RewardMapper {

	List<RewardVO> selectRewardList(RewardSearchVO form) throws Exception;

	List<RewardProductByUserVO> selectRewardProductByUser(RewardSearchVO form) throws Exception;

	RewardSummaryVO selectRewardApprovalSummary(RewardSearchVO form) throws Exception;

	RewardVO selectRewardInfo(RewardSearchVO form) throws Exception;

	RewardSummaryVO selectRewardInfoBySeller(RewardSearchVO form) throws Exception;
	
	RewardSummaryVO selectRewardSummaryForInspection(RewardSearchVO form) throws Exception;

	RewardSummaryVO selectRewardSummaryForMcp(RewardSearchVO form) throws Exception;

	List<RewardProductVO> selectRewardProductList(RewardSearchVO form) throws Exception;

	List<ApprovalVO> selectApprovalList(RewardSearchVO form) throws Exception;

	ApprovalVO selectApprovalInfo(RewardSearchVO form) throws Exception;

	List<SettleVO> selectSettleList(RewardSearchVO form) throws Exception;

	SettleVO selectSettleInfo(RewardSearchVO form) throws Exception;

	List<WithdrawalVO> selectWithdrawalList(RewardSearchVO form) throws Exception;

	//정산상태변경.
	RewardProductVO selectMaxRewardCode() throws Exception;
	int updateRewardSummary(RewardSummaryVO form) throws Exception;
	int updateRewardProduct(RewardProductVO form) throws Exception;
	int insertRewardSummary(RewardSummaryVO form) throws Exception;

	//계산서상태변경.
	int updateBillStatus(RewardVO form) throws Exception;

	//입금상태변경.
	int updateDepositStatus(RewardVO form) throws Exception;

	//출금 상태변경.
	int updateWithdrawalStatus(WithdrawalVO form) throws Exception;

	//코멘트.
	List<RewardCommentVO> selectRewardCommentList(RewardSearchVO form) throws Exception;

	int insertRewardComment(RewardCommentVO form) throws Exception;

	int deleteRewardComment(RewardCommentVO form) throws Exception;

}
