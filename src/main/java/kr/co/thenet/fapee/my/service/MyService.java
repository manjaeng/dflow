package kr.co.thenet.fapee.my.service;

import java.util.List;

import kr.co.thenet.fapee.common.util.EgovMap;

public interface MyService {
	EgovMap selectMyProfileInfo(long idKey) throws Exception;

	boolean updateMyProfileInfo(EgovMap profileMap) throws Exception;

	boolean selectMyFollowingCount(EgovMap egovMap) throws Exception;

	boolean insertMyFollwInfo(EgovMap egovMap) throws Exception;

	boolean deleteMyFollwInfo(EgovMap egovMap) throws Exception;

	List<EgovMap> selectMyFollowList(EgovMap egovMap) throws Exception;

}
