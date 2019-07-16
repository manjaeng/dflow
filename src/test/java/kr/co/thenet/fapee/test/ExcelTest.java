package kr.co.thenet.fapee.test;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;

import kr.co.thenet.fapee.common.util.ExcelUtils;
import lombok.extern.log4j.Log4j;

@Log4j
public class ExcelTest {

	@Test
	public void excelImport() throws IOException {

		File file = new ClassPathResource("excel/test1.xlsx").getFile();

		List<Map<String,Object>> list = ExcelUtils.excelToMapList(file.getAbsolutePath());
		
		for (Map<String, Object> map : list) {
			log.info(map);
		}
	}
}
