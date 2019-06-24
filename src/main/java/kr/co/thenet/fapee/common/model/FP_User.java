package kr.co.thenet.fapee.common.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FP_User {
	private long idKey;
	private String userId;
	private String password;
	private String userType;
	private String userName;
	private String mobileNumber;
	private String email;
	private long loginTotalCount;
	private int loginFailCount;
	private Date lastLoginDate;
	private Date joinDate;
	private String loginIp;
	private String snsType;
	private String snsId;
	private String status;
}
