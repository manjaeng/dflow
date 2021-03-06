package kr.co.thenet.fapee.seller.service.impl;

import java.util.List;

import kr.co.thenet.fapee.home.service.AttachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import kr.co.thenet.fapee.common.model.AttachFileVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.common.util.CommonFunc;
import kr.co.thenet.fapee.common.util.MailUtils;
import kr.co.thenet.fapee.seller.model.SellerCommentVO;
import kr.co.thenet.fapee.seller.model.SellerSearchVO;
import kr.co.thenet.fapee.seller.model.SellerUserVO;
import kr.co.thenet.fapee.seller.service.SellerUserService;
import lombok.Builder;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Builder
public class SellerUserServiceImpl implements SellerUserService{
	
	@Autowired
	private SellerUserMapper mapper;
	
	@Autowired
	private AttachService attachService;
	
	@Override
	public List<SellerUserVO> selectSellerList(SellerSearchVO form) throws Exception {
		//if(form.getFrDate())
		return mapper.selectSellerList(form);
	}
	
	@Override
	public List<SellerUserVO> selectSellerSearchList(SellerSearchVO form) throws Exception {
		//if(form.getFrDate())
		return mapper.selectSellerSearchList(form);
	}
	
	@Override
	public List<SellerUserVO> selectApplyList(SellerSearchVO form) throws Exception {
		return mapper.selectApplyList(form);
	}
	
	@Override
	public SellerUserVO selectSellerInfo(String idKey) throws Exception {
		SellerSearchVO form = new SellerSearchVO();
		form.setDataKey(idKey);
		return mapper.selectSellerInfo(form);
	}
	
	@Override
	public SellerUserVO selectSellerInfo(SellerSearchVO form) throws Exception {
		return mapper.selectSellerInfo(form);
	}
	
	@Override
	public SellerUserVO selectSellerInfo(SellerUserVO form) throws Exception {
		return mapper.selectSellerInfo(form);
	}

