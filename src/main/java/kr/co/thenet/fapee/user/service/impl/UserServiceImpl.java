package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.CommonFunc;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	
	@Override
	public List<FP_User> selectUserList() throws Exception {
		return userMapper.selectUserList();
	}

	@Override
	public FP_User selectUserInfo(EgovMap egovMap) throws Exception {
		return userMapper.selectUserInfo(egovMap);
	}

	@Override
	public int insertUserInfo(FP_User user) throws Exception {
		user.setPassword(CommonFunc.getHashedPassword(user.getPassword()));
		user.setUserType("2");
		user.setStatus("1");
		return userMapper.insertUserInfo(user);
	}

}
