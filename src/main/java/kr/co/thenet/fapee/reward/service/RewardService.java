package kr.co.thenet.fapee.reward.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.reward.model.ApprovalVO;
import kr.co.thenet.fapee.reward.model.RewardCommentVO;
import kr.co.thenet.fapee.reward.model.RewardProductByUserVO;
import kr.co.thenet.fapee.reward.model.RewardProductVO;
import kr.co.thenet.fapee.reward.model.RewardSearchVO;
import kr.co.thenet.fapee.reward.model.RewardSummaryVO;
import kr.co.thenet.fapee.reward.model.RewardVO;
import kr.co.thenet.fapee.reward.model.SettleVO;
import kr.co.thenet.fapee.reward.model.WithdrawalVO;

public interface RewardService {

	List<RewardVO> selectRewardList(RewardSearchVO form) throws Exception;

	RewardVO selectRewardInfo(RewardSearchVO form) throws Exception;

	List<RewardProductByUserVO> selectRewardProductByUser(RewardSearchVO form) throws Exception;

	RewardSummaryVO selectRewardApprovalSummary(RewardSearchVO form) throws Exception;
	
	RewardSummaryVO selectRewardInfoBySeller(RewardSearchVO form) throws Exception;

	//셀러 리워드 승인용 Summary.
	RewardSummaryVO selectRewardSummaryForInspection(RewardSearchVO form) throws Exception;

	//MCP를 위한 해당 월의 전체 리워드 금액 합계
	RewardSummaryVO selectRewardSummaryForMcp(RewardSearchVO form) throws Exception;

	//셀러 리워드 승인용 상품 목록.
	List<RewardProductVO> selectRewardProductList(RewardSearchVO form) throws Exception;

	List<ApprovalVO> selectApprovalList(RewardSearchVO form) throws Exception;

	ApprovalVO selectApprovalInfo(RewardSearchVO form) throws Exception;

	List<SettleVO> selectSettleList(RewardSearchVO form) throws Exception;

	SettleVO selectSettleInfo(RewardSearchVO form) throws Exception;

	List<WithdrawalVO> selectWithdrawalList(RewardSearchVO form) throws Exception;

	//상태변경.
	RestResultVO updateSettleStatus(RewardSummaryVO form) throws Exception;

	//계산서 상태변경.
	RestResultVO updateBillStatus(RewardVO form) throws Exception;

	//입금 상태변경.
	RestResultVO updateDepositStatus(RewardVO form) throws Exception;

	//출금 상태변경.
	RestResultVO updateWithdrawalStatus(WithdrawalVO form) throws Exception;
	
	//코멘트.
	List<RewardCommentVO> selectRewardCommentList(RewardSearchVO form) throws Exception;

	RestResultVO insertRewardComment(RewardCommentVO form) throws Exception;

	RestResultVO deleteRewardComment(RewardCommentVO form) throws Exception;

}
