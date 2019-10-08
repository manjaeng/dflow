package kr.co.thenet.fapee.common.util;

public enum ReportType {
	LOOK(0), USER(1);
	
	private final int type;
	private ReportType(int type) { this.type = type; }
	public int getType() { return type; }
}
