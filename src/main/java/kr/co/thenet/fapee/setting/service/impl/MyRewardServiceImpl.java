package kr.co.thenet.fapee.setting.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RewardVO;
import kr.co.thenet.fapee.setting.service.MyRewardService;

@Service
public class MyRewardServiceImpl implements MyRewardService {

	@Autowired
	private MyRewardMapper rewardMapper;
	
	@Override
	public List<RewardVO> selectRewardList(BaseSearchVO form) throws Exception {
		return rewardMapper.selectRewardList(form);
	}
	
	@Override
	public RewardVO selectRewardSummary(RewardVO form) throws Exception {
		return rewardMapper.selectRewardSummary(form);
	}
	
	@Override
	public RewardVO selectRewardAccountInfo(RewardVO form) throws Exception {
		return rewardMapper.selectRewardAccountInfo(form);
	}
	
	@Override
	public int updateAccountInfo(RewardVO form) throws Exception {
		return rewardMapper.updateAccountInfo(form);
	}

}
