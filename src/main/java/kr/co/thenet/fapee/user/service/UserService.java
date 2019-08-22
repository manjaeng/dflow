package kr.co.thenet.fapee.user.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.EgovMap;

public interface UserService {

	List<FP_User> selectUserList() throws Exception;

	FP_User selectUserInfo(EgovMap egovMap) throws Exception;

	int insertUserInfo(FP_User user) throws Exception;

	boolean selectUserLogin(EgovMap loginMap) throws Exception;
	
}
