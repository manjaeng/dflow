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
public class WithdrawalVO {
	
	private long wdKey;
	private LocalDateTime inquireDate;
	private long idKey;
	private String userId;
	private long amount;
	private String bankName;
	private String accountNo;
	private String accountOwner;
	private String processStatus;
	private String processStatusName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate processDate;
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

}
