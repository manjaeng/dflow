package kr.co.thenet.fapee.user.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.model.CM_User;

@Mapper
public interface UserMapper {

	List<CM_User> selectUserServiceList() throws Exception;

}
