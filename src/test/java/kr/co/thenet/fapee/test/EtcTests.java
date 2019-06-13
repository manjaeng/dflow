package kr.co.thenet.fapee.test;

import org.junit.Test;

import kr.co.thenet.fapee.common.util.EgovMap;
import lombok.extern.log4j.Log4j;

@Log4j
public class EtcTests {

	@Test
	public void egovMapTests() {
		
		EgovMap egovMap = new EgovMap();
		
		egovMap.put("message_id_key", "messageIdKey");
		
		log.info(egovMap);
	}
}
