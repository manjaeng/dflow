package kr.co.thenet.fapee.reward.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardVO {
	
	private String yyyyMm;
	private long idKey;
	private String sellerId;
	private String shoppingMallName;
	private long userCount;
	private long productCount;
	private long rewardAmount;
	private long taxAmount;
	private long totalAmount;
	private long rewardCount;
	private String settleStatus;
	private String settleStatusName;
	private String processStatus;
	private String processStatusName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate processDate;
	private String billStatus;
	private String billStatusName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate billIssueDate;
	private String depositStatus;
	private String depositStatusName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate depositDate;
	private long depositAmount;
	private LocalDateTime settleApprovalDate;

	private String items;
	
	private String settleApprovalId;
	private String settleCompleteDate;
	private String settleCompleteId;
	private String settleHistory;
	private String billIssueNo;
	private String depositHistory;
	private String depositUpdateDate;
	private String depositUpdateId;
	private String createId;
	private String createDate;
	private String lastUpdateId;
	private String lastUpdateDate;
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;
	private long depositCount;
	private long undepositCount;

}
