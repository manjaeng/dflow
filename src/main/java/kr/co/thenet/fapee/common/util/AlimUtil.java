package kr.co.thenet.fapee.common.util;

import kr.co.thenet.fapee.common.model.AlimVO;
import kr.co.thenet.fapee.my.service.AlimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AlimUtil {
	
	private static AlimService alimService;
	
	@Autowired
	public AlimUtil(AlimService alimService) {
		AlimUtil.alimService = alimService;
	}
	
	public static boolean send(String grp, String alimType, String title, String content, 
					String linkUrl, String linkImageUrl, Long receiverIdKey, Long senderIdKey) {
		try {
			AlimVO form = AlimVO.of(grp, alimType, title, content, linkUrl, linkImageUrl, receiverIdKey, senderIdKey);
			log.info("Alim insert...info={}", form );
			
			alimService.insertAlim(form);
			
			return true;
			
		} catch (Exception e) {
			log.error("[ERROR] Alim send failed...{}", e);
			return false;
		}
	}

}
