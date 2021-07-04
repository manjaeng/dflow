package kr.co.thenet.fapee.seller.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.seller.model.SellerTermsVO;
import kr.co.thenet.fapee.seller.service.SellerTermsService;

@Service
public class SellerTermsServiceImpl implements SellerTermsService{
	
	@Autowired
	private SellerTermsMapper mapper;
	
	//약관.
	@Override
	public List<SellerTermsVO> selectSellerTermsList(SellerSearchVO form) throws Exception {
		return mapper.selectSellerTermsList(form);
	}

	@Override
	public SellerTermsVO selectSellerTermsInfo(SellerSearchVO form) throws Exception {
		return mapper.selectSellerTermsInfo(form.getDataKey());
	}

	@Override
	public SellerTermsVO selectSellerTermsInfo(String value) throws Exception {
		return mapper.selectSellerTermsInfo(value);
	}

	@Override
	public RestResultVO insertSellerTerms(SellerTermsVO form) throws Exception {
		int cnt = mapper.insertSellerTerms(form);
		return (cnt==0)? RestResultVO.of(-1, "등록시 오류가 발생하였습니다.") : RestResultVO.of(0, "등록되었습니다.");
	}

	@Override
	public RestResultVO updateSellerTerms(SellerTermsVO form) throws Exception {
		int cnt = mapper.updateSellerTerms(form);
		return (cnt==0)? RestResultVO.of(-1, "업데이트된 데이터가 없습니다.") : RestResultVO.of(0, "저장되었습니다.");
	}

	@Override
	public RestResultVO deleteSellerTerms(SellerTermsVO form) throws Exception {
		int cnt = mapper.deleteSellerTerms(form);
		return (cnt==0)? RestResultVO.of(-1, "삭제된 데이터가 없습니다.") : RestResultVO.of(0, "삭제되었습니다.");
	}

}