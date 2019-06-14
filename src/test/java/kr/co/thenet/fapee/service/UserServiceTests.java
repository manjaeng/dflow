package kr.co.thenet.fapee.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.thenet.fapee.user.service.UserService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/thenet/spring/context-datasource.xml", "/thenet/spring/context-mapper.xml",
		"/thenet/spring/context-common.xml" })
@Log4j
public class UserServiceTests {

	@Setter(onMethod_ = @Autowired)
	private UserService userService;

	/*@Test
	public void selectUserServiceList() throws Exception {
		log.info("selectUserServiceList");
		log.info(userService.selectUserServiceList());

	}*/
	
/*	@Test
	public void selectUserServiceInfo() throws Exception {
		log.info("selectUserServiceInfo");
		log.info(userService.selectUserServiceInfo("admin"));

	}*/
	
	@Test
	public void selectUserServiceSumupInfo() throws Exception {
		log.info("selectUserServiceSumupInfo");
		log.info(userService.selectUserServiceSumupInfo(1L));

	}
}
