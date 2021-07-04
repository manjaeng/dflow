package kr.co.thenet.fapee.home.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.thenet.fapee.common.util.EgovMap;

public interface HomeService {

	List<HashMap<String, Object>> selectHomeUserList() throws Exception;

	boolean insertReport(EgovMap egovMap) throws Exception;
	List<EgovMap> selectHomeSearchList(EgovMap egovMap)  throws Exception;
	List<EgovMap> selectReportList(int reportType) throws Exception;

	Map<String,String> selectVersion() throws Exception;

	//최적 컨텐츠 3개.
	List<EgovMap> selectLookListByFit(EgovMap egovMap) throws Exception;

	//연관 컨텐츠 20개.
	List<EgovMap> selectLookListByMaybe(EgovMap egovMap) throws Exception;

	//24시간 이내에 많이 등록된 태그.
	EgovMap selectRecentTag() throws Exception;

	//24시간 이내에 많이 등록된 태그에 의한 룩 목록.
	List<EgovMap> selectLookListByRecentTag(EgovMap egovMap) throws Exception;

}
