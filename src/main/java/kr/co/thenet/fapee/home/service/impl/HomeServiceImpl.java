package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.home.service.HomeService;


@Service
public class HomeServiceImpl implements HomeService {
	
	@Resource
	private HomeMapper mainMapper;

	@Override
	public List<HashMap<String, Object>> selectHomeUserList() throws Exception {
		
		return mainMapper.selectHomeUserList();
	}

}
