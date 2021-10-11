package kr.co.thenet.fapee.my.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.ModelVO;
import kr.co.thenet.fapee.common.model.ProductVO;
import kr.co.thenet.fapee.common.util.EgovMap;

public interface MyService {
	EgovMap selectMyProfileInfo(long idKey) throws Exception;

	List<EgovMap> selectUserModelInfo(long idKey) throws Exception;

	boolean  updateUserModelMap(EgovMap profileMap) throws Exception;

	boolean updateMyProfileInfo(EgovMap profileMap) throws Exception;

	boolean selectMyFollowingCount(EgovMap egovMap) throws Exception;

	boolean insertMyFollwInfo(EgovMap egovMap) throws Exception;

	boolean deleteMyFollwInfo(EgovMap egovMap) throws Exception;

	List<EgovMap> selectMyFollowList(EgovMap egovMap) throws Exception;

	EgovMap selectMyFollowCount(EgovMap egovMap) throws Exception;

	EgovMap selectMyModel(EgovMap egovMap) throws Exception;

	boolean updateModelInfo(EgovMap egovMap) throws Exception;

	boolean insertModel(ProductVO modelVO) throws Exception;

}
