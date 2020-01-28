package kr.co.thenet.fapee.setting.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RewardVO;

@Mapper
public interface MyRewardMapper {
	
	List<RewardVO> selectRewardList(BaseSearchVO form) throws Exception;
	
	RewardVO selectRewardSummary(RewardVO form) throws Exception;
	
	RewardVO selectRewardAccountInfo(RewardVO form) throws Exception;
	
	int updateAccountInfo(RewardVO form) throws Exception;
	
}
