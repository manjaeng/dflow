package kr.co.thenet.fapee.common.model;

import java.util.Date;
import java.util.List;

import lombok.*;

@Data
@NoArgsConstructor
public class UserVO {
	private long idKey;
	private long userKey;
	private String userId;
	private String password;
	private String userType;
	private String userName;
	private String mobile;
	private String email;
	private Date lastLoginDate;
	private Date joinDate;
	private String snsType;
	private int snsId;
	private String deviceId;
	private String status;
	private String adminYn;
	private String leaveReason;
	private String userFilterIdKey;
	private String bizNo;
	private String company;
	private String file ;
	private String fileName;
	private String fileUrl;

	private String bankName;
	private String bankCode;
	private String bankCount;

	private String postCode;
	private String fullAddr;
	private String firstAddr;
	private String secondAddr;

	private String checkAgree2;
	private String checkAgree1;
	private String marketingAgree;

	private String comPhone;

	private String rePassword ;
	private List<String> productType;
	private List<String> styleList;

}
