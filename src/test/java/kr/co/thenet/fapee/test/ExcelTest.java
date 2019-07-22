package kr.co.thenet.fapee.test;

import java.io.File;
import java.io.IOException;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;

import kr.co.thenet.fapee.common.util.ExcelUtils;
import lombok.extern.log4j.Log4j;

@Log4j
public class ExcelTest {

	@Test
	public void excelImport() throws IOException {

		File file = new ClassPathResource("excel/test1.xlsx").getFile();

		log.info("excelToMap");
		log.info(ExcelUtils.excelToMap(file.getAbsolutePath()) + "\n");

		log.info("excelToMapList");
		ExcelUtils.excelToMapList(file.getAbsolutePath()).forEach(map -> {
			log.info(map);
		});

	}
}
