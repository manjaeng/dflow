package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface UserMapper {

	List<UserVO> selectUserList() throws Exception;
	
	UserVO selectUserInfo(EgovMap egovMap) throws Exception;

	int insertUserInfo(UserVO user) throws Exception;

	int insertUserFilterInfo(EgovMap introMap) throws Exception;

	int insertUserStyleList(EgovMap styleMap) throws Exception;

	int updateUserLastLoginInfo(long idKey)throws Exception;
	
}
