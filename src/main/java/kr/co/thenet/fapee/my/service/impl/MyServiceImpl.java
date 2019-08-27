package kr.co.thenet.fapee.my.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.my.service.MyService;

@Service
public class MyServiceImpl implements MyService{

	@Autowired
	private MyMapper myMapper;
}
