package kr.co.thenet.fapee.my.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.model.CodeVO;
import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.look.service.LookService;
import kr.co.thenet.fapee.my.service.MyService;
import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.model.ModelVO;
import kr.co.thenet.fapee.common.util.Base64;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.FileUtils;
import kr.co.thenet.fapee.common.util.S3Utils;
import kr.co.thenet.fapee.common.util.SessionUtils;

@Log4j
@Controller
public class MyController {

	@Autowired
	private MyService myService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private LookService lookService;

	@Autowired
	private CodeService codeService;
	
	@ModelAttribute
	public void addModelMap(ModelMap model) throws Exception {
		model.addAttribute("s3Url",Constants.S3_URL);
	}

	@GetMapping("/app/my/profile.do")
	public String profile( ModelMap model, HttpServletRequest req)
			throws Exception {
			if (SessionUtils.isLogin(req)) {

				SessionVO sessionVO = SessionUtils.getSessionData(req);

				EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());

				EgovMap myLooksMap = new EgovMap();
				myLooksMap.put("idKey", sessionVO.getIdKey());

				List<CodeVO>  productType = codeService.selectCodeList("0001");
				model.addAttribute("productType", productType);

				List<CodeVO> styleList = codeService.selectCodeList("0002");
				model.addAttribute("styleList", styleList);

				UserVO user = userService.selectUserInfo(myLooksMap);
				UserVO companyUser = userService.selectUserCompany(user);
				List<EgovMap> lookList = lookService.selectLookProfileList(myLooksMap);
				model.addAttribute("user", user);
				model.addAttribute("companyUser", companyUser);
			}else{
				return "user/login.app";
			}

