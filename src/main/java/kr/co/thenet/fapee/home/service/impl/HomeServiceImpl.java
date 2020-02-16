package kr.co.thenet.fapee.home.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.home.service.HomeService;
import kr.co.thenet.fapee.look.service.impl.LookMapper;


@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	private HomeMapper homeMapper;
	
	@Autowired
	private LookMapper lookMapper;

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

	//최적 컨텐츠 3개.
	@Override
	public List<EgovMap> selectLookListByFit(EgovMap egovMap) throws Exception{
		List<EgovMap> fitList = homeMapper.selectLookListByFit(egovMap);
		for(EgovMap map : fitList) {
			//태그 목록.
			map.put("tagList", lookMapper.selectLookTagList(map));
			
			//이미지 목록.
			List<EgovMap> imageList = lookMapper.selectLookImageList(map);
			for(EgovMap image : imageList) {
				String imageUrl = (String) image.get("imageUrl");
				if( !StringUtils.isEmpty(imageUrl) && !imageUrl.startsWith("http")) {
					image.put("imageUrl", String.format("%s%s", Constants.CDN_URL, imageUrl));
				}
			}
			map.put("imageList", imageList);
		}
		return fitList;
	}

	//연관 컨텐츠 20개.
	@Override
	public List<EgovMap> selectLookListByMaybe(EgovMap egovMap) throws Exception{
		return homeMapper.selectLookListByMaybe(egovMap);
	}

	//24시간 이내에 많이 등록된 태그.
	@Override
	public EgovMap selectRecentTag() throws Exception{
		return homeMapper.selectRecentTag();
	}

	//24시간 이내에 많이 등록된 태그에 의한 룩 목록.
	@Override
	public List<EgovMap> selectLookListByRecentTag(EgovMap egovMap) throws Exception{
		return homeMapper.selectLookListByRecentTag(egovMap);
	}

	
}
