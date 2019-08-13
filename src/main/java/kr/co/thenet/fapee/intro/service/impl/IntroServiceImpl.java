package kr.co.thenet.fapee.intro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.intro.service.IntroService;



@Service
public class IntroServiceImpl implements IntroService {

	@Autowired
	private IntroMapper introMapper;
	
	@Override
	public List<EgovMap> selectIntroStyleList() throws Exception {
		return introMapper.selectIntroStyleList();
	}

	@Override
	public EgovMap selectIntroSizeCount(EgovMap egovMap) throws Exception {
		return introMapper.selectIntroSizeCount(egovMap);
	}

}
