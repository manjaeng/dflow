package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CM_Login{
	private String userId;
	private String password;
	private String authToken;
	private String uniqueId;
	private String pushKey;
	private String deviceType;
	private Long userIdKey;
	private String userType;
	private String userName;
	private String snsType;
	private String snsId;
	private String version;
	private String upgradeUrl;
}
