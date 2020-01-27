package kr.co.thenet.fapee.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.thenet.fapee.common.model.AttachFileVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.home.service.AttachService;
import kr.co.thenet.fapee.product.model.ProductCommentVO;
import kr.co.thenet.fapee.product.model.ProductHistoryVO;
import kr.co.thenet.fapee.product.model.ProductLookVO;
import kr.co.thenet.fapee.product.model.ProductSearchVO;
import kr.co.thenet.fapee.product.model.ProductVO;
import kr.co.thenet.fapee.product.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper mapper;
	
	@Autowired
	private AttachService attachService;

	@Override
	public List<ProductVO> selectInspectionList(ProductSearchVO form) throws Exception {
		return mapper.selectInspectionList(form);
	}

	@Override
	public List<ProductVO> selectSalesList(ProductSearchVO form) throws Exception {
		return mapper.selectSalesList(form);
	}

	@Override
	public ProductVO selectProductInfo(ProductSearchVO form) throws Exception {
		return mapper.selectProductInfo(form);
	}

	@Override
	public RestResultVO registProduct(ProductVO form) throws Exception {
		RestResultVO result = null;
		int cnt = 0;
		//제품코드 채번.
		String pcode = form.getPcode();
		boolean isNew = false;
		//제품정보 먼저 신규 저장. 이미지 올린 후에 다시 한번 업데이트.
		if(StringUtils.isEmpty(pcode)) {
			isNew = false;
			pcode = mapper.selectNewPcode();
			form.setPcode(pcode);
			cnt = mapper.insertProduct(form);
			log.info("New pcode={}", form.getPcode());
		}

		AttachFileVO attachVO =null;
		
		//메인이미지
		if(form.getMainImageFile() != null && form.getMainImageFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getMainImageId())) form.setMainImageId(String.format("PRD-img0-%s", pcode));
			attachVO = AttachFileVO.of(form.getMainImageFile(), form.getMainImageId());
			attachService.saveImageFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getMainImageName()) && !StringUtils.isEmpty(form.getMainImageId())) {
			attachService.deleteAttachFile(form.getMainImageId());
			form.setMainImageId(null);
		}
		//제품이미지-1
		if(form.getProductImageFile1() != null && form.getProductImageFile1().getSize() > 0) {
			if(StringUtils.isEmpty(form.getProductImageId1())) form.setProductImageId1(String.format("PRD-img1-%s", pcode));
			attachVO = AttachFileVO.of(form.getProductImageFile1(), form.getProductImageId1());
			attachService.saveImageFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getProductImageName1()) && !StringUtils.isEmpty(form.getProductImageId1())) {
			attachService.deleteAttachFile(form.getProductImageId1());
			form.setProductImageId1(null);
		}
		//제품이미지-2
		if(form.getProductImageFile2() != null && form.getProductImageFile2().getSize() > 0) {
			if(StringUtils.isEmpty(form.getProductImageId2())) form.setProductImageId2(String.format("PRD-img2-%s", pcode));
			attachVO = AttachFileVO.of(form.getProductImageFile2(), form.getProductImageId2());
			attachService.saveImageFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getProductImageName2()) && !StringUtils.isEmpty(form.getProductImageId2())) {
			attachService.deleteAttachFile(form.getProductImageId2());
			form.setProductImageId2(null);
		}
		//제품이미지-3
		if(form.getProductImageFile3() != null && form.getProductImageFile3().getSize() > 0) {
			if(StringUtils.isEmpty(form.getProductImageId3())) form.setProductImageId3(String.format("PRD-img3-%s", pcode));
			attachVO = AttachFileVO.of(form.getProductImageFile3(), form.getProductImageId3());
			attachService.saveImageFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getProductImageName3()) && !StringUtils.isEmpty(form.getProductImageId3())) {
			attachService.deleteAttachFile(form.getProductImageId3());
			form.setProductImageId3(null);
		}
		//제품이미지-4
		if(form.getProductImageFile4() != null && form.getProductImageFile4().getSize() > 0) {
			if(StringUtils.isEmpty(form.getProductImageId4())) form.setProductImageId4(String.format("PRD-img4-%s", pcode));
			attachVO = AttachFileVO.of(form.getProductImageFile4(), form.getProductImageId4());
			attachService.saveImageFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getProductImageName4()) && !StringUtils.isEmpty(form.getProductImageId4())) {
			attachService.deleteAttachFile(form.getProductImageId4());
			form.setProductImageId4(null);
		}

		//이미지 올린 후에 업데이트.
		cnt = mapper.updateProduct(form);

		//제품정보 저장
		if(isNew) {
			//변경이력 추가(키생성후).
			this.insertProductHistory(form, "CREATE");
			result = (cnt==0)? RestResultVO.of(-1, "등록되지 않았습니다.") : RestResultVO.of(0, "저장되었습니다.");
		}
		else {
			//변경이력 추가.
			this.insertProductHistory(form, "UPDATE");
			result = (cnt==0)? RestResultVO.of(-1, "업데이트된 데이터가 없습니다.") : RestResultVO.of(0, "저장되었습니다.");
		}

		return result;
	}

	@Override
	public RestResultVO updateProductInspectionStatus(ProductVO form) throws Exception {
		//변경이력 추가.
		this.insertProductHistory(form, "INSPECTION");
		
		int cnt = mapper.updateProductInspectionStatus(form);
		return (cnt==0)? RestResultVO.of(-1, "업데이트된 데이터가 없습니다.") : RestResultVO.of(0, "저장되었습니다.");
	}

	@Override
	public RestResultVO updateProductSalesStatus(ProductVO form) throws Exception {
		//변경이력 추가.
		this.insertProductHistory(form, "SALES");
		
		int cnt = mapper.updateProductSalesStatus(form);
		return (cnt==0)? RestResultVO.of(-1, "업데이트된 데이터가 없습니다.") : RestResultVO.of(0, "저장되었습니다.");
	}

	@Override
	public RestResultVO deleteProduct(ProductVO form) throws Exception {
		int cnt = mapper.deleteProduct(form);
		return (cnt==0)? RestResultVO.of(-1, "삭제된 데이터가 없습니다.") : RestResultVO.of(0, "삭제되었습니다.");
	}
	
	//코멘트.
	@Override
	public List<ProductCommentVO> selectProductCommentList(ProductSearchVO form) throws Exception {
		return mapper.selectProductCommentList(form);
	}

	@Override
	public RestResultVO insertProductComment(ProductCommentVO form) throws Exception {
		int cnt = mapper.insertProductComment(form);
		return (cnt==0)? RestResultVO.of(-1, "등록시 오류가 발생하였습니다.") : RestResultVO.of(0, "등록되었습니다.");
	}

	@Override
	public RestResultVO deleteProductComment(ProductCommentVO form) throws Exception {
		int cnt = mapper.deleteProductComment(form);
		return (cnt==0)? RestResultVO.of(-1, "삭제된 데이터가 없습니다.") : RestResultVO.of(0, "삭제되었습니다.");
	}

	
	//게시룩..
	@Override
	public List<ProductLookVO> selectProductLookList(ProductSearchVO form) throws Exception {
		return mapper.selectProductLookList(form);
	}

	
	//상품변경히스토리..
	@Override
	public List<ProductHistoryVO> selectProductHistoryList(ProductSearchVO form) throws Exception {
		return mapper.selectProductHistoryList(form);
	}

	@Override
	public RestResultVO insertProductHistory(ProductVO form, String eventType) throws Exception {
		ProductSearchVO searchVO = new ProductSearchVO();
		searchVO.setDataKey(form.getPcode());
		ProductVO product = mapper.selectProductInfo(searchVO);
		
		ProductHistoryVO history = new ProductHistoryVO();
		if("CREATE".equals(eventType) || "UPDATE".equals(eventType)) {
			history.setPcode(form.getPcode());
			history.setPname(form.getPname());
			history.setPrice(form.getPrice());
			history.setFeeRate(form.getFeeRate());
			history.setRewardRate(form.getRewardRate());
			history.setLinkUrl(form.getLinkUrl());
			history.setIdKey(form.getIdKey());
			if( ! StringUtils.isEmpty(form.getLastUpdateId()) ) {
				history.setLastUpdateId(form.getLastUpdateId());
			}
			else if( ! StringUtils.isEmpty(form.getCreateId()) ) {
				history.setLastUpdateId(form.getCreateId());
			}
			else if( ! StringUtils.isEmpty(form.getInspectionId()) ) {
				history.setLastUpdateId(form.getInspectionId());
			}
		}
		else {
			history.setPcode(product.getPcode());
			history.setPname(product.getPname());
			history.setPrice(product.getPrice());
			history.setFeeRate(product.getFeeRate());
			history.setRewardRate(product.getRewardRate());
			history.setLinkUrl(product.getLinkUrl());
			history.setIdKey(product.getIdKey());
			if( ! StringUtils.isEmpty(form.getLastUpdateId()) ) {
				history.setLastUpdateId(form.getLastUpdateId());
			}
			else if( ! StringUtils.isEmpty(form.getInspectionId()) ) {
				history.setLastUpdateId(form.getInspectionId());
			}
		}
		
		if("CREATE".equals(eventType)) {
			if("W".equals(form.getInspectionStatus()) || !"W".equals(product.getInspectionStatus())) {
				history.setSalesStatus(null);
				history.setInspectionStatus(form.getInspectionStatus());
				history.setChangeReason("검수요청");
			}
		}
		else if("UPDATE".equals(eventType)) {
			if("W".equals(form.getInspectionStatus()) || !"W".equals(product.getInspectionStatus())) {
				history.setSalesStatus(null);
				history.setInspectionStatus(form.getInspectionStatus());
				history.setChangeReason("검수요청");
			}
		}
		else if("INSPECTION".equals(eventType)) {
			if("A".equals(form.getInspectionStatus()) || !"A".equals(product.getInspectionStatus())) {
				history.setSalesStatus("A");
				history.setInspectionStatus(form.getInspectionStatus());
				history.setChangeReason("검수상태 변경(승인)");
			}
			else if("R".equals(form.getInspectionStatus()) || !"R".equals(product.getInspectionStatus())) {
				history.setSalesStatus(null);
				history.setInspectionStatus(form.getInspectionStatus());
				history.setChangeReason("검수상태 변경(반려)");
			}
		}
		else if("SALES".equals(eventType)) {
			history.setSalesStatus(form.getSalesStatus());
			history.setInspectionStatus(product.getInspectionStatus());
			if("A".equals(form.getSalesStatus()) || !"A".equals(product.getSalesStatus())) {
				history.setChangeReason("판매상태 변경");
			}
			else if("S".equals(form.getSalesStatus()) || !"S".equals(product.getSalesStatus())) {
				history.setChangeReason("판매상태 변경");
			}
		}
		
		try {
			ObjectMapper mapper = new ObjectMapper();
			history.setOriginData(mapper.writeValueAsString(product));
		} catch(Exception e) {}
		
		if( ! StringUtils.isEmpty(history.getChangeReason()) ) {
			int cnt = mapper.insertProductHistory(history);
			return (cnt==0)? RestResultVO.of(-1, "등록시 오류가 발생하였습니다.") : RestResultVO.of(0, "등록되었습니다.");
		}
		else {
			return RestResultVO.of(0, "SKIP");
		}
	}
	
}