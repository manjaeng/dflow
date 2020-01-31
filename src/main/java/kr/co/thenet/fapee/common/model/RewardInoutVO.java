package kr.co.thenet.fapee.common.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RewardInoutVO {
	
	private long wdKey;
	private String inOutFlag;
    @JsonFormat(pattern = "yyyy-MM-dd")
	private Date inquireDate;
	private long idKey;
	private String userId;
	private long amount;
	private String bankName;
	private String accountNo;
	private String accountOwner;
	private String processStatus;
	private String processStatusName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date processDate;
	private String remark;
	private String createId;
	private String createDate;
	private String lastUpdateId;
	private String lastUpdateName;
	private String lastUpdateDate;
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;
	private long waitCount;
	private long completeCount;
	private long incompleteCount;
	
	private long cnt;
	private long inTotalAmount;
	private long outTotalAmount;

}
