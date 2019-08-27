package kr.co.thenet.fapee.user.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.EgovMap;

public interface UserService {
	
	List<UserVO> selectUserList() throws Exception;

	UserVO selectUserInfo(EgovMap egovMap) throws Exception;

	int insertUserInfo(UserVO user) throws Exception;

	UserVO selectUserLogin(EgovMap loginMap) throws Exception;
	
	boolean insertUserFilterInfo(EgovMap introMap) throws Exception;

	int updateUserLastLoginInfo(long idKey) throws Exception;
	
}
