package kr.co.thenet.fapee.user.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.CommonFunc;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public FP_Login selectUserServiceLogin(FP_Login login, HttpServletRequest req) throws Exception {

		login.setHttpStatus(HttpStatus.BAD_REQUEST);

		if (login.getEmail() != null && login.getEmail().length() != 0 &&
			login.getPassword() != null && login.getPassword().length() != 0) {
			
			EgovMap map = new EgovMap();
			map.put("type","email");
			map.put("value",login.getEmail());
			
			FP_User user = userMapper.selectUserServiceInfo(map);

			if (user == null) {
				login.setHttpStatus(HttpStatus.NOT_FOUND);
			} else {
				
				if(user.getPassword() != null) {
					
					if (!user.getPassword().equals(CommonFunc.getHashedPassword(login.getPassword(), login.getEmail()))) {
					
						userMapper.updateUserServiceFailCount(user.getIdKey());
						login.setHttpStatus(HttpStatus.NOT_ACCEPTABLE);
						
					} else {
						//long tenYearTime = (new Date()).getTime() + (1000 * 60 * 60 * 24 * 365);
						//long loginTotalCount = user.getLoginTotalCount() + 1;
						
						//login.setAuthToken(AuthToken.getToken(user.getIdKey(), tenYearTime, user.getUserType(), loginTotalCount));
						login.setUserIdKey(user.getIdKey());
						login.setUserName(user.getUserName());
						login.setUserType(user.getUserType());
						
						//user.setLoginFailCount(0);
						user.setLastLoginDate(new Date());
						//user.setLoginTotalCount(loginTotalCount);
						//user.setLoginIp(CommonUtils.getRemoteIP(req));
						
						userMapper.updateUserServiceInfo(user);
						login.setHttpStatus(HttpStatus.OK);
					}
				}
			}
		}
		
		return login;
	}

	@Override
	public EgovMap selectUserServiceAdminLogin(FP_Login login, HttpServletRequest req) throws Exception {

		EgovMap egovMap = new EgovMap();
		
		if (login.getUserId() == null 
				|| login.getUserId().length() == 0 
				|| login.getPassword() == null
				|| login.getPassword().length() == 0) {
			
			egovMap.put("status", "f");
			egovMap.put("text", "ID,PW Null");
			return egovMap;
		}
		
		EgovMap map = new EgovMap();
		map.put("type","id");
		map.put("value",login.getUserId());
		
		FP_User user = userMapper.selectUserServiceInfo(map);

		if (user == null) {
			egovMap.put("status", "f");
			egovMap.put("text", "User Not Found");
			return egovMap;
		} 
			
			
		if (!user.getPassword().equals(CommonFunc.getHashedPassword(login.getPassword(), login.getUserId()))) {
			
			userMapper.updateUserServiceFailCount(user.getIdKey());
			egovMap.put("status", "f");
			egovMap.put("text", "PW Wrong");
			return egovMap;
			
		}
			
		if(!"1".equals(user.getUserType())) {
			egovMap.put("status", "f");
			egovMap.put("text", "Not Acceptable");
			return egovMap;
		}
			
		//user.setLoginFailCount(0);
		user.setLastLoginDate(new Date());
		//user.setLoginTotalCount(user.getLoginTotalCount() + 1);
		//user.setLoginIp(CommonUtils.getRemoteIP(req));
		
		user.setPassword("");
		req.getSession().setAttribute("loginInfo", user);
		
		userMapper.updateUserServiceInfo(user);
		
		egovMap.put("status", "t");
		return egovMap;
		
	}
	
	@Override
	public List<FP_User> selectUserServiceList() throws Exception {
		return userMapper.selectUserServiceList();
	}

	@Override
	public HttpStatus insertUserServiceJoin(FP_User user) throws Exception {
		
		if (user.getUserId() == null || user.getUserId().length() == 0 ||
			user.getEmail() == null || user.getEmail().length() == 0 ||
			user.getPassword() == null || user.getPassword().length() == 0) {
			return HttpStatus.BAD_REQUEST;
		}
		
		if (userMapper.selectUserServiceCount(user) > 0) {
			return HttpStatus.CONFLICT;
		}
		
		user.setPassword(CommonFunc.getHashedPassword(user.getPassword(), user.getEmail()));
		
		userMapper.insertUserServiceInfo(user);
		return HttpStatus.OK;
		
	}

	@Override
	public FP_User selectUserInfo(EgovMap egovMap) throws Exception {
		return userMapper.selectUserInfo(egovMap);
	}

}
