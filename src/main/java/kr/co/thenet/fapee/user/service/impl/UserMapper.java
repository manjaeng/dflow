package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.FP_User;
import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface UserMapper {
	
	FP_User selectUserServiceInfo(EgovMap egovMap) throws Exception;
	
	void updateUserServiceFailCount(Long idKey) throws Exception;
	
	void updateUserServiceInfo(FP_User user) throws Exception;

	List<FP_User> selectUserServiceList() throws Exception;
	
	int selectUserServiceCount(FP_User user) throws Exception;
	
	int insertUserServiceInfo(FP_User user) throws Exception;
}
