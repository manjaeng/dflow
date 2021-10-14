package kr.co.thenet.fapee.user.web;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.sns.AmazonSNSClient;
import com.amazonaws.services.sns.AmazonSNSClientBuilder;
import com.amazonaws.services.sns.model.MessageAttributeValue;
import com.amazonaws.services.sns.model.PublishRequest;
import com.amazonaws.services.sns.model.PublishResult;
import kr.co.thenet.fapee.common.model.AttachFileVO;
import kr.co.thenet.fapee.common.model.CodeVO;
import kr.co.thenet.fapee.common.util.*;
import kr.co.thenet.fapee.home.service.AttachService;
import kr.co.thenet.fapee.home.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.model.UserVO;
import kr.co.thenet.fapee.user.service.UserService;
import lombok.extern.log4j.Log4j;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Log4j
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private CodeService codeService;

    @Autowired
    private AttachService attachService;

    @GetMapping("/app/user/join_id.do")
    public String joinId(ModelMap model, HttpServletRequest req) throws Exception {

        List<CodeVO> productType = codeService.selectCodeList(Constants.PRODUCT_TYPE_CD);
        model.addAttribute(Constants.PRODUCT_TYPE_NM, productType);

        List<CodeVO> styleList = codeService.selectCodeList(Constants.STYLE_LIST_CD);
        model.addAttribute(Constants.STYLE_LIST_MM, styleList);

        List<CodeVO> mallList = codeService.selectCodeList(Constants.MALL_LIST_CD);
        model.addAttribute(Constants.MALL_LIST_MM, mallList);

        return "user/join_id.app";
    }

    @GetMapping("/app/user/join_id2.do")
    public String joinId2(ModelMap model, HttpServletRequest req) throws Exception {

        List<CodeVO> productType = codeService.selectCodeList(Constants.PRODUCT_TYPE_CD);
        model.addAttribute(Constants.PRODUCT_TYPE_NM, productType);

        List<CodeVO> styleList = codeService.selectCodeList(Constants.STYLE_LIST_CD);
        model.addAttribute(Constants.STYLE_LIST_MM, styleList);

        List<CodeVO> mallList = codeService.selectCodeList(Constants.MALL_LIST_CD);
        model.addAttribute(Constants.MALL_LIST_MM, mallList);

        return "user/join_id2.app";
    }


    @PostMapping("/app/user/join_complete.do")
    @ResponseBody
    public String joinComplete(HttpServletRequest req ) throws Exception {
        int k = 0;
        int insertCount = 0;
        UserVO user = getUserFormReq(req);
        insertCount = userService.insertUserInfo(user, req);
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
            Iterator i = multipartRequest.getFileNames();
            while (i.hasNext()) {
                String fileName = (String) i.next();
                MultipartFile multipartFile = multipartRequest.getFile(fileName);
                AttachFileVO attachFileVO = AttachFileVO.of(multipartFile, "BizInfo");
                attachService.saveImageFileByGrp(attachFileVO);
                user.setFileUrl(attachFileVO.getPhysicalFullPath());
                userService.updateUserCompany(user);
            }
        } catch (Exception ex) {
            log.debug(ex.getMessage());
        }
        if (insertCount == 1) {

            SessionVO sessionVO = new SessionVO();
            sessionVO.setIdKey(user.getIdKey());
            sessionVO.setUserId(user.getUserId());
            sessionVO.setUserType(user.getUserType());
            sessionVO.setMobile(user.getMobile());
            sessionVO.setEmail(user.getEmail());
            sessionVO.setDeviceId(user.getDeviceId());
            SessionUtils.setSessionData(req, sessionVO);
            return "success";
        } else {
            return "error";
        }
    }

    @GetMapping("/app/user/join_intro.do")
    public String joinIntro() throws Exception {
        return "user/join_intro.app";
    }

    @GetMapping("/app/user/join_mobileCertified.do")
    public String joinMobileCertified() throws Exception {
        return "user/join_mobileCertified.app";
    }

    @PostMapping("/app/user/idCheck.do")
    @ResponseBody
    public String isDuplicateCheck(@RequestParam String userId, HttpServletRequest req) throws Exception {
    String result = "";
        EgovMap egovMap = new EgovMap();
        egovMap.put("userId", userId);
        EgovMap duplCount = userService.isDuplicateCheck(egovMap);

    if((long)duplCount.get("count") > 0){
        result = "error";
    }else{
        result = "success";
    }

    return  result;
    }

    @PostMapping("/app/user/join_mobileCertified.do")
    @ResponseBody
    public String joinMobileCertified(@RequestParam String mobile, HttpServletRequest req) throws Exception {

        EgovMap egovMap = new EgovMap();
        egovMap.put("mobile", mobile);

        UserVO user = userService.selectUserInfo(egovMap);

        String randomNum = CommonUtils.getRandomNum(6);

        // 일단 전화번호 줄복 허용....
        //if(user == null) {
        SessionUtils.setData(req, "verification", randomNum);

        log.info("moblile : " + mobile);
        log.info("randomNum : " + randomNum);

        BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAYKPGWKE7FMLFRQU4", "JnlzgqptdEdWcAKWFSyztE1z6FvlDMTlPVibm1q5");
        AmazonSNSClient snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.standard()
                .withRegion("ap-northeast-1")
                .withCredentials(new AWSStaticCredentialsProvider(awsCreds)).build();

        String message = "DFLOW 인증번호는 [" + randomNum + "] 입니다.";
        String phoneNumber = mobile;
        Map<String, MessageAttributeValue> smsAttributes =
                new HashMap<String, MessageAttributeValue>();
        smsAttributes.put("AWS.SNS.SMS.SenderID", new MessageAttributeValue()
                .withStringValue("fepeeSMS") //The sender ID shown on the device.
                .withDataType("String"));
        PublishResult result = snsClient.publish(new PublishRequest()
                .withMessage(message)
                .withPhoneNumber(phoneNumber)
                .withMessageAttributes(smsAttributes));
        log.info(result);

        return "send:" + randomNum;
        //} else {
        //	return "exist:ex";
        //}

    }

    @PostMapping("/app/user/join_mobileCertified2.do")
    @ResponseBody
    public String joinMobileCertified2(@RequestParam String verification, HttpServletRequest req) throws Exception {

        if (!SessionUtils.isEmpty(req, "verification") && SessionUtils.getData(req, "verification").equals(verification)) {
            SessionUtils.removeData(req, "verification");
            return "t";
        }

        return "f";
    }



    @PostMapping("/app/user/join_id.do")
    @ResponseBody
    public String joinId(@RequestParam String userId) throws Exception {

        EgovMap egovMap = new EgovMap();
        egovMap.put("userId", userId);
        UserVO user = userService.selectUserInfo(egovMap);

        if (user == null) {
            return "ok";
        } else {
            return "exist";
        }

    }

    @GetMapping("/app/user/join_password.do")
    public String joinPassword() throws Exception {
        return "user/join_password.app";
    }

    @GetMapping("/app/user/join_email.do")
    public String joinEmail() throws Exception {
        return "user/join_email.app";
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
        user.setComPhone(req.getParameter("comPhone"));
        user.setFirstAddr(req.getParameter("firstAddr"));
        user.setSecondAddr(req.getParameter("secondAddr"));

        user.setMobile(req.getParameter("mobile"));
        user.setPassword(req.getParameter("password"));
        user.setPostCode(req.getParameter("postCode"));

        user.setProductType(Arrays.asList(req.getParameterValues("productType")));
        user.setStyleList(Arrays.asList(req.getParameterValues("styleList")));
        user.setUserName(req.getParameter("userName"));
        user.setMarketingAgree(req.getParameter("marketingAgree"));
        user.setCheckAgree1(req.getParameter("checkAgree1"));
        user.setCheckAgree2(req.getParameter("checkAgree2"));
        user.setBizNo(req.getParameter("bizNo"));
        return user;
    }

    @GetMapping("/app/user/login.do")
    public String login() throws Exception {
        return "user/login.app";
    }

    @PostMapping("/app/user/login.do")
    @ResponseBody
    public String login(@RequestBody EgovMap loginMap, HttpServletRequest req) throws Exception {

        UserVO user = userService.selectUserLogin(loginMap);

        if (user == null || "9".equals(user.getStatus())) {    //9는 탈퇴상태.
            return "f";
        } else {

            userService.updateUserLastLoginInfo(user.getIdKey());

            SessionVO sessionVO = new SessionVO();
            sessionVO.setIdKey(user.getIdKey());
            sessionVO.setUserId(user.getUserId());
            sessionVO.setUserType(user.getUserType());
            sessionVO.setMobile(user.getMobile());
            sessionVO.setEmail(user.getEmail());
            sessionVO.setDeviceId(user.getDeviceId());

            SessionUtils.setSessionData(req, sessionVO);
        }

        return "t";

    }

    @GetMapping("/app/user/logout.do")
    @ResponseBody
    public void logout(HttpServletRequest req) throws Exception {
        if (SessionUtils.isLogin(req)) {
            SessionUtils.removeSession(req);
        }
    }

    @GetMapping("/app/user/find_password.do")
    public String findPasswrod() throws Exception {
        return "user/find_password.app";
    }

    @PostMapping("/app/user/find_password.do")
    @ResponseBody
    public String findPassword(@RequestParam String mobile, HttpServletRequest req) throws Exception {
        EgovMap egovMap = new EgovMap();
        egovMap.put("mobile", mobile);

        UserVO user = userService.selectUserInfo(egovMap);

        if (user != null) {

            String randomNum = CommonUtils.getRandomNum(6);

            SessionUtils.setData(req, "verification_pw", randomNum);
            SessionUtils.setData(req, "pw_idKey", user.getIdKey());
            SessionUtils.setData(req, "pw_mobile", mobile);


            log.info("moblile : " + mobile);
            log.info("randomNum : " + randomNum);

            //AmazonSNSClient snsClient = new AmazonSNSClient();
            BasicAWSCredentials awsCreds = new BasicAWSCredentials("AKIAYKPGWKE7FMLFRQU4", "JnlzgqptdEdWcAKWFSyztE1z6FvlDMTlPVibm1q5");
            AmazonSNSClient snsClient = (AmazonSNSClient) AmazonSNSClientBuilder.standard()
                    .withRegion("ap-northeast-1")
                    .withCredentials(new AWSStaticCredentialsProvider(awsCreds)).build();

            String message = "Fapee 인증번호는 [" + randomNum + "] 입니다.";
            String phoneNumber = mobile;

            Map<String, MessageAttributeValue> smsAttributes = new HashMap<String, MessageAttributeValue>();

            smsAttributes.put("AWS.SNS.SMS.SenderID", new MessageAttributeValue()
                    //.withStringValue("AKIAYKPGWKE7FMLFRQU4") //The sender ID shown on the device.
                    .withStringValue("fepeeSMS")
                    .withDataType("String"));
            
            /*smsAttributes.put("AWS.SNS.SMS.MaxPrice", new MessageAttributeValue()
                    .withStringValue("0.50") //Sets the max price to 0.50 USD.
                    .withDataType("Number"));
            
            smsAttributes.put("AWS.SNS.SMS.SMSType", new MessageAttributeValue()
                    .withStringValue("Promotional") //Sets the type to promotional.
                    .withDataType("String"));*/

            PublishResult result = snsClient.publish(new PublishRequest()
                    .withMessage(message)
                    .withPhoneNumber(phoneNumber)
                    .withMessageAttributes(smsAttributes));
            log.info(result);

            return "send:" + randomNum;
        } else {
            return "notExist";
        }
    }

    public void sendSMSMessage(AmazonSNSClient snsClient, String message,
                               String phoneNumber, Map<String, MessageAttributeValue> smsAttributes) {
        PublishResult result = snsClient.publish(new PublishRequest()
                .withMessage(message)
                .withPhoneNumber(phoneNumber)
                .withMessageAttributes(smsAttributes));
        log.info(result); // Prints the message ID.
    }

    @PostMapping("/app/user/find_password2.do")
    @ResponseBody
    public String findPassword2(@RequestParam String verification, HttpServletRequest req) throws Exception {
        if (!SessionUtils.isEmpty(req, "verification_pw") && SessionUtils.getData(req, "verification_pw").equals(verification)) {
            SessionUtils.removeData(req, "verification_pw");
            return "t";
        }
        return "f";
    }

    @GetMapping("/app/user/find_passwordReset.do")
    public String findPasswordReset() throws Exception {
        return "user/find_passwordReset.app";
    }

    @PostMapping("/app/user/find_passwordReset.do")
    @ResponseBody
    public String findPasswordReset(@RequestParam String password, HttpServletRequest req) throws Exception {
        if (!SessionUtils.isEmpty(req, "pw_idKey")) {
            EgovMap map = new EgovMap();
            //map.put("idKey", SessionUtils.getData(req, "pw_idKey"));
            map.put("password", CommonFunc.getHashedPassword(password));
            map.put("mobile", SessionUtils.getData(req, "pw_mobile"));

            int updateCount = userService.updateUserInfo(map);

            if (updateCount > 0) {
                SessionUtils.removeSession(req);
                return "t";
            } else {
                return "f";
            }

        } else {
            return "f";
        }
    }

    @GetMapping("/app/user/find_passwordCom.do")
    public String findPasswordCom() throws Exception {
        return "user/find_passwordCom.app";
    }

    @GetMapping("/admin/user/list.do")
    public String userList(ModelMap model) throws Exception {

        List<UserVO> userList = userService.selectUserList();

        model.addAttribute("userList", userList);

        return "user/list.admin";
    }

    @PostMapping("/admin/user/updateInfo.do")
    @ResponseBody
    public String userUpdate(@RequestBody EgovMap map, HttpServletRequest req) throws Exception {

        userService.updateUserInfo(map);

        return "user/list.admin";
    }
}
