package kr.co.thenet.fapee.home.service;

import java.util.HashMap;
import java.util.List;

import kr.co.thenet.fapee.common.util.EgovMap;

public interface HomeService {

	List<HashMap<String, Object>> selectHomeUserList() throws Exception;

	boolean insertReport(EgovMap egovMap) throws Exception;
	List<EgovMap> selectHomeSearchList(EgovMap egovMap)  throws Exception;
	List<EgovMap> selectReportList(int reportType) throws Exception;
}
