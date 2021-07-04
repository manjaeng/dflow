package kr.co.thenet.fapee.product.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductLookVO {
	private LocalDateTime postDate;  //게시일시
	private String linkUrl;  //상품URL
	private String pcode;  //상품코드
	private String pname;  //상품명
	private String lookIdKey;  //상품명
	private String shoppingMallName;  //상품명
	private String postStatus;  //게시상태
	private String postStatusName;  //게시상태
	private Long totalClickCount;  //누적클릭수
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;
	
}
