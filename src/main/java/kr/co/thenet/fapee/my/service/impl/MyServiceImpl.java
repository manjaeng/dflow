package kr.co.thenet.fapee.my.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.my.service.MyService;
import kr.co.thenet.fapee.user.service.impl.UserMapper;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyMapper myMapper;

	@Autowired
	private UserMapper userMapper;

	@Override
	public EgovMap selectMyProfileInfo(long idKey) throws Exception {
		return myMapper.selectMyProfileInfo(idKey);
	}

	@Override
	public boolean updateMyProfileInfo(EgovMap profileMap) throws Exception {

		int a = myMapper.updateMyProfileInfo(profileMap);
		int b = userMapper.updateUserFilterCountryInfo(profileMap);

		if (a + b == 2) {
			return true;
		} else {
			return false;
		}
	}
}
