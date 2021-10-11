package kr.co.thenet.fapee.product.model;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductSearchVO extends BaseSearchVO {
	private String bizOwnership;
	private String inspectionStatus;
	private String salesStatus;
	private String productNo;
}

