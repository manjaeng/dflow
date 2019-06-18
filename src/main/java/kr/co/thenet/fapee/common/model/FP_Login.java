package kr.co.thenet.fapee.common.model;

import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FP_Login {
	private Long userIdKey;
	private String userId;
	private String password;
	private String authToken;
	private String deviceType;
	private String userType;
	private String userName;
	private HttpStatus httpStatus ;
}
