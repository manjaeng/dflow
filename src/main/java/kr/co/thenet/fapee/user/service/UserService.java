package kr.co.thenet.fapee.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.model.FP_Login;
import kr.co.thenet.fapee.common.model.FP_User;

public interface UserService {

	FP_Login selectUserServiceLoginInfo(FP_Login login, HttpServletRequest req) throws Exception;

	List<FP_User> selectUserServiceList() throws Exception;
}
