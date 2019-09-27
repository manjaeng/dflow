package kr.co.thenet.fapee.my.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.common.util.Base64;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.FileUtils;
import kr.co.thenet.fapee.common.util.S3Utils;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.look.service.LookService;
import kr.co.thenet.fapee.my.service.MyService;
import kr.co.thenet.fapee.user.service.UserService;

@Controller
public class MyController {

	@Autowired
	private MyService myService;

	@Autowired
	private UserService userService;
	
	@Autowired
	private LookService lookService;
	
	@ModelAttribute
	public void addModelMap(ModelMap model) throws Exception {
		model.addAttribute("s3Url",Constants.S3_URL);
	}

	@GetMapping("/app/my/profile.do")
	public String profile(@RequestParam(required = false) String id, ModelMap model, HttpServletRequest req)
			throws Exception {

		if (id == null) {
			// 나의 프로필
			if (SessionUtils.isLogin(req)) {

				SessionVO sessionVO = SessionUtils.getSessionData(req);

				EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());

				model.addAttribute("isMyProfile", "true");
				model.addAttribute("profileInfo", profileInfo);
				model.addAttribute("profileNavClass", "my");
			}
		} else {
			// 타인 프로필
			if (!CommonUtils.isNumeric(id)) {
				EgovMap egovMap = new EgovMap();
				egovMap.put("userId", id);

				UserVO userVO = userService.selectUserInfo(egovMap);

				if (userVO != null) {
					EgovMap profileInfo = myService.selectMyProfileInfo(userVO.getIdKey());

					if (SessionUtils.isLogin(req)) {
						
						SessionVO sessionVO = SessionUtils.getSessionData(req);
						
						if(sessionVO.getUserId().equals(id)) {
							model.addAttribute("isMyProfile", "true");
							model.addAttribute("profileNavClass", "my");
						} else {
							EgovMap egovMap2 = new EgovMap();
							egovMap2.put("userIdKey", sessionVO.getIdKey());
							egovMap2.put("followUserIdKey", userVO.getIdKey());

							boolean isFollowing = myService.selectMyFollowingCount(egovMap2);

							if (isFollowing) {
								model.addAttribute("profileNavClass", "ing");
							}
						}

					}

					model.addAttribute("profileInfo", profileInfo);

				} else {
					// 존재하지 않는 계정
				}

			}
		}

		return "my/profile.app";
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
			
			lookList = lookService.selectLookProfileList(egovMap);
		}
	
		return lookList;
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

	@GetMapping("/app/my/profile_edit.do")
	public String profileEdit(HttpServletRequest req, ModelMap model) throws Exception {

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

			EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());

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
		
		EgovMap followCountMap = myService.selectMyFolloCount(egovMap);
		List<EgovMap> followList = myService.selectMyFollowList(egovMap);
		
		EgovMap resultMap = new EgovMap();
		resultMap.put("followCountMap", followCountMap);
		resultMap.put("followList", followList);
		
		return resultMap;
	}
	
}
