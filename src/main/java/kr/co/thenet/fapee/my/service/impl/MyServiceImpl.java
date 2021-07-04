package kr.co.thenet.fapee.my.service.impl;

import java.util.List;

import kr.co.thenet.fapee.common.model.ModelVO;
import kr.co.thenet.fapee.user.service.impl.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.my.service.MyService;

@Service
public class MyServiceImpl implements MyService {

	@Autowired
	private MyMapper myMapper;

	@Autowired
	private UserMapper userMapper;

	@Override
	public EgovMap selectMyProfileInfo(long idKey) throws Exception {
		return myMapper.selectMyProfileInfo(idKey);
	}

	@Override
	public List<EgovMap> selectUserModelInfo(long idKey) throws Exception{
		return myMapper.selectUserModelInfo(idKey);
	}

	@Override
	public boolean  updateUserModelMap(EgovMap profileMap) throws Exception{

		int result = 0;
		result = myMapper.updateUserModelMap(profileMap);

		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean updateMyProfileInfo(EgovMap profileMap) throws Exception {

		int result = 0;
		
		if(profileMap.get("image") != null) {
			result = myMapper.updateMyProfileInfo(profileMap);
		} else {
			result = myMapper.updateMyProfileInfo(profileMap);
			result += userMapper.updateUserFilterCountryInfo(profileMap);
		}
		
		if(result > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean selectMyFollowingCount(EgovMap egovMap) throws Exception {

		int followCount = myMapper.selectMyFollowingCount(egovMap);

		if (followCount == 0) {
			return false;
		} else {
			return true;
		}

	}

	@Override
	public boolean insertMyFollwInfo(EgovMap egovMap) throws Exception {
		
		int result = myMapper.insertMyFollwInfo(egovMap);
		
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteMyFollwInfo(EgovMap egovMap) throws Exception {
		
		int result = myMapper.deleteMyFollwInfo(egovMap);
		
		if(result == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<EgovMap> selectMyFollowList(EgovMap egovMap) throws Exception {
		return myMapper.selectMyFollowList(egovMap);
	}

	@Override
	public EgovMap selectMyFollowCount(EgovMap egovMap) throws Exception {
		return myMapper.selectMyFollowCount(egovMap);
	}

	@Override
	public EgovMap selectMyModel(EgovMap egovMap) throws Exception{
		return myMapper.selectMyModel(egovMap);
	}

	@Override
	public boolean updateModelInfo(EgovMap egovMap) throws Exception{

		int result = myMapper.updateModelInfo(egovMap);

		if(result == 1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public boolean insertModel(ModelVO modelVO) throws Exception{
		return myMapper.insertModel(modelVO);
	}
}
