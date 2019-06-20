package kr.co.thenet.fapee.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.EgovMap;

public interface UserService {

	FP_Login selectUserServiceLogin(FP_Login login, HttpServletRequest req) throws Exception;

	EgovMap selectUserServiceAdminLogin(FP_Login login, HttpServletRequest req) throws Exception;
	
	List<FP_User> selectUserServiceList() throws Exception;
}
