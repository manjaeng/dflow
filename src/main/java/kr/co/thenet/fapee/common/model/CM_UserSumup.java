package kr.co.thenet.fapee.common.model;

import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CM_UserSumup{
	private long userIdKey;
	private int loginFailCount;
	private Date lastLoginDate;
	private double rewardPoint;
	private String userLevel;
	private long lastLoginSeq;
}
