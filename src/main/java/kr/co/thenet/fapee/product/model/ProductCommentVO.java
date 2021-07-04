package kr.co.thenet.fapee.product.model;

import java.time.LocalDateTime;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCommentVO {
	private long csKey;  //코멘트식별키
	private String pcode;  //제품코드
	private String comment;  //내용
	private String deleteYn;  //삭제여부
	private String createId;  //생성자ID
	private String createName;  //생성자명
	private LocalDateTime createDate;  //생성일시
	private String lastUpdateId;  //최종수정자ID
	private LocalDateTime lastUpdateDate;  //최종수정일시
}