		return "my/profile_edit.app";
	}
	
	@PostMapping("/app/my/profile/look_thum.do")
	@ResponseBody
	public List<EgovMap> profileLookThum(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {
		
		List<EgovMap> lookList = null;
		
		int pageStart = (int)egovMap.get("pageStart");
		egovMap.put("pageStart", pageStart * Constants.APP_LOOK_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_LOOK_PAGE_SIZE);
		
		
		if ("".equals(egovMap.get("userId"))) {
			if (SessionUtils.isLogin(req)) {
				
				SessionVO sessionVO = SessionUtils.getSessionData(req);
				
				egovMap.put("idKey", sessionVO.getIdKey());
				
				lookList = lookService.selectLookProfileList(egovMap);
			}
		} else {
			
			String userId = (String)egovMap.get("userId");
			
			if (!CommonUtils.isNumeric(userId)) {
				UserVO userVO = userService.selectUserInfo(egovMap);
				
				egovMap.put("idKey", userVO.getIdKey());
				
				lookList = lookService.selectLookProfileList(egovMap);
			}
		}
		return lookList;
	}
	
	@GetMapping("/app/my/profile/look_list.do")
	public String profileLookDeatilList() throws Exception {
		return "my/profile_look.app";
	}
	
	@PostMapping("/app/my/profile/look_list.do")
	@ResponseBody
	public List<EgovMap> profileLookList(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {
		
		List<EgovMap> lookList = null;
		
		int pageStart = (int)egovMap.get("pageStart");
		egovMap.put("pageStart", pageStart * Constants.APP_LOOK_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_LOOK_PAGE_SIZE);
		
			
		String userId = (String)egovMap.get("userId");
		
		if (!CommonUtils.isNumeric(userId)) {
			UserVO userVO = userService.selectUserInfo(egovMap);
			
			egovMap.put("idKey", userVO.getIdKey());
			
			if (SessionUtils.isLogin(req)) {
				SessionVO sessionVO = SessionUtils.getSessionData(req);
				egovMap.put("sessionIdKey", sessionVO.getIdKey());
			}
			
			lookList = lookService.selectLookProfileList(egovMap);
		}
	
		return lookList;
	}
	
	@PostMapping("/app/my/profile/look_{clickedBtn}_edit.do")
	@ResponseBody
	public String profileLookCoolAndScrapEdit(@RequestBody EgovMap egovMap, HttpServletRequest req, @PathVariable String clickedBtn) throws Exception {

		String type = (String) egovMap.get("type");
		boolean isSuccess = false;
		
		if (SessionUtils.isLogin(req)) {
			
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			egovMap.put("userIdKey", sessionVO.getIdKey());
			
			
			if ("cool".equals(clickedBtn)) {
				
				if ("insert".equals(type)) {
					isSuccess = lookService.insertLookCoolInfo(egovMap);
				} else if ("delete".equals(type)) {
					isSuccess = lookService.deleteLookCoolInfo(egovMap);
				}
				
			} else if ("scrap".equals(clickedBtn)) {
				
				if ("insert".equals(type)) {
					isSuccess = lookService.insertLookScrapInfo(egovMap);
				} else if ("delete".equals(type)) {
					isSuccess = lookService.deleteLookScrapInfo(egovMap);
				}
				
			}
		}
		
		if (isSuccess) {
			return "t";
		} else {
			return "f";
		}
	}
	
	@GetMapping("/app/my/profile/look_comment.do")
	public String profileLookComment(ModelMap model, HttpServletRequest req) throws Exception {
		
		if (SessionUtils.isLogin(req)) {
			
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			
			EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());
			
			model.addAttribute("ajaxUrl","/app/my/profile/look_comment.do");
			model.addAttribute("profileInfo", profileInfo);
		}
		
		return "look/look_comment.app";
	}
	
	@PostMapping("/app/my/profile/look_comment.do")
	@ResponseBody
	public List<EgovMap> profileLookComment(@RequestBody EgovMap egovMap) throws Exception {
		
		int pageStart = (int)egovMap.get("pageStart");
		egovMap.put("pageStart", pageStart * Constants.APP_LOOK_COMMENT_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_LOOK_COMMENT_PAGE_SIZE);
		
		List<EgovMap> lookList = lookService.selectLookCommentList(egovMap);
		
		return lookList;
	}
	
	@PostMapping("/app/my/profile/add_look_comment.do")
	@ResponseBody
	public String profileAddLookComment(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {
		
		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);
			
			egovMap.put("userIdKey", sessionVO.getIdKey());
			
			boolean isSuccess = lookService.insertLookCommentInfo(egovMap);
			
			if (isSuccess) {
				return "t";
			} else {
				return "f";
			}
		}
		
		return "f";
	}
	
	@GetMapping("/app/my/profile/look_cool.do")
	public String profileLookCool(ModelMap model, HttpServletRequest req) throws Exception {
		return "look/look_cool.app";
	}
	
	@PostMapping("/app/my/profile/look_cool.do")
	@ResponseBody
	public List<EgovMap> profileLookCool(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception{
		
		int pageStart = (int)egovMap.get("pageStart");
		egovMap.put("pageStart", pageStart * Constants.APP_LOOK_COMMENT_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_LOOK_COMMENT_PAGE_SIZE);
		
		if (SessionUtils.isLogin(req)) {
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			egovMap.put("sessionIdKey", sessionVO.getIdKey());
		}
		
		List<EgovMap> cooList = lookService.selectLookCoolList(egovMap);
		
		return cooList;
	}

	@GetMapping("/app/my/profile_edit.do")
	public String profileEdit(HttpServletRequest req, ModelMap model) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

			EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());
			//System.out.println("AA "+profileInfo.get("country"));
			log.debug("AA "+profileInfo.get("country"));

			model.addAttribute("profileInfo", profileInfo);
		}

		return "my/profile_edit.app";
	}

	@PostMapping("/app/my/profile_edit.do")
	@ResponseBody
	public String profileEdit(@RequestBody EgovMap profileMap, HttpServletRequest req) throws Exception {

		String pathPrefix = "pf_Images/";
		String destinationFile = "";
		
		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

			profileMap.put("idKey", sessionVO.getIdKey());
			
			if(profileMap.get("image") != null) {

				String imageUrl = profileMap.get("image").toString();
				S3Utils.init();
				
				destinationFile = FileUtils.Base64ToDestinationFile("userId",imageUrl,pathPrefix);
				profileMap.put("imageUrl", destinationFile);
				
				S3Utils.uploadFile(destinationFile, Base64.decode(imageUrl,Base64.NO_WRAP));
				
				myService.updateMyProfileInfo(profileMap);
				
				return destinationFile;
				
			} else {
				boolean isSuccess = myService.updateMyProfileInfo(profileMap);

				if (isSuccess) {
					return "t";
				} else {
					return "f";
				}
			}
		}

		return "f";

	}

	@PostMapping("/app/my/follow_edit.do")
	@ResponseBody
	public String followEdit(@RequestBody EgovMap followMap, HttpServletRequest req) throws Exception {

		String type = (String) followMap.get("type");
		boolean isSuccess = false;
		
		if (SessionUtils.isLogin(req)) {
			
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			UserVO userVO = userService.selectUserInfo(followMap);
			

			EgovMap egovMap = new EgovMap();
			egovMap.put("userIdKey", sessionVO.getIdKey());
			egovMap.put("followUserIdKey", userVO.getIdKey());
			
			if ("insert".equals(type)) {
				isSuccess = myService.insertMyFollwInfo(egovMap);
			} else if ("delete".equals(type)) {
				isSuccess = myService.deleteMyFollwInfo(egovMap);
			}
		}
		
		if (isSuccess) {
			return "t";
		} else {
			return "f";
		}
	}
	
	@GetMapping("/app/my/follow.do")
	public String follow(@RequestParam(required = true) String id, ModelMap model) throws Exception {
		
		EgovMap egovMap = new EgovMap();
		egovMap.put("userId", id);

		UserVO userVO = userService.selectUserInfo(egovMap);
		EgovMap profileInfo = myService.selectMyProfileInfo(userVO.getIdKey());
		
		model.addAttribute("profileInfo", profileInfo);
		
		return "my/follow.app";
	}
	
	@GetMapping("/app/my/follow_div.do")
	public String followDiv() throws Exception {
		return "app/my/follow_div";
	}
	
	@PostMapping("/app/my/followList.do")
	@ResponseBody
	public EgovMap followList(@RequestBody EgovMap egovMap,HttpServletRequest req) throws Exception {
		
		int pageStart = (int)egovMap.get("pageStart");
		String type = (String) egovMap.get("type");
		
		egovMap.put("pageStart", pageStart * Constants.APP_FOLLOW_PAGE_SIZE);
		egovMap.put("pageSize", Constants.APP_FOLLOW_PAGE_SIZE);
		
		if ("fwers".equals(type)) {
			egovMap.put("type","fwers");
		} else if ("fwing".equals(type)) {
			egovMap.put("type","fwing");
		}
		
		UserVO userVO = userService.selectUserInfo(egovMap);
		egovMap.put("idKey", userVO.getIdKey());
		
		if (SessionUtils.isLogin(req)) {
			SessionVO sessionVO = SessionUtils.getSessionData(req);
			egovMap.put("sessionIdKey", sessionVO.getIdKey());
		}
		
		EgovMap followCountMap = myService.selectMyFollowCount(egovMap);
		List<EgovMap> followList = myService.selectMyFollowList(egovMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("followCountMap", followCountMap);
		resultMap.put("followList", followList);
		
		return resultMap;
	}

	@GetMapping("/app/my/model_set.do")
	public String modelList(HttpServletRequest req, ModelMap model) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

			EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());

			model.addAttribute("profileInfo", profileInfo);

			List<EgovMap> userModelInfoList = myService.selectUserModelInfo(sessionVO.getIdKey());

			model.addAttribute("userModelInfoList",userModelInfoList);

			log.info("userModelInfo" + userModelInfoList);
		}
		return "my/model_set.app";
	}

	@PostMapping("/app/my/updateUserModelMap.do")
	@ResponseBody
	public String updateUserModelMap(@RequestBody EgovMap profileMap, HttpServletRequest req) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

			profileMap.put("idKey", sessionVO.getIdKey());

			boolean isSuccess = myService.updateUserModelMap(profileMap);

			if (isSuccess) {
				return "t";
			} else {
				return "f";
			}
		}

		return "f";

	}

	@GetMapping("/app/my/model_reg1.do")
	public String modelReg2(HttpServletRequest req, ModelMap model) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);


		}
		return "my/model_reg1.app";
	}

	@GetMapping("/app/my/model_reg2.do")
	public String modelReg1(HttpServletRequest req, ModelMap model) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

		}
		return "my/model_reg2.app";
	}

	@PostMapping("/app/my/modelregist.do")
	@ResponseBody
	public String lookRegist(@RequestBody ModelVO modelVO, HttpServletRequest req) throws Exception {
		if (SessionUtils.isLogin(req)) {
			modelVO.setUserKey(SessionUtils.getSessionData(req).getIdKey());
			myService.insertModel(modelVO);

		}
		return "";
	}
	
}
