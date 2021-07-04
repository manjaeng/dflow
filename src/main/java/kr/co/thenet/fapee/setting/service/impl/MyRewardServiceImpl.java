package kr.co.thenet.fapee.setting.service.impl;

import java.util.List;

import kr.co.thenet.fapee.setting.service.MyRewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RewardAccountVO;
import kr.co.thenet.fapee.common.model.RewardInoutVO;

@Service
public class MyRewardServiceImpl implements MyRewardService {

	@Autowired
	private MyRewardMapper rewardMapper;
	
	@Override
	public List<RewardInoutVO> selectRewardList(BaseSearchVO form) throws Exception {
		return rewardMapper.selectRewardList(form);
	}
	
	@Override
	public RewardInoutVO selectRewardSummary(BaseSearchVO form) throws Exception {
		return rewardMapper.selectRewardSummary(form);
	}
	
	@Override
	public RewardAccountVO selectRewardAccountInfo(BaseSearchVO form) throws Exception {
		return rewardMapper.selectRewardAccountInfo(form);
	}
	
	@Override
	public int updateAccountInfo(RewardAccountVO form) throws Exception {
		return rewardMapper.updateAccountInfo(form);
	}
	
	@Override
	public int insertRewardWithdrawal(RewardInoutVO form) throws Exception {
		return rewardMapper.insertRewardWithdrawal(form);
	}

}
