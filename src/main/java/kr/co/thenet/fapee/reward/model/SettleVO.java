package kr.co.thenet.fapee.reward.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SettleVO {
	private long termsKey;  //약관식별키
	private String title;  //제목
	private String summary;  //약관요약
	private String detail;  //약관상세
	private String createId;  //생성자ID
	private LocalDateTime createDate;  //생성일시
	private String lastUpdateId;  //최종수정자ID
	private LocalDateTime lastUpdateDate;  //최종수정일시
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;
}
