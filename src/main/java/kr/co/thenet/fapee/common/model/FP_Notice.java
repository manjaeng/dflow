package kr.co.thenet.fapee.common.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FP_Notice {
	private long idKey; 
	private long userIdKey;
	private Date createDate;
	private String title;
	private String content;
	private int viewCount;
	
	@JsonFormat(pattern="yyyy/MM/dd")
	private Date startDate;
	private Date endDate;
}
