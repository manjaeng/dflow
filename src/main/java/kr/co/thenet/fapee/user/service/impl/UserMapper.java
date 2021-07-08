package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface UserMapper {

	List<UserVO> selectUserList() throws Exception;
	
	UserVO selectUserInfo(EgovMap egovMap) throws Exception;
	UserVO selectUserCompany(UserVO user) throws Exception;

	int insertUserInfo(UserVO user) throws Exception;

	int insertUserFilterInfo(EgovMap introMap) throws Exception;
	
	EgovMap selectCountUserFilterInfo(EgovMap introMap) throws Exception;

	int insertUserStyleList(EgovMap styleMap) throws Exception;

	int updateUserLastLoginInfo(long idKey)throws Exception;

	int updateUserFilterDeviceInfo(UserVO user) throws Exception;

	int insertUserProfileInfo(UserVO user) throws Exception;
	
	int updateUserFilterCountryInfo(EgovMap profileMap) throws Exception;

	int updateUserInfo(EgovMap updateUserInfo) throws Exception;

	int updateUserWithdrawal(UserVO user) throws Exception;
	int insertUserCompany(UserVO user) throws Exception;
	int updatetUserCompany(UserVO user) throws Exception;
	int insertDfUserCodeMap(EgovMap profileMap) throws Exception;
	int deleteDfuserCodeMap(EgovMap profileMap) throws Exception;
	
}
