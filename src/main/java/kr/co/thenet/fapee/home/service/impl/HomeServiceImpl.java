package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.home.service.HomeService;


@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeMapper homeMapper;

	@Override
	public List<HashMap<String, Object>> selectHomeUserList() throws Exception {
		
		return homeMapper.selectHomeUserList();
	}

	@Override
	public List<EgovMap> selectHomeSearchList(EgovMap egovMap) throws Exception {
		return homeMapper.selectHomeSearchList(egovMap);
	}

	@Override
	public boolean insertReport(EgovMap egovMap) throws Exception {

		return homeMapper.insertReport(egovMap);
	}

	@Override
	public List<EgovMap> selectReportList(int reportType) throws Exception {
		
		List<EgovMap> reportList = homeMapper.selectReportList(reportType);
		
		return reportList;
	}

	@Override
	public Map<String,String> selectVersion() throws Exception{
		Map<String,String> version = homeMapper.selectVersion();
		return version;
	}
	
}