	@Override
	public RestResultVO updateSellerLogin(SellerUserVO form) throws Exception {
		int cnt = mapper.updateSellerLogin(form);
		return (cnt==0)? RestResultVO.of(-1, "??????????????? ???????????? ????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	@Override
	public RestResultVO insertSellerInfo(SellerUserVO form) throws Exception {
		//?????? ?????? ????????? ???????????? ????????? ??????.
		mapper.deleteRejectCommentForRegist(form);
		mapper.deleteRejectSellerForRegist(form);
		
		SellerUserVO user = mapper.selectSellerInfo(form.getIdKey());
		if(user != null) {
			return RestResultVO.of(-1, "?????? ????????? ???????????????.");
		}
		
		AttachFileVO attachVO =null;
		
		//????????????????????????
		if(form.getBizCertFile() != null && form.getBizCertFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getBizCertAttachId())) form.setBizCertAttachId(String.format("SLR-biz-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getBizCertFile(), form.getBizCertAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getBizCertFileName()) && !StringUtils.isEmpty(form.getBizCertAttachId())) {
			attachService.deleteAttachFile(form.getBizCertAttachId());
			form.setBizCertAttachId(null);
		}
		//?????????????????????
		if(form.getOnlineSalesFile() != null && form.getOnlineSalesFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getOnlineSalesAttachId())) form.setOnlineSalesAttachId(String.format("SLR-onl-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getOnlineSalesFile(), form.getOnlineSalesAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getOnlineSalesFileName()) && !StringUtils.isEmpty(form.getOnlineSalesAttachId())) {
			attachService.deleteAttachFile(form.getOnlineSalesAttachId());
			form.setOnlineSalesAttachId(null);
		}
		//????????????
		if(form.getAccountFile() != null && form.getAccountFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getAccountAttachId())) form.setAccountAttachId(String.format("SLR-acc-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getAccountFile(), form.getAccountAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getAccountFileName()) && !StringUtils.isEmpty(form.getAccountAttachId())) {
			attachService.deleteAttachFile(form.getAccountAttachId());
			form.setAccountAttachId(null);
		}
		//????????????
		if(form.getEvidenceFile() != null && form.getEvidenceFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getEvidenceAttachId())) form.setEvidenceAttachId(String.format("SLR-evi-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getEvidenceFile(), form.getEvidenceAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getEvidenceFileName()) && !StringUtils.isEmpty(form.getEvidenceAttachId())) {
			attachService.deleteAttachFile(form.getEvidenceAttachId());
			form.setEvidenceAttachId(null);
		}
		//??????????????????
		if(form.getIdnCertFile() != null && form.getIdnCertFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getIdnCertAttachId())) form.setIdnCertAttachId(String.format("SLR-idn-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getIdnCertFile(), form.getIdnCertAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getIdnCertFileName()) && !StringUtils.isEmpty(form.getIdnCertAttachId())) {
			attachService.deleteAttachFile(form.getIdnCertAttachId());
			form.setIdnCertAttachId(null);
		}
		
		int cnt = mapper.insertSellerInfo(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	@Override
	public RestResultVO updateSellerInfo(SellerUserVO form) throws Exception {
		SellerUserVO user = mapper.selectSellerInfo(form.getIdKey());
		AttachFileVO attachVO =null;
		
		//????????????????????????
		if(form.getBizCertFile() != null && form.getBizCertFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getBizCertAttachId())) form.setBizCertAttachId(String.format("SLR-biz-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getBizCertFile(), form.getBizCertAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getBizCertFileName()) && !StringUtils.isEmpty(form.getBizCertAttachId())) {
			attachService.deleteAttachFile(form.getBizCertAttachId());
			form.setBizCertAttachId(null);
		}
		//?????????????????????
		if(form.getOnlineSalesFile() != null && form.getOnlineSalesFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getOnlineSalesAttachId())) form.setOnlineSalesAttachId(String.format("SLR-onl-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getOnlineSalesFile(), form.getOnlineSalesAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getOnlineSalesFileName()) && !StringUtils.isEmpty(form.getOnlineSalesAttachId())) {
			attachService.deleteAttachFile(form.getOnlineSalesAttachId());
			form.setOnlineSalesAttachId(null);
		}
		//????????????
		if(form.getAccountFile() != null && form.getAccountFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getAccountAttachId())) form.setAccountAttachId(String.format("SLR-acc-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getAccountFile(), form.getAccountAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getAccountFileName()) && !StringUtils.isEmpty(form.getAccountAttachId())) {
			attachService.deleteAttachFile(form.getAccountAttachId());
			form.setAccountAttachId(null);
		}
		//????????????
		if(form.getEvidenceFile() != null && form.getEvidenceFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getEvidenceAttachId())) form.setEvidenceAttachId(String.format("SLR-evi-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getEvidenceFile(), form.getEvidenceAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getEvidenceFileName()) && !StringUtils.isEmpty(form.getEvidenceAttachId())) {
			attachService.deleteAttachFile(form.getEvidenceAttachId());
			form.setEvidenceAttachId(null);
		}
		//??????????????????
		if(form.getIdnCertFile() != null && form.getIdnCertFile().getSize() > 0) {
			if(StringUtils.isEmpty(form.getIdnCertAttachId())) form.setIdnCertAttachId(String.format("SLR-idn-%d", form.getIdKey()));
			attachVO = AttachFileVO.of(form.getIdnCertFile(), form.getIdnCertAttachId());
			attachService.saveAttachFileByGrp(attachVO);
		}
		else if( StringUtils.isEmpty(form.getIdnCertFileName()) && !StringUtils.isEmpty(form.getIdnCertAttachId())) {
			attachService.deleteAttachFile(form.getIdnCertAttachId());
			form.setIdnCertAttachId(null);
		}
		
		//?????? ??????????????? ?????? ?????? ???????????? ????????????.
		if(form.getNewPassword() != null && form.getNewPassword().length() > 0) {
			form.setNewPassword(CommonFunc.getHashedPassword(form.getNewPassword()));	//?????????????????? ?????????
			mapper.updateUserPassword(form);
		}
		
		//???????????? ??????
		int cnt = mapper.updateSellerInfo(form);
		return (cnt==0)? RestResultVO.of(-1, "??????????????? ???????????? ????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	@Override
	public RestResultVO updateSellerApplyStatus(SellerUserVO form) throws Exception {
		int cnt = mapper.updateSellerApplyStatus(form);
		if(cnt > 0) {
			SellerUserVO user = mapper.selectSellerInfo(form.getIdKey());
			String mailTitle = null;
			String mailContent = null;
			if("A".equals(form.getApprovalStatus())) {
				mailTitle = "[FAPEE] ?????? ?????? ????????? ?????????????????????.";
				mailContent = MailUtils.getContent("join_seller");
			}
			else if("R".equals(form.getApprovalStatus())) {
				mailTitle = "[FAPEE] ?????? ?????? ????????? ?????????????????????.";
				mailContent = MailUtils.getContent("join_seller_return").replaceAll("##REASON##", form.getRejectReason());
			}
			
			log.info(mailContent);
			log.info(user.getEmail());
			
			//?????? ????????? ?????? ????????? ?????? ?????? ?????? ??????.
			if( !(StringUtils.isEmpty(user.getEmail()) || StringUtils.isEmpty(mailContent)) ) {
				MailUtils.sendMail(user.getEmail(), mailTitle, mailContent);
			}
		}
		return (cnt==0)? RestResultVO.of(-1, "??????????????? ???????????? ????????????.") : RestResultVO.of(0, "?????? ?????????????????????.");
	}
	
	//?????????.
	@Override
	public List<SellerCommentVO> selectSellerCommentList(SellerSearchVO form) throws Exception {
		return mapper.selectSellerCommentList(form);
	}

	@Override
	public RestResultVO insertSellerComment(SellerCommentVO form) throws Exception {
		int cnt = mapper.insertSellerComment(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ????????? ?????????????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

	@Override
	public RestResultVO deleteSellerComment(SellerCommentVO form) throws Exception {
		int cnt = mapper.deleteSellerComment(form);
		return (cnt==0)? RestResultVO.of(-1, "????????? ???????????? ????????????.") : RestResultVO.of(0, "?????????????????????.");
	}

}