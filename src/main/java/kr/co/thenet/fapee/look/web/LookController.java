package kr.co.thenet.fapee.look.web;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.common.model.CodeVO;
import kr.co.thenet.fapee.common.util.*;
import kr.co.thenet.fapee.home.service.AttachService;
import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.product.model.ProductSearchVO;
import kr.co.thenet.fapee.product.model.ProductVO;
import kr.co.thenet.fapee.product.service.ProductService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import kr.co.thenet.fapee.common.model.SessionVO;
import kr.co.thenet.fapee.common.model.LookVO;
import kr.co.thenet.fapee.look.service.LookService;
import kr.co.thenet.fapee.my.service.MyService;

@Log4j
@Controller
public class LookController {

	@Autowired
	private LookService lookService;

	@Autowired
	private MyService myService;

	@Autowired
	private CodeService codeService;

	@Autowired
	private ProductService service;

	@Autowired
	private AttachService attachService;

	@ModelAttribute
	public void addModelMap(ModelMap model) throws Exception {
		model.addAttribute("s3Url",Constants.S3_URL);
	}
	
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
			model.addAttribute("s3Url",Constants.S3_URL);
			List<EgovMap> lookList = lookService.selectLookProfileList(profileMap);
			model.addAttribute("lookList", lookList);
			log.info("looklist" + lookList);
		}

		return "look/look_more.app";
	}

	@GetMapping("/app/look/search.do")
	public String lookSearchTag(ModelMap model,  HttpServletRequest req) throws Exception {

		model.addAttribute("tag", req.getParameter("tag"));
		return "common/searchTag.app";
	}

	@PostMapping("/app/look/search_more.do")
	public String lookSearchTagMore(ModelMap model,  HttpServletRequest req) throws Exception {


		SessionVO sessionVO = SessionUtils.getSessionData(req);
		EgovMap profileMap = new EgovMap();
		profileMap.put("tag", req.getParameter("tag"));
		profileMap.put("pageStart",  Integer.parseInt(req.getParameter("pageStart")));
		//profileMap.put("pageStart",  0);
		profileMap.put("pageSize", Integer.parseInt(req.getParameter("pageSize")));
		//profileMap.put("pageSize", 4);
		model.addAttribute("s3Url",Constants.S3_URL);
		List<EgovMap> lookList = lookService.selectLookProfileList(profileMap);
		model.addAttribute("lookList", lookList);
		log.info("looklist" + lookList);



		return "common/searchResult_look_more.app";
	}

	@GetMapping("/app/look/look_upload.do")
	public String lookUpload(ModelMap model,  HttpServletRequest req) throws Exception {
		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);

			EgovMap profileInfo = myService.selectMyProfileInfo(sessionVO.getIdKey());

			model.addAttribute("profileInfo", profileInfo);

			List<EgovMap> userModelInfoList = myService.selectUserModelInfo(sessionVO.getIdKey());

			model.addAttribute("userModelInfoList",userModelInfoList);

			log.info("userModelInfo" + userModelInfoList);
		}
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
    public String lookDetail(long idKey, ModelMap model) throws Exception {
    	
    	EgovMap lookDetail = lookService.selectLookDetail(idKey);
    	
    	return "look/modify.admin";
    }


	@GetMapping("/list.do")
	public String list(ProductSearchVO form, Model model) throws Exception {
		List<CodeVO> inspectionStatusList = codeService.selectCodeList("ProductInspectionStatus")
				.stream().filter(v -> !"A".equals(v.getCode())).collect(Collectors.toList());
		model.addAttribute("inspectionStatusList", inspectionStatusList);
		model.addAttribute("form", form);

		List<ProductVO> list = service.selectInspectionList(form);
		model.addAttribute("saveRows", 0);
		model.addAttribute("rejectRows", 0);
		model.addAttribute("waitRows", 0);
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
			model.addAttribute("saveRows", list.get(0).getSaveRows());
			model.addAttribute("rejectRows", list.get(0).getRejectRows());
			model.addAttribute("waitRows", list.get(0).getWaitRows());
		}
		model.addAttribute("list", list);

		return "inspection/list.mcp";
	}

	@GetMapping("/admin/look/goods.do")
	public String goodsDetail(ProductSearchVO form, ModelMap model) throws Exception {
		//임시저장이 아닌 상태.
		List<CodeVO> inspectionStatusList = codeService.selectCodeList("ProductInspectionStatus")
				.stream().filter(v -> !"S".equals(v.getCode())).collect(Collectors.toList());
		model.addAttribute("inspectionStatusList", inspectionStatusList);
		model.addAttribute("form", form);

		ProductVO data = service.selectProductInfo(form);
		model.addAttribute("data", data);
		model.addAttribute("commentList", service.selectProductCommentList(form));

		model.addAttribute("mainImage", attachService.selectAttachInfoByGrp(data.getMainImageId()));
		model.addAttribute("productImage1", attachService.selectAttachInfoByGrp(data.getProductImageId1()));
		model.addAttribute("productImage2", attachService.selectAttachInfoByGrp(data.getProductImageId2()));
		model.addAttribute("productImage3", attachService.selectAttachInfoByGrp(data.getProductImageId3()));
		model.addAttribute("productImage4", attachService.selectAttachInfoByGrp(data.getProductImageId4()));

		return "look/look_goods.admin";
	}


	@GetMapping("/app/look/look_view.do")
	public String lookView(ModelMap model,HttpServletRequest req) throws Exception {

		long lookId = Long.parseLong(req.getParameter("lookId"));
		EgovMap look = lookService.selectLookDetail(lookId);
	//	model.addAttribute("look", look);


		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);
			EgovMap profileMap = new EgovMap();
			profileMap.put("idKey", sessionVO.getIdKey());
			profileMap.put("pageStart",  0);
			//profileMap.put("pageStart",  0);
			profileMap.put("pageSize", 10);
			profileMap.put("lookId" , lookId);
			//profileMap.put("pageSize", 4);
			model.addAttribute("s3Url",Constants.S3_URL);
			List<EgovMap> lookList = lookService.selectLookProfileList(profileMap);
			model.addAttribute("lookList", lookList);
			log.info("looklist" + lookList);
		}


		return "look/look_view.app";
	}


	@GetMapping("/app/look/look_tag.do")
	public String lookTag(ModelMap model, HttpServletRequest req ) throws Exception {

		long lookId = Long.parseLong(req.getParameter("lookId"));
		EgovMap look = lookService.selectLookDetail(lookId);
		model.addAttribute("look", look);

		if (SessionUtils.isLogin(req)) {

			SessionVO sessionVO = SessionUtils.getSessionData(req);
			EgovMap profileMap = new EgovMap();
			profileMap.put("idKey", sessionVO.getIdKey());
			profileMap.put("pageStart",  0);
			//profileMap.put("pageStart",  0);
			profileMap.put("pageSize", 10);
			profileMap.put("lookId" , lookId);
			//profileMap.put("pageSize", 4);
			model.addAttribute("s3Url",Constants.S3_URL);
			List<EgovMap> lookList = lookService.selectLookProfileList(profileMap);
			model.addAttribute("lookList", lookList);
			log.info("looklist" + lookList);

			ProductSearchVO form = new ProductSearchVO();

			form.setIdKey(sessionVO.getIdKey());

			List<CodeVO> inspectionStatusList = codeService.selectCodeList("ProductInspectionStatus")
					.stream().filter(v -> !"S".equals(v.getCode())).collect(Collectors.toList());
			model.addAttribute("inspectionStatusList", inspectionStatusList);
			model.addAttribute("form", form);

			List<ProductVO> data = service.selectInspectionList(form);
			model.addAttribute("data", data);


		}

		return "look/look_tag.app";
	}


	@GetMapping("/app/look/look_goods.do")
	public String lookGoods(ModelMap model, HttpServletRequest req ) throws Exception {
		if (SessionUtils.isLogin(req)) {
			String productIKey = req.getParameter("productKey");

			ProductSearchVO form = new ProductSearchVO();
			form.setDataKey(productIKey);
			//form.setUserId(req.getSession().getId());

			List<CodeVO> inspectionStatusList = codeService.selectCodeList("ProductInspectionStatus")
					.stream().filter(v -> !"S".equals(v.getCode())).collect(Collectors.toList());
			model.addAttribute("inspectionStatusList", inspectionStatusList);
			model.addAttribute("form", form);

			ProductVO data = service.selectProductInfo(form);
			model.addAttribute("data", data);
			model.addAttribute("commentList", service.selectProductCommentList(form));

			model.addAttribute("mainImage", attachService.selectAttachInfoByGrp(data.getMainImageId()));
			model.addAttribute("productImage1", attachService.selectAttachInfoByGrp(data.getProductImageId1()));
			model.addAttribute("productImage2", attachService.selectAttachInfoByGrp(data.getProductImageId2()));
			model.addAttribute("productImage3", attachService.selectAttachInfoByGrp(data.getProductImageId3()));
			model.addAttribute("productImage4", attachService.selectAttachInfoByGrp(data.getProductImageId4()));


		}
		return "look/look_goods.app";
	}


}
