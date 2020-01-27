package kr.co.thenet.fapee.home.service;

import java.util.List;

import kr.co.thenet.fapee.common.model.CodeVO;

public interface CodeService {

	List<CodeVO> selectCodeList(String grp) throws Exception;

}
