package kr.co.thenet.fapee.my.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.my.service.MyService;

@Controller
public class MyController {

	@Autowired
	private MyService myService;

	@GetMapping("/app/my/profile.do")
	public String profile(@RequestParam(required = false) String id, ModelMap model, HttpServletRequest req)
			throws Exception {

		if (id == null) {
			if (SessionUtils.getSessionData(req) != null) {
				
				SessionVO sessionVO = SessionUtils.getSessionData(req);
				
				EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());
				
				model.addAttribute("isMyProfile", "true");
				model.addAttribute("profileInfo", profileInfo);
				model.addAttribute("profileNavClass","my");
			}
		} else {
			//EgovMap egovMap = new EgovMap();

			if (!CommonUtils.isNumeric(id)) {

			} 
		}

		return "my/profile.app";
	}
	
	@GetMapping("/app/my/profile_edit.do")
	public String profileEdit(HttpServletRequest req, ModelMap model) throws Exception {
		
		if (SessionUtils.getSessionData(req) != null) {
			
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			
			EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());
			
			model.addAttribute("profileInfo", profileInfo);
		}
		
		return "my/profile_edit.app";
	}
	
	@PostMapping("/app/my/profile_edit.do")
	@ResponseBody
	public String profileEdit(@RequestBody EgovMap profileMap, HttpServletRequest req) throws Exception {
		
		if (SessionUtils.getSessionData(req) != null) {
			
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			
			profileMap.put("idKey", sessionVO.getIdKey());
			
			boolean isSuccess = myService.updateMyProfileInfo(profileMap);

			if(isSuccess) {
				return "t";
			} else {
				return "f";
			}
			
		}
		
		return "f";
		
	}

}
