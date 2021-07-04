package kr.co.thenet.fapee.product.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductHistoryVO {
	private String pcode;  //상품코드
	private LocalDateTime changeDate;  //변경일시
	private String pname;  //상품명
	private Long price;  //판매가
	private Integer feeRate;  //수수료율
	private Integer rewardRate;  //리워드율
	private String linkUrl;  //상품URL
	private String inspectionStatus;  //검수상태
	private String inspectionStatusName;  //검수상태
	private String salesStatus;  //판매상태
	private String salesStatusName;  //판매상태
	private String changeReason;  //변경사유
	private Long idKey;  //변경요약
	private String originData;  //원데이터
	private String lastUpdateId;  //최종수정자ID
	private String lastUpdateName;  //최종수정자명
	private LocalDateTime lastUpdateDate;  //최종수정일시

	private String shoppingMallName;  //업체명

	private long seq; // 순번
	private long rnk;
	private long totalRows;
	
}
