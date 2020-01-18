package kr.co.thenet.fapee.my.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import kr.co.thenet.fapee.common.model.AlimSettingVO;
import kr.co.thenet.fapee.common.model.AlimVO;
import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.my.service.AlimService;

@Service
public class AlimServiceImpl implements AlimService {

	@Autowired
	private AlimMapper mapper;

	@Override
	public List<AlimVO> selectAlimList(AlimVO form) throws Exception {
		return mapper.selectAlimList(form);
	}
	
	@Override
	public int insertAlim(AlimVO form) throws Exception {
		if(StringUtils.isEmpty(form.getSenderIdKey())) {
			HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
			SessionVO session = SessionUtils.getSessionData(request);
			form.setSenderIdKey((session==null)? 0 : session.getIdKey());
		}
		return mapper.insertAlim(form);
	}

	@Override
	public AlimSettingVO selectAlimSetting(AlimSettingVO form) throws Exception {
		return mapper.selectAlimSetting(form);
	}
	
	@Override
	public int saveAlimSetting(AlimSettingVO form) throws Exception {
		int cnt = mapper.updateAlimSetting(form);
		if(cnt==0) {
			cnt = mapper.insertAlimSetting(form);
		}
		return cnt;
	}

}
