package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.CM_User;
import kr.co.thenet.fapee.common.model.CM_UserSumup;
import kr.co.thenet.fapee.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	@Override
	public List<CM_User> selectUserServiceList() throws Exception {
		return userMapper.selectUserServiceList();
	}

	@Override
	public CM_User selectUserServiceInfo(String userId) throws Exception {
		return userMapper.selectUserServiceInfo(userId);
	}

	@Override
	public CM_UserSumup selectUserServiceSumupInfo(long idKey) throws Exception {
		return userMapper.selectUserServiceSumupInfo(idKey);
	}

	@Override
	public void updateUserServiceSumupInfo(CM_UserSumup existUserSumup) throws Exception {
		userMapper.updateUserServiceSumupInfo(existUserSumup);
	}

}
