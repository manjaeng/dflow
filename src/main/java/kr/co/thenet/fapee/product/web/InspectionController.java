package kr.co.thenet.fapee.product.web;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import kr.co.thenet.fapee.home.service.AttachService;
import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.product.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.common.model.CodeVO;
import kr.co.thenet.fapee.product.model.ProductSearchVO;
import kr.co.thenet.fapee.product.model.ProductVO;

@Controller
@RequestMapping("/app/inspection")
public class InspectionController {

	@Autowired
	private CodeService codeService;

	@Autowired
	private ProductService service;

	@Autowired
	private AttachService attachService;

	@GetMapping("/list.do")
	public String list(ProductSearchVO form, Model model) throws Exception {
		List<CodeVO> inspectionStatusList = codeService.selectCodeList("ProductInspectionStatus")
				.stream().filter(v -> !"A".equals(v.getCode_no())).collect(Collectors.toList());
		model.addAttribute("inspectionStatusList", inspectionStatusList);
		model.addAttribute("form", form);
		
		Map<String, LocalDate> dateMap = new HashMap<String, LocalDate>();
		dateMap.put("D01", LocalDate.now());
		dateMap.put("W01", LocalDate.now().minusWeeks(1).plusDays(1));
		dateMap.put("M01", LocalDate.now().minusMonths( 1).plusDays(1));
		dateMap.put("M03", LocalDate.now().minusMonths( 3).plusDays(1));
		dateMap.put("M06", LocalDate.now().minusMonths( 6).plusDays(1));
		dateMap.put("M12", LocalDate.now().minusMonths(12).plusDays(1));
		model.addAttribute("dateMap", dateMap);
		
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

	@GetMapping("/view.do")
	public String view(ProductSearchVO form, Model model) throws Exception {
		//임시저장이 아닌 상태.
		List<CodeVO> inspectionStatusList = codeService.selectCodeList("ProductInspectionStatus")
				.stream().filter(v -> !"S".equals(v.getCode_no())).collect(Collectors.toList());
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

		return "inspection/view.mcp";
	}

	@GetMapping("/regist.do")
	public String regist(ProductSearchVO form, Model model) throws Exception {
		model.addAttribute("inspectionStatusList", codeService.selectCodeList("ProductInspectionStatus"));
		model.addAttribute("form", form);
		
		ProductVO data = service.selectProductInfo(form);
		if(data==null) data = new ProductVO();
		model.addAttribute("data", data);
		model.addAttribute("commentList", service.selectProductCommentList(form));
		
		model.addAttribute("mainImage", attachService.selectAttachInfoByGrp(data.getMainImageId()));
		model.addAttribute("productImage1", attachService.selectAttachInfoByGrp(data.getProductImageId1()));
		model.addAttribute("productImage2", attachService.selectAttachInfoByGrp(data.getProductImageId2()));
		model.addAttribute("productImage3", attachService.selectAttachInfoByGrp(data.getProductImageId3()));
		model.addAttribute("productImage4", attachService.selectAttachInfoByGrp(data.getProductImageId4()));

		return "inspection/regist.mcp";
	}

}
