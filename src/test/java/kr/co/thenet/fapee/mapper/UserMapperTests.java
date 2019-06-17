package kr.co.thenet.fapee.mapper;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.thenet.fapee.user.service.impl.UserMapper;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/thenet/spring/context-datasource.xml", "/thenet/spring/context-mapper.xml",
		"/thenet/spring/context-common.xml" })
public class UserMapperTests {

	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;

	/*@Test
	public void selectUserServiceList() throws Exception {
		log.info("selectUserServiceList");
		log.info(userMapper.selectUserServiceList());

	}*/
	
/*	@Test
	public void selectUserServiceInfo() throws Exception {
		log.info("selectUserServiceInfo");
		log.info(userMapper.selectUserServiceInfo("admin"));

	}*/
	
}
