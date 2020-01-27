package kr.co.thenet.fapee.seller.model;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SellerUserVO {
	private long idKey; // 회원식별키
	private String userId; // 회원ID
	private String email; // 회원이메일
	private String userName; // 회원ID
	private String status; // 회원ID
	private String password; // 회원ID
	private String newPassword; // 회원ID
	private String newPassword2; // 회원ID
	private String userStatus; // 회원상태
	private String shoppingMallName; // 쇼핑몰명
	private String sellerStatus; // 셀러활성상태
	private String sellerStatusName; // 셀러활성상태
	private String shoppingMallUrl; // 쇼핑몰URL
	private String bizNo; // 사업자등록번호
	private String bizAddr; // 사업장주소
	private String bizOwnership; // 개인법인구분
	private String bizOwnershipName; // 개인법인구분
	private String bizType; // 업태
	private String bizType1; // 업태
	private String bizType2; // 업종
	private String bizOwner; // 대표자명
	private String bizEmail; // 대표이메일
	private String bizTel; // 대표전화번호
	private String bizFax; // 대표FAX
	private String settleEmpName; // 정산담당자명
	private String settleEmpDept; // 정산담당자부서
	private String settleEmpDuty; // 정산담당자직책
	private String settleEmpTel; // 정산담당전화번호
	private String settleEmpEmail; // 정산담당이메일
	private String settleBank; // 은행코드
	private String settleBankName; // 은행명
	private String settleAccountNo; // 계좌번호
	private String settleAccountOwner; // 예금주
	private String settleTaxbillEmail; // 세금계산서발행이메일
	private String bizCertAttachId; // 사업자등록증또는신분증사본
	private String onlineSalesAttachId; // 통신판매업신고증
	private String accountAttachId; // 계좌사본
	private String evidenceAttachId; // 증빙서류
	private String idnCertAttachId; // 외국인신분증
	private String approvalId; // 승인자ID
	private String approvalName; // 승인자명(MCP)
	private LocalDateTime approvalDate; // 승인일
	private String approvalStatus; // 셀러승인상태
	private String approvalStatusName; // 셀러승인상태
	private String rejectReason; // 반려사유
	private String createId; // 생성자ID
	private LocalDateTime createDate; // 생성일시
	private String lastUpdateId; // 최종수정자ID
	private LocalDateTime lastUpdateDate; // 최종수정일시
	private LocalDateTime lastLoginDate; // 최종로그인일시
	private String lastLoginIp; // 최종로그인IP

	private MultipartFile bizCertFile; // 사업자등록증또는신분증사본
	private MultipartFile onlineSalesFile; // 통신판매업신고증
	private MultipartFile accountFile; // 계좌사본
	private MultipartFile evidenceFile; // 증빙서류
	private MultipartFile idnCertFile; // 외국인신분증

	private String bizCertFileName; // 사업자등록증또는신분증사본
	private String onlineSalesFileName; // 통신판매업신고증
	private String accountFileName; // 계좌사본
	private String evidenceFileName; // 증빙서류
	private String idnCertFileName; // 외국인신분증사본
	
	//해외 사업자 관련 추가 정보.
	private String abroadYn; // 외국인사업자여부
	private String abBizNo;  //해외사업자번호
	private String abTaxIdnNo;  //Tax Identification Number
	private String abNationCode;  //사업장국가코드
	private String abNationName;  //사업장국가입력명
	private String abNationName2;  //사업장국가표시명
	private String abBizAddr;  //해외사업장주소
	private String abBeneficiaryName;  //Beneficiary Name 
	private String abBankName;  //Bank Name 
	private String abBranchName;  //Branch Name 
	private String abSwiftCode;  //ABA No./Swift Code 
	private String abAccountNumber;  //Account Number 
	
	private long seq; // 순번
	private long rnk;
	private long totalRows;
	private long waitRows;
	private long rejectRows;
	
}

