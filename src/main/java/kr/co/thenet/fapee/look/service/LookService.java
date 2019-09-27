package kr.co.thenet.fapee.look.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.LookVO;
import kr.co.thenet.fapee.common.util.EgovMap;

public interface LookService {
	
	List<EgovMap> selectLookStyleList() throws Exception; 
	
	List<EgovMap> selectLookAllList() throws Exception;
	
	boolean insertLook(LookVO look) throws Exception;
	
	List<EgovMap> selectLookProfileList(EgovMap egovMap) throws Exception;
	
	int updateLookInfo(EgovMap lookInfoMap) throws Exception;
	
	List<EgovMap> selectLookCommentList(EgovMap egovMap) throws Exception;

	boolean insertLookCommentInfo(EgovMap egovMap) throws Exception;

}
