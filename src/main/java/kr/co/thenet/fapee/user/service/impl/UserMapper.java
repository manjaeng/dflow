package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface UserMapper {

	List<FP_User> selectUserList() throws Exception;
	
	FP_User selectUserInfo(EgovMap egovMap) throws Exception;

	int insertUserInfo(FP_User user) throws Exception;
	
}
