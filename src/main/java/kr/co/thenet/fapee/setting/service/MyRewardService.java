package kr.co.thenet.fapee.setting.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RewardInoutVO;
import kr.co.thenet.fapee.common.model.RewardAccountVO;

public interface MyRewardService {
	
	List<RewardInoutVO> selectRewardList(BaseSearchVO form) throws Exception;
	
	RewardInoutVO selectRewardSummary(BaseSearchVO form) throws Exception;
	
	RewardAccountVO selectRewardAccountInfo(BaseSearchVO form) throws Exception;
	
	int updateAccountInfo(RewardAccountVO form) throws Exception;
	
	int insertRewardWithdrawal(RewardInoutVO form) throws Exception;

}
