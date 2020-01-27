package kr.co.thenet.fapee.home.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.CodeVO;
import kr.co.thenet.fapee.home.service.CodeService;


@Service
public class CodeServiceImpl implements CodeService {
	
	@Autowired
	private CodeMapper mapper;

	@Override
	public List<CodeVO> selectCodeList(String grp) throws Exception {
		return mapper.selectCodeList(grp);
	}

}
