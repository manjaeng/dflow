package kr.co.thenet.fapee.look.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.LookVO;
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

	
	@Override
	public List<EgovMap> selectLookAllList() throws Exception {
		return lookMapper.selectLookAllList();
	}


	@Override
	public boolean insertLook(LookVO look) throws Exception {
		boolean result = false;
		
		if(lookMapper.insertLook(look)) {
			if( 0 < look.getImages().size() ) {
				lookMapper.insertLookImage(look);
			}
			if( 0 < look.getTags().size() ) {
				lookMapper.insertLookTags(look);
			}
			result = true;
		}
		else {
			result = false;
		}		
		return result;
	}


	@Override
	public List<EgovMap> selectLookProfileList(EgovMap egovMap) throws Exception {
		
		List<EgovMap> lookProfileList = lookMapper.selectLookProfileList(egovMap);
		
		lookProfileList.forEach(e -> {
			String[] imageArray = ((String)e.get("image")).split(",,,");
			String[] tagArray = ((String)e.get("tag")).split(",,,");
			
			List<String> image = Arrays.asList(imageArray);
			List<String> tag = Arrays.asList(tagArray);
			
			e.put("image", image);
			e.put("tag", tag);
		});
		
		
		return lookMapper.selectLookProfileList(egovMap);
	}
	
}
