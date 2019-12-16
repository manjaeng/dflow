package kr.co.thenet.fapee.match.service.impl;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.MatchVO;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.match.service.MatchService;

@Service
public class MatchServiceImpl implements MatchService{

	@Autowired
	private MatchMapper matchMapper;

	@Override
	public List<EgovMap> selectMatchStyleList() throws Exception {
		return matchMapper.selectmatchStyleList();
	}

	@Override
	public List<EgovMap> selectMatchAllList() throws Exception {
		return matchMapper.selectMatchAllList();
	}

	@Override
	public boolean insertMatch(MatchVO match) throws Exception {
		boolean result = false;
		
		if(matchMapper.insertmatch(match)) {
			
			result = true;
		}
		else {
			result = false;
		}		
		return result;
	}


	@Override
	public List<EgovMap> selectMatchProfileList(EgovMap egovMap) throws Exception {
		
		List<EgovMap> matchProfileList = matchMapper.selectmatchProfileList(egovMap);
		
		matchProfileList.forEach(e -> {
			String[] imageArray = ((String)e.get("image")).split(",,,");
			String[] tagArray = ((String)e.get("tag")).split(",,,");
			
			List<String> image = Arrays.asList(imageArray);
			List<String> tag = Arrays.asList(tagArray);
			
			e.put("image", image);
			e.put("tag", tag);
		});
		
		
		return matchMapper.selectmatchProfileList(egovMap);
	}
	
    @Override
    public int updateMatchInfo(EgovMap matchInfoMap) throws Exception {
        return matchMapper.updatematchInfo(matchInfoMap);
    }


	@Override
	public EgovMap selectMatchDetail(int idKey) throws Exception {
		
		EgovMap matchDetail = matchMapper.selectmatchDetail(idKey);
		
		
		return matchMapper.selectmatchDetail(idKey);
	}
	
	public List<EgovMap> selectmatchCommentList(EgovMap egovMap) throws Exception {
		return matchMapper.selectmatchCommentList(egovMap);
	}

	@Override
	public boolean insertMatchCommentInfo(EgovMap egovMap) throws Exception {
		
		int insertCount = matchMapper.insertmatchCommentInfo(egovMap);
		
		int pranetIdKey = Integer.parseInt((String) egovMap.get("parentIdKey"));
		
		if (pranetIdKey == 0) {
			int updateCount = matchMapper.updatematchCommentInfo(egovMap);
			return (insertCount + updateCount == 2) ? true : false;
		} else {
			return (insertCount == 1 ) ? true : false;
		}
		
	}

	@Override
	public boolean insertMatchCoolInfo(EgovMap egovMap) throws Exception {
		return matchMapper.insertmatchCoolInfo(egovMap) == 1 ? true : false;
	}

	@Override
	public boolean deleteMatchCoolInfo(EgovMap egovMap) throws Exception {
		return matchMapper.deletematchCoolInfo(egovMap) == 1 ? true : false;
	}

	@Override
	public boolean insertMatchScrapInfo(EgovMap egovMap) throws Exception {
		return matchMapper.insertmatchScrapInfo(egovMap) == 1 ? true : false;
	}

	@Override
	public boolean deleteMatchScrapInfo(EgovMap egovMap) throws Exception {
		return matchMapper.deletematchScrapInfo(egovMap) == 1 ? true : false;
	}

	@Override
	public List<EgovMap> selectMatchCoolList(EgovMap egovMap) throws Exception {
		return matchMapper.selectmatchCoolList(egovMap);
	}

	@Override
	public List<EgovMap> selectMatchCommentList(EgovMap egovMap) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
}
