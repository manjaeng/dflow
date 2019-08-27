package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserFilterVO {
	private long idKey;
	private String deviceId;
	private long userIdKey;
	private String gender;
	private String country;
	private String filterImages;
	private String favoriteStryle;
}
