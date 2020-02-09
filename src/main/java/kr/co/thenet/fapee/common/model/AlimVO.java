package kr.co.thenet.fapee.common.model;

import java.time.LocalDateTime;

import org.springframework.util.StringUtils;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlimVO extends BaseSearchVO {
	private String grp;					//ME 또는 NOTICE
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

    public static AlimVO of(String grp, String alimType, String title, 
    						String linkUrl, String linkImageUrl, Long receiverIdKey, Long senderIdKey) {
    	AlimVO vo = new AlimVO();
    	vo.setGrp(grp);
    	vo.setAlimType(alimType);
    	vo.setTitle(title);
    	vo.setContent(title);
    	vo.setLinkUrl(linkUrl);
    	vo.setLinkImageUrl(linkImageUrl);
    	vo.setReceiverIdKey(receiverIdKey);
    	vo.setSenderIdKey(senderIdKey);
    	
        return vo;
    }

    public static AlimVO of(String grp, String alimType, String title, String content, 
    						String linkUrl, String linkImageUrl, Long receiverIdKey, Long senderIdKey) {
    	//content가 없으면 title 내용으로 설정.
    	if(StringUtils.isEmpty(content)) content = title;
    	
    	AlimVO vo = new AlimVO();
    	vo.setGrp(grp);
    	vo.setAlimType(alimType);
    	vo.setTitle(title);
    	vo.setContent(content);
    	vo.setLinkUrl(linkUrl);
    	vo.setLinkImageUrl(linkImageUrl);
    	vo.setReceiverIdKey(receiverIdKey);
    	vo.setSenderIdKey(senderIdKey);
    	
        return vo;
    }
	
	
}
