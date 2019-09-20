package kr.co.thenet.fapee.common.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LookVO {
	private long idKey;
	private long userIdKey;
	private int styleIdKey;
	private String content;
	private List<String> tags;
	private List<String> images;
}
