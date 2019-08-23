package kr.co.thenet.fapee.look.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.look.service.LookService;

@Service
public class LookServiceImpl implements LookService{

	@Autowired
	private LookMapper lookMapper;

	@Override
	public List<EgovMap> selectLookStyleList() throws Exception {
		return lookMapper.selectLookStyleList();
	}
}
