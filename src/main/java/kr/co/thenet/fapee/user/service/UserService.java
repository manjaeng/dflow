package kr.co.thenet.fapee.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.EgovMap;

public interface UserService {
	
	List<UserVO> selectUserList() throws Exception;

	UserVO selectUserInfo(EgovMap egovMap) throws Exception;

	int insertUserInfo(UserVO user, HttpServletRequest req) throws Exception;

	UserVO selectUserLogin(EgovMap loginMap) throws Exception;
	
	boolean insertUserFilterInfo(EgovMap introMap, HttpServletRequest req) throws Exception;

	int updateUserLastLoginInfo(long idKey) throws Exception;
	
	int updateUserInfo(EgovMap userInfoMap) throws Exception;
	
	String updateUserLoginInfo(EgovMap egovMap) throws Exception;
	
	int updateUserWithdrawal(UserVO user) throws Exception;

}