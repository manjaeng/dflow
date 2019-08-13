package kr.co.thenet.fapee.intro.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.intro.service.IntroService;

@RestController
@RequestMapping("/rest/{version}/intro")
public class IntroAppController {

	@Autowired
	private IntroService introService;
	
	@GetMapping("/favoriteStyle")
	public List<EgovMap> favoriteStyle() throws Exception {
		return introService.selectIntroFavoriteStyleList();
	}
	
	@GetMapping("/sizeCount")
	public EgovMap sizeCount() throws Exception {
		
		EgovMap egovMap = new EgovMap();
		
		return introService.selectIntroSizeCount(egovMap);
	}
}
