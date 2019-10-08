package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface HomeMapper {
	
	public List<HashMap<String, Object>> selectHomeUserList() throws Exception;
	
	public boolean insertReport(EgovMap egovMap) throws Exception;

	public List<EgovMap> selectHomeSearchList(EgovMap egovMap) throws Exception;
	
	public List<EgovMap> selectReportList(int reportType) throws Exception;
}
