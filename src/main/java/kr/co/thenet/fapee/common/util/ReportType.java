package kr.co.thenet.fapee.common.util;

public enum ReportType {
	LOOK(1), USER(2);
	
	private final int type;
	private ReportType(int type) { this.type = type; }
	public int getType() { return type; }
}
