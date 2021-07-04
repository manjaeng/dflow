package kr.co.thenet.fapee.match.service;

import java.util.List;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.model.MatchVO;

public interface MatchService {
	
    List<EgovMap> selectMatchStyleList() throws Exception; 
	
	List<EgovMap> selectMatchAllList() throws Exception;
	
	boolean insertMatch(MatchVO Match) throws Exception;
	
	List<EgovMap> selectMatchProfileList(EgovMap egovMap) throws Exception;
	
	int updateMatchInfo(EgovMap MatchInfoMap) throws Exception;
	
	EgovMap selectMatchDetail(int idKey) throws Exception;
	
	List<EgovMap> selectMatchCommentList(EgovMap egovMap) throws Exception;

	boolean insertMatchCommentInfo(EgovMap egovMap) throws Exception;

	boolean insertMatchCoolInfo(EgovMap egovMap) throws Exception;

	boolean deleteMatchCoolInfo(EgovMap egovMap) throws Exception;

	boolean insertMatchScrapInfo(EgovMap egovMap) throws Exception;

	boolean deleteMatchScrapInfo(EgovMap egovMap) throws Exception;

	List<EgovMap> selectMatchCoolList(EgovMap egovMap) throws Exception;
}
