package kr.co.thenet.fapee.seller.model;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerSearchVO extends BaseSearchVO {
	private String bizOwnership;
	private String sellerStatus;
	private String approvalStatus;
}

