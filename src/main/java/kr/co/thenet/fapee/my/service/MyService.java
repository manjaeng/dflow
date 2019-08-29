package kr.co.thenet.fapee.my.service;

import kr.co.thenet.fapee.common.util.EgovMap;

public interface MyService {
	EgovMap selectMyProfileInfo(long idKey) throws Exception;

	boolean updateMyProfileInfo(EgovMap profileMap) throws Exception;
}
