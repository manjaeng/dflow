package kr.co.thenet.fapee.look.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.util.*;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.model.LookVO;
import kr.co.thenet.fapee.look.service.LookService;

@Log4j
@Controller
public class LookController {

	@Autowired
	private LookService lookService;
	
	@GetMapping("/app/look/look.do")
	public String look() throws Exception {
		
		return "look/look.app";
	}

	@PostMapping("/app/look/look_more.do")
	public String lookMore(ModelMap model,  HttpServletRequest req) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);
			EgovMap profileMap = new EgovMap();
			profileMap.put("idKey", sessionVO.getIdKey());
			profileMap.put("pageStart",  Integer.parseInt(req.getParameter("pageStart")));
			//profileMap.put("pageStart",  0);
			profileMap.put("pageSize", Integer.parseInt(req.getParameter("pageSize")));
			//profileMap.put("pageSize", 4);

			List<EgovMap> lookList = lookService.selectLookProfileList(profileMap);
			model.addAttribute("lookList", lookList);
			log.info("looklist" + lookList);
		}

		return "look/look_more.app";
	}
	
	@GetMapping("/app/look/look_upload.do")
	public String lookUpload() throws Exception {
		
		return "look/look_upload.app";
	}
	
	@GetMapping("/app/look/look_cate.do")
	public String lookCate(ModelMap model) throws Exception {
		
		List<EgovMap> lookStyleList = lookService.selectLookStyleList();
		model.addAttribute("lookStyleList", lookStyleList);
		
		return "look/look_cate.app";
	}
	
	@GetMapping("/admin/look/list.do")
	public String lookList(ModelMap model) throws Exception {
		
		List<EgovMap> lookList = lookService.selectLookAllList();
		model.addAttribute("lookList", lookList);
		
		return "look/list.admin";
	}
	
	@GetMapping("/admin/look/list2.do")
	public String lookList2(ModelMap model) throws Exception {
		
		List<EgovMap> lookList = lookService.selectLookAllList();
		model.addAttribute("lookList", lookList);
		
		return "look/list2.admin";
	}
	
	@GetMapping("/admin/look/add.do")
	public String lookAdd(ModelMap model) throws Exception {
		
		List<EgovMap> lookStyleList = lookService.selectLookStyleList();
		model.addAttribute("lookStyleList", lookStyleList);
		
		return "look/add.admin";
	}

	@PostMapping("/app/look/regist.do")
	@ResponseBody
	public String lookRegist(@RequestBody LookVO look, HttpServletRequest req) throws Exception {
		
		String pathPrefix = "images/";
		List<String> images = null;
		
		if(0 != look.getImages().size()) {
			images = new ArrayList<String>();
		
			S3Utils.init();
			for(int i = 0; i < look.getImages().size(); ++i ) { 
				
				String imageUrl = look.getImages().get(i);
                String destinationFile = FileUtils.Base64ToDestinationFile("userId", imageUrl, pathPrefix);
				
				images.add(destinationFile);
				//.FIXME S3 업로드 완료
				S3Utils.uploadFile(destinationFile, Base64.decode(look.getImages().get(i),Base64.NO_WRAP));
			}
		}
		look.setImages(images);
		
		lookService.insertLook(look);
		
		return "";
	}
	
    @PostMapping("/admin/look/updateInfo.do")
    @ResponseBody
    public String lookUpdateInfo(@RequestBody EgovMap lookInfoMap) throws Exception {
        
        lookService.updateLookInfo(lookInfoMap);
        
        return "look/list.admin";
    }
    
    @GetMapping("/admin/look/modify.do")
    public String lookDetail(int idKey, ModelMap model) throws Exception {
    	
    	EgovMap lookDetail = lookService.selectLookDetail(idKey);
    	
    	return "look/modify.admin";
    }
}
