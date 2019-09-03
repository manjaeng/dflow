package kr.co.thenet.fapee.my.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface MyMapper {
	EgovMap selectMyProfileInfo(long idKey) throws Exception;

	int updateMyProfileInfo(EgovMap profileMap) throws Exception;

	int selectMyFollowingCount(EgovMap egovMap) throws Exception;
	
	int insertMyFollwInfo(EgovMap egovMap) throws Exception;

	int deleteMyFollwInfo(EgovMap egovMap) throws Exception;

	List<EgovMap> selectMyFollowList(EgovMap egovMap) throws Exception;
}
