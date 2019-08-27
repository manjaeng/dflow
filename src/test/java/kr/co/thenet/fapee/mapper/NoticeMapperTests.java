package kr.co.thenet.fapee.mapper;


import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.thenet.fapee.common.model.NoticeVO;
import kr.co.thenet.fapee.notice.service.impl.NoticeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/thenet/spring/context-datasource.xml", "/thenet/spring/context-mapper.xml" })
public class NoticeMapperTests {

	@Resource
	private NoticeMapper noticeMapper;

	@Test
	public void insertNoticeServiceInfo() throws Exception {
		
		for (int i = 1; i <= 52; i++) {
			NoticeVO notice = new NoticeVO();

			notice.setUserIdKey(0);
			notice.setTitle("제목" + i);
			notice.setContent("내용" + i);
			notice.setStartDate(new Date());
			notice.setEndDate(new Date());
			
			noticeMapper.insertNoticeServiceInfo(notice);
		}
	}
}
