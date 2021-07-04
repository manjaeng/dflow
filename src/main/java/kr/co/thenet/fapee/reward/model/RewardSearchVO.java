package kr.co.thenet.fapee.reward.model;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardSearchVO extends BaseSearchVO {

	private String rewardYn;
	private String processStatus;
	
}
