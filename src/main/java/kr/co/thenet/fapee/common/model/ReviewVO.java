package kr.co.thenet.fapee.common.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private long lookIdKey;
	private long mapIdKey;
	private long clickKey;
	private long userIdKey;
	private String userId;
	private String lookUserId;
	private String productIdKey;
	private String productName;
	private long price;
	
	private String mapUseYn;		/*Y/N*/
	private String salesStatus;		/*A/S, A이면 판매중, S는 판매중지*/
	
	private long reviewIdKey;
	private String reviewName;
	private String reviewMsg;
	private String reviewMsgHtml;
	private String reviewDate;

	private String imageSrcList;
	
	private String imageUrl;
	private String imageSrc;

	private List<ReviewImageVO> imageList;

	private long totalRows;
	private long rnk;
	
}
