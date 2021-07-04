package kr.co.thenet.fapee.common.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVO {
	private Long lookIdKey;
	private Long mapIdKey;
	private Long clickKey;
	private Long userIdKey;
	private String userImageUrl;
	private String userId;
	private String lookUserId;
	private String productIdKey;
	private String productName;
	private String productImageUrl;
	private long price;
	
	private String mapUseYn;		/*Y/N*/
	private String salesStatus;		/*A/S, A이면 판매중, S는 판매중지*/
	
	private Long reviewIdKey;
	private String rewardCode;
	private String reviewName;
	private String reviewMsg;
	private String reviewMsgHtml;
	private String reviewDate;
	private String settleYn;
	private String rewardYn;
	
	private String clickReviewYn;

	private String imageSrcList;
	
	private String imageUrl;
	private String imageSrc;

	private List<ReviewImageVO> imageList;

	private long totalRows;
	private long rnk;
	
	private boolean isOwner = false;
	private boolean isDeletable = false;
	
}
