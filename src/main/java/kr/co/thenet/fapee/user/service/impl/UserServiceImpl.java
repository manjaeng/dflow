package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.CommonFunc;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.MailUtils;
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
	public UserVO selectUserCompany(UserVO user) throws Exception{
		return userMapper.selectUserCompany(user);
	}

	@Override
	public int insertUserInfo(UserVO user, HttpServletRequest req) throws Exception {
		user.setPassword(CommonFunc.getHashedPassword(user.getPassword()));
		user.setUserType("02");
		user.setStatus("1");
		user.setUserFilterIdKey(String.valueOf(req.getSession().getAttribute("temp_UserFilterIdKey")));
		
		int insertcount = userMapper.insertUserInfo(user);
		EgovMap egovMap = new EgovMap();
		egovMap.put("userId", user.getUserId());
		UserVO newUser = userMapper.selectUserInfo(egovMap);

		long idKey = newUser.getIdKey();
		user.setUserKey(idKey);

		userMapper.insertUserCompany(user);
		if(user.getProductType()!= null && !user.getProductType().isEmpty()) {
			for (String code : user.getProductType()) {
				egovMap.put("userKey", idKey);
				egovMap.put("grpCodeNo", "0001");
				egovMap.put("codeNo", code);
				userMapper.insertDfUserCodeMap(egovMap);
			}
		}
		if(user.getStyleList() !=null && !user.getStyleList().isEmpty()) {
			for (String code : user.getStyleList()) {
				egovMap.put("userKey", idKey);
				egovMap.put("grpCodeNo", "0002");
				egovMap.put("codeNo", code);
				userMapper.insertDfUserCodeMap(egovMap);
			}
		}
		try {
			String mailContent = MailUtils.getContent("join");
			if (!(StringUtils.isEmpty(user.getEmail()) || StringUtils.isEmpty(mailContent))) {
				MailUtils.sendMail(user.getEmail(), "[Dflow] 회원이 되신 것을 환영합니다.", mailContent);
			}
		}catch (Exception e){
			e.getMessage();
		}
		
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
	public boolean insertUserFilterInfo(EgovMap introMap, HttpServletRequest req) throws Exception {
		//EgovMap count = userMapper.selectCountUserFilterInfo(introMap);

		//if(Integer.valueOf(String.valueOf(count.get("count"))) < 1){
		int insertCount = userMapper.insertUserFilterInfo(introMap);

		if(insertCount == 1) {
			String[] StyleArray = ((String)introMap.get("style")).split(",");

			EgovMap styleMap = new EgovMap();
			styleMap.put("userFilterIdKey", introMap.get("idKey"));
			styleMap.put("styleArray", StyleArray);

			int insertStyleCount = userMapper.insertUserStyleList(styleMap);
			
			req.getSession().setAttribute("temp_UserFilterIdKey", introMap.get("idKey"));
			
			if(insertStyleCount > 0) {
				return true;
			}
		}
		//}
			
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

	@Override
	public String updateUserLoginInfo(EgovMap egovMap) throws Exception {
		
		String password = (String) egovMap.get("password");
		egovMap.put("password", CommonFunc.getHashedPassword(password));
		
		UserVO userVO = userMapper.selectUserInfo(egovMap);
		
		if(userVO == null) {
			return "mismatch";
		} else {
			String passwordNew = (String) egovMap.get("passwordNew");
			egovMap.put("password", CommonFunc.getHashedPassword(passwordNew));
			userMapper.updateUserInfo(egovMap);
			return "success";
		}
	}


	@Override
	public int updateUserWithdrawal(UserVO user) throws Exception {
		return userMapper.updateUserWithdrawal(user);
	}

}
