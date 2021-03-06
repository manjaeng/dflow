package kr.co.thenet.fapee.reward.service.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import kr.co.thenet.fapee.reward.service.RewardService;

@Service
public class RewardServiceImpl implements RewardService{
	
	@Autowired
	private RewardMapper mapper;

	@Override
	public List<RewardVO> selectRewardList(RewardSearchVO form) throws Exception {
		return mapper.selectRewardList(form);
	}

	@Override
	public RewardVO selectRewardInfo(RewardSearchVO form) throws Exception {
		return mapper.selectRewardInfo(form);
	}

	@Override
	public List<RewardProductByUserVO> selectRewardProductByUser(RewardSearchVO form) throws Exception {
		return mapper.selectRewardProductByUser(form);
	}

	@Override
	public RewardSummaryVO selectRewardApprovalSummary(RewardSearchVO form) throws Exception {
		return mapper.selectRewardApprovalSummary(form);
	}

	@Override
	public RewardSummaryVO selectRewardInfoBySeller(RewardSearchVO form) throws Exception {
		return mapper.selectRewardInfoBySeller(form);
	}

	@Override
	public RewardSummaryVO selectRewardSummaryForInspection(RewardSearchVO form) throws Exception {
		return mapper.selectRewardSummaryForInspection(form);
	}

	@Override
	public RewardSummaryVO selectRewardSummaryForMcp(RewardSearchVO form) throws Exception {
		return mapper.selectRewardSummaryForMcp(form);
	}

	@Override
	public List<RewardProductVO> selectRewardProductList(RewardSearchVO form) throws Exception {
		return mapper.selectRewardProductList(form);
	}

	@Override
	public List<ApprovalVO> selectApprovalList(RewardSearchVO form) throws Exception {
		return null;
	}

	@Override
	public ApprovalVO selectApprovalInfo(RewardSearchVO form) throws Exception {
		return null;
	}

	@Override
	public List<SettleVO> selectSettleList(RewardSearchVO form) throws Exception {
		return null;
	}

	@Override
	public SettleVO selectSettleInfo(RewardSearchVO form) throws Exception {
		return null;
	}

	@Override
	public List<WithdrawalVO> selectWithdrawalList(RewardSearchVO form) throws Exception {
		return mapper.selectWithdrawalList(form);
	}

	//????????????.
	@Override
	@Transactional
	public RestResultVO updateSettleStatus(RewardSummaryVO form) throws Exception {
		
		RewardProductVO item = null;
		String[] items = form.getItems().split(",");
		String[] arr;
		
		//??????????????? ?????? ?????? ??????.
		for(String click : items) {
			if(click.endsWith("Y")) continue;
			
			arr = click.split(":");
			
			item = new RewardProductVO();
			item.setClickKey(Long.valueOf(arr[0]));
			item.setRewardCode(null);
			item.setRewardYn(null);
			mapper.updateRewardProduct(item);
		}
		
		//????????? ?????? ?????? ??????.
		for(String click : items) {
			if(click.endsWith("N")) continue;
			
			arr = click.split(":");
			
			item = new RewardProductVO();
			item.setClickKey(Long.valueOf(arr[0]));
			item.setRewardYn("Y");
			
			String rewardCode = arr[1];
			
			if(rewardCode == null || rewardCode.isEmpty()) {	//?????? ????????? ?????? ??????.
				RewardProductVO rewardProductVO = mapper.selectMaxRewardCode();
				String maxRewardCode = rewardProductVO.getRewardCode();
				int lastRewardCode = 0;
				if(maxRewardCode != null) {
					String[] codeArr = maxRewardCode.split("-");
					lastRewardCode = Integer.valueOf(codeArr[1]);
				}
				lastRewardCode++;
				item.setRewardCode(String.format("%s-%04d", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd")), lastRewardCode));
			}
			else {	//?????? ????????? ?????? ??????.
				item.setRewardCode(rewardCode);
			}
			mapper.updateRewardProduct(item);
		}

		//????????? ?????? ???????????? ?????? ??????.
		RewardSearchVO searchVO = new RewardSearchVO();
		searchVO.setYyyyMm(form.getYyyyMm());
		searchVO.setIdKey(form.getIdKey());
		searchVO.setRewardYn("Y");
		RewardSummaryVO summary = mapper.selectRewardSummaryForInspection(searchVO);
		Double taxAmount = summary.getRewardAmount() * 0.1;	//????????? 10%
		summary.setTaxAmount( taxAmount.longValue() );
		summary.setTotalAmount( summary.getRewardAmount() + summary.getTaxAmount() );
		summary.setSettleStatus("A");

		int cnt = mapper.updateRewardSummary(summary);
		if(cnt==0) {
			cnt = mapper.insertRewardSummary(summary);
		}
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	//????????? ????????????.
	@Override
	public RestResultVO updateBillStatus(RewardVO form) throws Exception {
		int cnt = mapper.updateBillStatus(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	//?????? ????????????.
	@Override
	public RestResultVO updateDepositStatus(RewardVO form) throws Exception {
		int cnt = mapper.updateDepositStatus(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	//?????? ????????????.
	@Override
	public RestResultVO updateWithdrawalStatus(WithdrawalVO form) throws Exception {
		int cnt = mapper.updateWithdrawalStatus(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}
	
	//?????????.
	@Override
	public List<RewardCommentVO> selectRewardCommentList(RewardSearchVO form) throws Exception {
		return mapper.selectRewardCommentList(form);
	}

	@Override
	public RestResultVO insertRewardComment(RewardCommentVO form) throws Exception {
		int cnt = mapper.insertRewardComment(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	@Override
	public RestResultVO deleteRewardComment(RewardCommentVO form) throws Exception {
		int cnt = mapper.deleteRewardComment(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ???????????? ????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

}