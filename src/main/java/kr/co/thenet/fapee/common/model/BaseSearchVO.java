package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BaseSearchVO {
	private Long idKey;
	private Long lookIdKey;
	private Long clickKey;
	private String productIdKey;
	private String dataKey;
	private String userId;
	private String type;
	
	private String frDate;
	private String toDate;
	
	private String year;
	private String month;
	private String yyyyMm;

	private String schField;
	private String schWord;

	private String tab;

	private int page = 1;
	private int rows = 10;
	private long totalRows = 0;
	private boolean isMorePage;

	private long frRow = 1;
	private long toRow = 10;
	
	public int getFrRow() {
		return (page - 1) * rows + 1;
	}
	
	public int getToRow() {
		return page * rows;
	}
	
	public boolean isMorePage() {
		return totalRows > getToRow();
	}
}
