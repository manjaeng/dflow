package kr.co.thenet.fapee.common.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlimVO extends BaseSearchVO {
	private String grp;
	private String alimType;
	private String title;
	private String content;
	private String linkUrl;
	private String linkImageUrl;
	private Long receiverIdKey;
	private String receiverUserId;
	private LocalDateTime receiveDate;
	private Long senderIdKey;
	private String senderUserId;
	private String senderNickName;
	private String senderImageUrl;
	private LocalDateTime sendDate;
	private String elapsedTime;
}
