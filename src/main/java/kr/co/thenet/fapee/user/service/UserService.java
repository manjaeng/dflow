package kr.co.thenet.fapee.user.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.CM_User;

public interface UserService {

	List<CM_User> selectUserServiceList() throws Exception;

}
