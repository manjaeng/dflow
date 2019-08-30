package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.home.service.HomeService;


@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeMapper mainMapper;

	@Override
	public List<HashMap<String, Object>> selectHomeUserList() throws Exception {
		
		return mainMapper.selectHomeUserList();
	}

}
