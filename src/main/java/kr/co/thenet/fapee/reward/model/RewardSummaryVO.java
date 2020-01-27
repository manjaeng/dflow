package kr.co.thenet.fapee.reward.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardSummaryVO {
	
	private String yyyyMm;
	private long idKey;
	private String sellerId;
	private long sellerCount;
	private long userCount;
	private long productCount;
	private long rewardAmount;
	private long taxAmount;
	private long totalAmount;
	private long depositAmount;
	private long undepositAmount;
	private long rewardCount;
	private String settleStatus;
	private String settleStatusName;
	private String billStatus;
	private String depositStatus;
	
	private String items;
	
	private String lastUpdateId;

}
