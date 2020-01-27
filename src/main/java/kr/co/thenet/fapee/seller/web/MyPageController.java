package kr.co.thenet.fapee.seller.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.thenet.fapee.home.service.AttachService;
import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.seller.model.SellerUserVO;
import kr.co.thenet.fapee.seller.service.SellerUserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/seller/mypage")
public class MyPageController {

	@Autowired
	private CodeService codeService;

	@Autowired
	private SellerUserService service;

	@Autowired
	private AttachService attachService;

	/*----------------------------------------
	 * 셀러 관리
	 *----------------------------------------*/
	@GetMapping("/usercheck.do")
	public String usercheck(SellerSearchVO form, Model model) throws Exception {
		return "mypage/usercheck.seller";
	}

	@GetMapping("/view.do")
	public String view(SellerSearchVO form, Model model, HttpSession session) throws Exception {
		long idKey = (long)session.getAttribute("SSSellerIdKey");
		log.info("Seller idkey={}", idKey);
		form.setDataKey(String.valueOf(idKey));

		model.addAttribute("sellerStatusList", codeService.selectCodeList("SellerActiveStatus"));
		model.addAttribute("form", form);
		
		SellerUserVO data = service.selectSellerInfo(form);
		model.addAttribute("data", data);
		model.addAttribute("commentList", service.selectSellerCommentList(form));
		
		model.addAttribute("bizCertAttach", attachService.selectAttachInfoByGrp(data.getBizCertAttachId()));
		model.addAttribute("onlineSalesAttach", attachService.selectAttachInfoByGrp(data.getOnlineSalesAttachId()));
		model.addAttribute("accountAttach", attachService.selectAttachInfoByGrp(data.getAccountAttachId()));
		model.addAttribute("evidenceAttach", attachService.selectAttachInfoByGrp(data.getEvidenceAttachId()));
		model.addAttribute("idnCertAttach", attachService.selectAttachInfoByGrp(data.getIdnCertAttachId()));

		return "mypage/view.seller";
	}

	@GetMapping("/edit.do")
	public String edit(SellerSearchVO form, Model model, HttpSession session) throws Exception {
		long idKey = (long)session.getAttribute("SSSellerIdKey");
		log.info("Seller idkey={}", idKey);
		form.setDataKey(String.valueOf(idKey));

		model.addAttribute("sellerStatusList", codeService.selectCodeList("SellerActiveStatus"));
		model.addAttribute("bizOwnershipList", codeService.selectCodeList("BizOwnership"));
		model.addAttribute("bankCodeList", codeService.selectCodeList("BankCode"));
		model.addAttribute("nationCodeList", codeService.selectCodeList("NationCode"));
		model.addAttribute("form", form);
		SellerUserVO data = service.selectSellerInfo(form);
		if(data != null && !StringUtils.isEmpty(data.getBizType()) && data.getBizType().indexOf("/") > 0) {
			String[] arr = data.getBizType().split("/");
			data.setBizType1(arr[0]);
			data.setBizType2(arr[1]);
		}
		model.addAttribute("data", data);
		model.addAttribute("commentList", service.selectSellerCommentList(form));
		
		model.addAttribute("bizCertAttach", attachService.selectAttachInfoByGrp(data.getBizCertAttachId()));
		model.addAttribute("onlineSalesAttach", attachService.selectAttachInfoByGrp(data.getOnlineSalesAttachId()));
		model.addAttribute("accountAttach", attachService.selectAttachInfoByGrp(data.getAccountAttachId()));
		model.addAttribute("evidenceAttach", attachService.selectAttachInfoByGrp(data.getEvidenceAttachId()));
		model.addAttribute("idnCertAttach", attachService.selectAttachInfoByGrp(data.getIdnCertAttachId()));
		
		return "mypage/edit.seller";
	}

}
