package kr.co.thenet.fapee.test;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.thenet.fapee.common.util.EgovMap;
import lombok.extern.log4j.Log4j;
import size.test.mapper.SizeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "/thenet/spring/context-*.xml")
@Log4j
public class SizeTest {

	@Resource
	private SizeMapper sizeMapper;

	// @Test
	public void insert() throws Exception {

		List<EgovMap> list = new ArrayList<>();
		String[] braTop = { "A", "B", "C", "D", "E", "F", "G", "H" };
		String[] fit = { "Tight", "More Fitted", "Fitted", "More Straight", "Straight", "Loose", "Oversized" };
		int[] braBottom = { 75, 80, 85, 90 };

		for (int i = 0; i < 5000; i++) {

			EgovMap egovMap = new EgovMap();

			egovMap.put("no", 0);
			egovMap.put("height", (int) (Math.random() * 51 + 140));
			egovMap.put("age", (int) (Math.random() * 56 + 15));
			egovMap.put("fit", fit[(int) (Math.random() * fit.length)]);
			egovMap.put("braTop", braTop[(int) (Math.random() * braTop.length)]);
			egovMap.put("braBottom", braBottom[(int) (Math.random() * braBottom.length)]);
			egovMap.put("waist", (int) (Math.random() * 20 + 21));

			list.add(egovMap);
		}

		sizeMapper.insertSizeData(list);
	}

	@Test
	public void select() throws Exception {

		EgovMap egovMap = new EgovMap();

		egovMap.put("start", 90);
		egovMap.put("end", 100);

		egovMap.put("heightGrade", 4);
		egovMap.put("ageGrade", 5);
		egovMap.put("fitGrade", 5);
		egovMap.put("braTopGrade", 4);
		egovMap.put("braBottomGrade", 4);
		egovMap.put("waistGrade", 5);

		sizeMapper.selectSizeData(egovMap).forEach(map -> {
			log.info(map);
		});
	}
}
