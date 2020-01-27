package kr.co.thenet.fapee.product.model;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private String pcode;  //상품코드
	private Long idKey;  //셀러식별키
	private String sellerId;  //셀러ID
	private String shoppingMallName;  //쇼핑몰명
	private String shoppingMallUrl;  //쇼핑몰URL
	private String pname;  //상품명
	private String intro;  //상품소개
	
	private String salesDateFr;	//판매기간시작
	private String salesDateTo;	//판매기간종료
	
	private String salesStatus;  //판매상태
	private String salesStatusName;  //판매상태명
	private String stopReason;  //판매중지사유
	private String chargerName;  //상품담당자명
	private String chargerTel;  //상품담당자전화
	private String chargerEmail;  //상품담당자이메일
	private long price;  //판매가
	private int feeRate;  //수수료율
	private int rewardRate;  //리워드율
	private String mainImageId;  //대표이미지
	private String productImageId1;  //상세이미지1
	private String productImageId2;  //상세이미지12
	private String productImageId3;  //상세이미지13
	private String productImageId4;  //상세이미지14
	private String linkUrl;  //상품URL
	private String requestComment;  //요청사항
	private String inspectionStatus;  //검수상태
	private String inspectionStatusName;  //검수상태명
	private String inspectionId;  //검수자ID
	private String inspectionName;  //검수자명
	private String rejectReason;  //반려사유
	private LocalDateTime inspectionDate;  //검수일시
	private LocalDateTime inspectionApplyDate;  //검수요청일시
	private String createId;  //등록자ID
	private String createName;  //등록자명
	private LocalDateTime createDate;  //등록일시
	private String lastUpdateId;  //최종수정자ID
	private LocalDateTime lastUpdateDate;  //최종수정일시
	
	private String mainImageName;  //대표이미지
	private String productImageName1;  //상세이미지1
	private String productImageName2;  //상세이미지12
	private String productImageName3;  //상세이미지13
	private String productImageName4;  //상세이미지14
	
	private MultipartFile mainImageFile;  //대표이미지
	private MultipartFile productImageFile1;  //상세이미지1
	private MultipartFile productImageFile2;  //상세이미지12
	private MultipartFile productImageFile3;  //상세이미지13
	private MultipartFile productImageFile4;  //상세이미지14

	private long lookCount;		//LOOK수
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;

	private long saveRows;
	private long rejectRows;
	private long waitRows;
	private long salesRows;
	private long stopRows;
	
}
