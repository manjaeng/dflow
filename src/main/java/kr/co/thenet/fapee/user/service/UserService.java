package kr.co.thenet.fapee.user.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.CM_User;
import kr.co.thenet.fapee.common.model.CM_UserSumup;

public interface UserService {

	List<CM_User> selectUserServiceList() throws Exception;

	CM_User selectUserServiceInfo(String userId) throws Exception;

	CM_UserSumup selectUserServiceSumupInfo(long idKey) throws Exception;

	void updateUserServiceSumupInfo(CM_UserSumup existUserSumup) throws Exception;

}
