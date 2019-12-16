package kr.co.thenet.fapee.match.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.MatchVO;
import kr.co.thenet.fapee.common.util.EgovMap;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MatchMapper {
	List<EgovMap> selectmatchStyleList() throws Exception;
	
	List<EgovMap> selectMatchAllList() throws Exception;
	
	boolean insertmatch(MatchVO match) throws Exception;
	
	boolean insertmatchImage(MatchVO match) throws Exception;
	
	boolean insertmatchTags(MatchVO match) throws Exception;
	
	List<EgovMap> selectmatchProfileList(EgovMap egovMap) throws Exception;
	
	int updatematchInfo(EgovMap updatematchInfo) throws Exception;
	
	EgovMap selectmatchDetail(int idKey) throws Exception;
	List<EgovMap> selectmatchCommentList(EgovMap egovMap) throws Exception;

	int insertmatchCommentInfo(EgovMap egovMap) throws Exception;

	int updatematchCommentInfo(EgovMap egovMap) throws Exception;

	int insertmatchCoolInfo(EgovMap egovMap) throws Exception;

	int deletematchCoolInfo(EgovMap egovMap) throws Exception;

	int insertmatchScrapInfo(EgovMap egovMap) throws Exception;

	int deletematchScrapInfo(EgovMap egovMap) throws Exception;

	List<EgovMap> selectmatchCoolList(EgovMap egovMap) throws Exception;
}
