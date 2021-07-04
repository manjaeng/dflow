package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlimSettingVO extends BaseSearchVO {
	private Long userIdKey;
	private String myLookComment;
	private String myCommentComent;
	private String myCoolComment;
	private String followMe;
	private String coolMyLook;
	private String appNotice;
	private String appEvent;
}
