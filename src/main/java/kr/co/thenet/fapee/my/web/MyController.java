package kr.co.thenet.fapee.my.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.model.*;
import kr.co.thenet.fapee.home.service.AttachService;
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

import kr.co.thenet.fapee.common.util.Base64;
import kr.co.thenet.fapee.common.util.CommonUtils;
import kr.co.thenet.fapee.common.util.Constants;
import kr.co.thenet.fapee.common.util.EgovMap;
import kr.co.thenet.fapee.common.util.FileUtils;
import kr.co.thenet.fapee.common.util.S3Utils;
import kr.co.thenet.fapee.common.util.SessionUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

    @Autowired
    private AttachService attachService;

    @GetMapping("/app/my/model_reg1.do")
    public String modelReg2(HttpServletRequest req, ModelMap model) throws Exception {

        if (SessionUtils.isLogin(req)) {

            SessionVO sessionVO = SessionUtils.getSessionData(req);
            List<EgovMap> productList = myService.selectUserModelInfo(sessionVO.getIdKey());

            model.addAttribute("productList", productList);
            return "my/model_reg1.app";
        }else{

            return "user/login.app";
        }

    }

    @GetMapping("/app/my/model_reg2.do")
    public String modelReg1(HttpServletRequest req, ModelMap model) throws Exception {

        if (SessionUtils.isLogin(req)) {

            SessionVO sessionVO = SessionUtils.getSessionData(req);
            return "my/model_reg2.app";
        }else{

            return "user/login.app";
        }

    }

    @PostMapping("/app/my/reg_complete.do")
    @ResponseBody
    public String joinComplete(HttpServletRequest req) throws Exception {
        if (SessionUtils.isLogin(req)) {
            int k = 0;
            boolean insertCount = false;
            ProductVO product = getProductFormReq(req);
            product.setUserKey(SessionUtils.getIdKey());

            try {
                MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
                Iterator i = multipartRequest.getFileNames();
                EgovMap listUrl = new EgovMap();
                while (i.hasNext()) {
                    String fileName = (String)i.next();
                    MultipartFile multipartFile = multipartRequest.getFile(fileName);
                    AttachFileVO attachFileVO = AttachFileVO.of(multipartFile, "Product");
                    attachService.saveImageFileByGrp(attachFileVO);
                    listUrl.put(fileName, attachFileVO.getPhysicalFullPath());
                    switch(fileName){
                        case "image1":
                            product.setImage1(attachFileVO.getPhysicalFullPath());
                        case "image2":
                            product.setImage2(attachFileVO.getPhysicalFullPath());
                        case "image3":
                            product.setImage3(attachFileVO.getPhysicalFullPath());
                        case "image4":
                            product.setImage4(attachFileVO.getPhysicalFullPath());
                        case "image5":
                            product.setImage5(attachFileVO.getPhysicalFullPath());
                    }
                }
            } catch (Exception ex) {
                log.debug(ex.getMessage());
                ex.printStackTrace();
            }
            insertCount = myService.insertModel(product);
            if (insertCount) {
                return "success";
            } else {
                return "error";
            }
        }else{
            return "false";
        }
    }

    private ProductVO getProductFormReq(HttpServletRequest req) {
        ProductVO product = new ProductVO();
          product.setCategory(req.getParameter("category"));
        product.setPname(req.getParameter("pname"));
        product.setCategory(req.getParameter("category"));
        product.setPrice(Integer.parseInt(req.getParameter("price")));
        product.setDprice(Integer.parseInt(req.getParameter("dprice")));
        product.setPcomment(req.getParameter("pcomment"));
        product.setPstock(req.getParameter("pstock"));
        product.setPsize(req.getParameter("pzize"));
        product.setPcomment(req.getParameter("pcolor"));
        product.setPtag(req.getParameter("ptag"));
        product.setLcomment(req.getParameter("lcomment"));
        return product;
    }

    @GetMapping("/app/my/profile.do")
    public String profile(ModelMap model, HttpServletRequest req)
            throws Exception {
        if (SessionUtils.isLogin(req)) {

            SessionVO sessionVO = SessionUtils.getSessionData(req);
            EgovMap userMap = new EgovMap();
            userMap.put(Constants.USER_idKey, sessionVO.getIdKey());
            userMap.put(Constants.USER_userKey, sessionVO.getIdKey());
            userMap.put(Constants.USER_grpCodeNo, Constants.PRODUCT_TYPE_CD);
            List<CodeVO> productType = new ArrayList<CodeVO>();
            List<CodeVO> styleList = new ArrayList<CodeVO>();

            try {
                productType = codeService.selectCodeList(Constants.PRODUCT_TYPE_CD);
                List<EgovMap> produceMapList = userService.selectDfUserCodeMap(userMap);
                for (CodeVO vo : productType) {
                    for (EgovMap map : produceMapList) {
                        if (((String) map.get(Constants.COMMON_CODE_NO)).equals(vo.getCode_no())) {
                            vo.setChekYn(Constants.CODE_CHECK_YES);
                        }
                    }
                }


                styleList = codeService.selectCodeList(Constants.STYLE_LIST_CD);
                userMap.put(Constants.USER_grpCodeNo, Constants.STYLE_LIST_CD);
                List<EgovMap> styleMapList = userService.selectDfUserCodeMap(userMap);
                for (CodeVO vo : styleList) {
                    for (EgovMap map : styleMapList) {
                        if (((String) map.get(Constants.COMMON_CODE_NO)).equals(vo.getCode_no())) {
                            vo.setChekYn(Constants.CODE_CHECK_YES);
                        }
                    }
                }
            }catch(Exception e){

            }
            model.addAttribute(Constants.PRODUCT_TYPE_NM, productType);
            model.addAttribute(Constants.STYLE_LIST_MM, styleList);

            List<CodeVO> mallList = codeService.selectCodeList(Constants.MALL_LIST_CD);
            model.addAttribute(Constants.MALL_LIST_MM, mallList);

            UserVO user = userService.selectUserInfo(userMap);
            user.setUserKey(user.getIdKey());
            UserVO companyUser = userService.selectUserCompany(user);
            model.addAttribute("user", user);
            model.addAttribute("companyUser", companyUser);
        } else {
            return "user/login.app";
        }

        return "my/profile_edit.app";
    }

    @PostMapping("/app/my/updateUser.do")
    @ResponseBody
    public String updateUser(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {
        String result = "";
        if (SessionUtils.isLogin(req)) {
            SessionVO sessionVO = SessionUtils.getSessionData(req);
            EgovMap ego = new EgovMap();
            ego.put(Constants.USER_idKey, sessionVO.getIdKey());
            UserVO oldUser = userService.selectUserInfo(ego);

            if (!((String) egovMap.get(Constants.USER_userType)).equals(oldUser.getUserType())) {
                oldUser.setUserType((String) egovMap.get(Constants.USER_userType));
            }
            if (!((String) egovMap.get(Constants.USER_email)).equals(oldUser.getEmail())) {
                oldUser.setEmail((String) egovMap.get(Constants.USER_email));
            }
            if (!((String) egovMap.get(Constants.USER_userName)).equals(oldUser.getUserName())) {
                oldUser.setUserName((String) egovMap.get(Constants.USER_userName));
            }
            if (!((String) egovMap.get(Constants.USER_mobile)).equals(oldUser.getMobile())) {
                oldUser.setMobile((String) egovMap.get(Constants.USER_mobile));
            }
            if (!((String) egovMap.get(Constants.USER_fullAddr)).equals(oldUser.getFullAddr())) {
                oldUser.setFullAddr((String) egovMap.get(Constants.USER_fullAddr));
            }
            int count = userService.updateUserProfileInfo(oldUser);
            if (count == 1) {
                result = "success";
            } else {
                result = "error";
            }
        }
        return result;
    }
    @PostMapping("/app/my/updateCompany.do")
    @ResponseBody
    public String updateUserCompany(@RequestBody UserVO userVO, HttpServletRequest req) throws Exception {
        String result = "";
        if (SessionUtils.isLogin(req)) {
            SessionVO sessionVO = SessionUtils.getSessionData(req);
            EgovMap ego = new EgovMap();
            ego.put(Constants.USER_idKey, sessionVO.getIdKey());
            UserVO oldUser = userService.selectUserInfo(ego);
            //UserVO userVO = getUserFormReq(req);
            userVO.setUserKey(oldUser.getIdKey());
            int count = userService.updateUserCompany(userVO);
            if (count == 1) {
                result = "success";
            } else {
                result = "error";
            }
        }
        return result;
    }

    @ModelAttribute
    public void addModelMap(ModelMap model) throws Exception {
        model.addAttribute("s3Url", Constants.S3_URL);
    }
    private UserVO getUserFormReq(HttpServletRequest req) {
        UserVO user = new UserVO();
        user.setUserId(req.getParameter("userId"));
        user.setUserType(req.getParameter("userType"));
        user.setEmail(req.getParameter("email"));
        user.setBankCode(req.getParameter("bankCode"));
        user.setBankCount(req.getParameter("bankCount"));
        user.setBankName(req.getParameter("bankName"));
        user.setBizNo(req.getParameter("bizNo"));
        user.setCompany(req.getParameter("company"));
        user.setFirstAddr(req.getParameter("firstAddr"));
        user.setFullAddr(req.getParameter("fullAddr"));
        user.setMobile(req.getParameter("mobile"));
        user.setPassword(req.getParameter("password"));
        user.setPostCode(req.getParameter("postCode"));
        user.setProductType(Arrays.asList(req.getParameter("productType")));
        user.setStyleList(Arrays.asList(req.getParameter("styleList")));
        user.setUserName(req.getParameter("userName"));
        user.setMarketingAgree(req.getParameter("marketingAgree"));
        user.setCheckAgree1(req.getParameter("checkAgree1"));
        user.setCheckAgree2(req.getParameter("checkAgree2"));
        return user;
    }

    @PostMapping("/app/my/profile/look_thum.do")
    @ResponseBody
    public List<EgovMap> profileLookThum(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {

        List<EgovMap> lookList = null;

        int pageStart = (int) egovMap.get("pageStart");
        egovMap.put("pageStart", pageStart * Constants.APP_LOOK_PAGE_SIZE);
        egovMap.put("pageSize", Constants.APP_LOOK_PAGE_SIZE);


        if ("".equals(egovMap.get("userId"))) {
            if (SessionUtils.isLogin(req)) {

                SessionVO sessionVO = SessionUtils.getSessionData(req);

                egovMap.put("idKey", sessionVO.getIdKey());

                lookList = lookService.selectLookProfileList(egovMap);
            }
        } else {

            String userId = (String) egovMap.get("userId");

            if (!CommonUtils.isNumeric(userId)) {
                UserVO userVO = userService.selectUserInfo(egovMap);

                egovMap.put("idKey", userVO.getIdKey());

                lookList = lookService.selectLookProfileList(egovMap);
            }
        }
        return lookList;
    }


    @PostMapping("/app/my/profile/look_list.do")
    @ResponseBody
    public List<EgovMap> profileLookList(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {

        List<EgovMap> lookList = null;

        int pageStart = (int) egovMap.get("pageStart");
        egovMap.put("pageStart", pageStart * Constants.APP_LOOK_PAGE_SIZE);
        egovMap.put("pageSize", Constants.APP_LOOK_PAGE_SIZE);


        String userId = (String) egovMap.get("userId");

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

            model.addAttribute("ajaxUrl", "/app/my/profile/look_comment.do");
            model.addAttribute("profileInfo", profileInfo);
        }

        return "look/look_comment.app";
    }

    @PostMapping("/app/my/profile/look_comment.do")
    @ResponseBody
    public List<EgovMap> profileLookComment(@RequestBody EgovMap egovMap) throws Exception {

        int pageStart = (int) egovMap.get("pageStart");
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
    public List<EgovMap> profileLookCool(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {

        int pageStart = (int) egovMap.get("pageStart");
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
            log.debug("AA " + profileInfo.get("country"));

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

            if (profileMap.get("image") != null) {

                String imageUrl = profileMap.get("image").toString();
                S3Utils.init();

                destinationFile = FileUtils.Base64ToDestinationFile("userId", imageUrl, pathPrefix);
                profileMap.put("imageUrl", destinationFile);

                S3Utils.uploadFile(destinationFile, Base64.decode(imageUrl, Base64.NO_WRAP));

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
    public EgovMap followList(@RequestBody EgovMap egovMap, HttpServletRequest req) throws Exception {

        int pageStart = (int) egovMap.get("pageStart");
        String type = (String) egovMap.get("type");

        egovMap.put("pageStart", pageStart * Constants.APP_FOLLOW_PAGE_SIZE);
        egovMap.put("pageSize", Constants.APP_FOLLOW_PAGE_SIZE);

        if ("fwers".equals(type)) {
            egovMap.put("type", "fwers");
        } else if ("fwing".equals(type)) {
            egovMap.put("type", "fwing");
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

            model.addAttribute("userModelInfoList", userModelInfoList);

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



    @PostMapping("/app/my/modelregist.do")
    @ResponseBody
    public String lookRegist(@RequestBody ModelVO modelVO, HttpServletRequest req) throws Exception {
        if (SessionUtils.isLogin(req)) {
            modelVO.setUserKey(SessionUtils.getSessionData(req).getIdKey());
           // myService.insertModel(modelVO);

        }
        return "";
    }

}
