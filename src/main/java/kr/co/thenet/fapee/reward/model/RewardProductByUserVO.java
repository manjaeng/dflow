package kr.co.thenet.fapee.reward.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardProductByUserVO {
	
	private long seq;
	private String pcode;
	private long price;
	private long rewardRate;
	private long itemAmount;
	private String userId;
	private long clickCount;
	private long rewardCount;
	private long rewardAmount;
	
}
