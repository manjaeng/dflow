package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CM_User {
	private long idKey;
	private String userId;
	private String password;
	private String userType;
	private String userName;
	private String mobileNumber;
	private String email;
	private String snsType;
	private String snsId;
	private String status;
}
