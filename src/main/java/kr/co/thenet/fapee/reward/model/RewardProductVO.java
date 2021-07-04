package kr.co.thenet.fapee.reward.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardProductVO {
	
	private long clickKey;
	private LocalDateTime clickDate;
  	private String pcode;
	private String pname;
	private long price;
	private long rewardRate;
	private long rewardAmount;
	private String sellerId;
	private String userId;
	private long reviewKey;
	private String rewardYn;
	private String rewardCode;
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;
	private long rewardCount;	
}
