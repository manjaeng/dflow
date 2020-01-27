package kr.co.thenet.fapee.reward.web;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.reward.model.RewardCommentVO;
import kr.co.thenet.fapee.reward.model.RewardVO;
import kr.co.thenet.fapee.reward.model.WithdrawalVO;
import kr.co.thenet.fapee.reward.service.RewardService;

@RestController
@RequestMapping("/app/reward")
public class RewardRestController {

	@Autowired
	private RewardService service;

	/**
	 * 계산서 상태 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/billStatus.do")
	public RestResultVO billStatus(RewardVO form, HttpSession session) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.updateBillStatus(form);
	}

	/**
	 * 입금 상태 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/depositStatus.do")
	public RestResultVO depositStatus(RewardVO form, HttpSession session) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		form.setDepositHistory(String.format("<p>%s %s %s<p>\n"
				, (form.getDepositStatusName())
				, LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"))
				, form.getLastUpdateId()
		));
		return service.updateDepositStatus(form);
	}

	/**
	 * 출금 상태 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/withdrawalStatus.do")
	public RestResultVO withdrawalStatus(WithdrawalVO form, HttpSession session) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.updateWithdrawalStatus(form);
	}

	/**
	 * 리워드 코멘트 등록
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/comment.do")
	public RestResultVO comment(RewardCommentVO form, HttpSession session) throws Exception {
		form.setCreateId((String)session.getAttribute("SSMcpUserId"));
		return service.insertRewardComment(form);
	}

	/**
	 * 리워드 코멘트 삭제
	 * @param form
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/rest/deleteComment.do")
	public RestResultVO deleteComment(RewardCommentVO form, HttpSession session) throws Exception {
		form.setLastUpdateId((String)session.getAttribute("SSMcpUserId"));
		return service.deleteRewardComment(form);
	}

}
