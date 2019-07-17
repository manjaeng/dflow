package kr.co.thenet.fapee.test;

import java.io.File;
import java.io.IOException;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;

import kr.co.thenet.fapee.common.util.S3Utils;
import lombok.extern.log4j.Log4j;

@Log4j
public class AWSTest {
	
	@Test
	public void aws() throws IOException {
		
		File file = new ClassPathResource("excel/test1.xlsx").getFile();
		S3Utils.init();
		S3Utils.uploadFile("test/imsi2.xlsx", file);
		log.info(S3Utils.getFileURL("test/imsi2.xlsx"));
		S3Utils.deleteFile("test/imsi2.xlsx");
		
	}
}
