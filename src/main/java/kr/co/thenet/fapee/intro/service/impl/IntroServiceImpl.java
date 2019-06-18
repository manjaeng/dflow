package kr.co.thenet.fapee.intro.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.intro.service.IntroService;



@Service
public class IntroServiceImpl implements IntroService {
	
	@Resource
	private IntroMapper introMapper;

	@Override
	public EgovMap selectIntroServiceInfo(int idKey) throws Exception {
		return introMapper.selectIntroServiceInfo(idKey);
	}

}
