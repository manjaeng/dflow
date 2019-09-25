package kr.co.thenet.fapee.look.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.LookVO;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface LookMapper {
	List<EgovMap> selectLookStyleList() throws Exception;
	List<EgovMap> selectLookAllList() throws Exception;
	
	boolean insertLook(LookVO look) throws Exception;
	boolean insertLookImage(LookVO look) throws Exception;
	boolean insertLookTags(LookVO look) throws Exception;
	List<EgovMap> selectLookProfileList(EgovMap egovMap) throws Exception;
	
	int updateLookInfo(EgovMap updateLookInfo) throws Exception;
}
