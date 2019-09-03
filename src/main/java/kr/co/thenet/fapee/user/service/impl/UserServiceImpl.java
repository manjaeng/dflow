package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.CommonFunc;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public List<UserVO> selectUserList() throws Exception {
		return userMapper.selectUserList();
	}

	@Override
	public UserVO selectUserInfo(EgovMap egovMap) throws Exception {
		return userMapper.selectUserInfo(egovMap);
	}

	@Override
	public int insertUserInfo(UserVO user) throws Exception {
		user.setPassword(CommonFunc.getHashedPassword(user.getPassword()));
		user.setUserType("2");
		user.setStatus("1");
		
		int insertcount = userMapper.insertUserInfo(user);
		userMapper.updateUserFilterDeviceInfo(user);
		userMapper.insertUserProfileInfo(user);
		
		return insertcount;
	}

	@Override
	public UserVO selectUserLogin(EgovMap loginMap) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("password", CommonFunc.getHashedPassword((String)loginMap.get("password")));
		
		String id = (String)loginMap.get("userId");
		
		if(CommonUtils.isNumeric(id)) {
			egovMap.put("mobile", id);
		} else {
			egovMap.put("userId", id);
		}
		
		return userMapper.selectUserInfo(egovMap);
	}
	
	@Override
	public boolean insertUserFilterInfo(EgovMap introMap) throws Exception {
		
		int insertCount = userMapper.insertUserFilterInfo(introMap);
		
		if(insertCount == 1) {

			String[] StyleArray = ((String)introMap.get("style")).split(",");
			
			EgovMap styleMap = new EgovMap();
			styleMap.put("userFilterIdKey", introMap.get("idKey"));
			styleMap.put("styleArray", StyleArray);
			
			int insertStyleCount = userMapper.insertUserStyleList(styleMap);
			
			if(insertStyleCount > 0) {
				return true;
			}
		}
			
		return false;
	
	}

	@Override
	public int updateUserLastLoginInfo(long idKey) throws Exception {
		return userMapper.updateUserLastLoginInfo(idKey);
	}

	@Override
	public int updateUserInfo(EgovMap userInfoMap) throws Exception {
		return userMapper.updateUserInfo(userInfoMap);
	}
}
