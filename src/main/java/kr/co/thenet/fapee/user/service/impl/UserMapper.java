package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import kr.co.thenet.fapee.common.model.CM_User;
import kr.co.thenet.fapee.common.model.CM_UserSumup;

@Mapper
public interface UserMapper {

	List<CM_User> selectUserServiceList() throws Exception;

	CM_User selectUserServiceInfo(String userId) throws Exception;

	CM_UserSumup selectUserServiceSumupInfo(long idKey) throws Exception;

	void updateUserServiceSumupInfo(CM_UserSumup existUserSumup) throws Exception;

}
