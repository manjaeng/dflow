package kr.co.thenet.fapee.look.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import kr.co.thenet.fapee.look.service.LookService;

@Service
public class LookServiceImpl implements LookService{

	@Resource
	private LookMapper lookMapper;
}
