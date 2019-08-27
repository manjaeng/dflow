package kr.co.thenet.fapee.common.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SessionVO {
	private long idKey;
	private String userId;
	private String userType;
	private String mobile;
	private String email;
	private Date lastLoginDate;
	private Date joinDate;
	private String snsType;
	private int snsId;
	private String deviceId;
}
