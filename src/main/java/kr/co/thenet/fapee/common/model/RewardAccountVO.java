package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardAccountVO {
	private Long userIdKey;
	private String rewardBank;
	private String rewardAccountNo;

	private long totalRows;
	private long rnk;
}
