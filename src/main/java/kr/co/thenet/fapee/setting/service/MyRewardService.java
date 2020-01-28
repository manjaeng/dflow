package kr.co.thenet.fapee.setting.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RewardVO;

public interface MyRewardService {
	
	List<RewardVO> selectRewardList(BaseSearchVO form) throws Exception;
	
	RewardVO selectRewardSummary(RewardVO form) throws Exception;
	
	RewardVO selectRewardAccountInfo(RewardVO form) throws Exception;
	
	int updateAccountInfo(RewardVO form) throws Exception;

}
