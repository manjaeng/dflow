package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface HomeMapper {
	
	public List<HashMap<String, Object>> selectHomeUserList() throws Exception;
	
	public boolean insertReport(EgovMap egovMap) throws Exception;

	public List<EgovMap> selectHomeSearchList(EgovMap egovMap) throws Exception;
	
	public List<EgovMap> selectReportList(int reportType) throws Exception;

	public Map<String,String> selectVersion() throws Exception;

	//최적 컨텐츠 3개.
	List<EgovMap> selectLookListByFit(EgovMap egovMap) throws Exception;

	//연관 컨텐츠 3개.
	List<EgovMap> selectLookListByMaybe(EgovMap egovMap) throws Exception;

	EgovMap selectRecentTag() throws Exception;

	List<EgovMap> selectLookListByRecentTag(EgovMap egovMap) throws Exception;

}
