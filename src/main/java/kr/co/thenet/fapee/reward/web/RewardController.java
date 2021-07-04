package kr.co.thenet.fapee.reward.web;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.reward.model.RewardSearchVO;
import kr.co.thenet.fapee.reward.model.RewardSummaryVO;
import kr.co.thenet.fapee.reward.model.RewardVO;
import kr.co.thenet.fapee.reward.model.WithdrawalVO;
import kr.co.thenet.fapee.reward.service.RewardService;
import kr.co.thenet.fapee.seller.service.SellerUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/reward")
public class RewardController {

	@Autowired
	private RewardService service;

	@Autowired
	private CodeService codeService;

	@Autowired
	private SellerUserService sellerService;

	@GetMapping("/approvalList.do")
	public String list(RewardSearchVO form, HttpSession session, Model model) throws Exception {
		LocalDate prevMonth = LocalDate.now().minusMonths(1);
		if(StringUtils.isEmpty(form.getYear())) form.setYear(prevMonth.format(DateTimeFormatter.ofPattern("yyyy")));
		if(StringUtils.isEmpty(form.getMonth())) form.setMonth(prevMonth.format(DateTimeFormatter.ofPattern("MM")));
		
		form.setYyyyMm( String.format("%s-%s", form.getYear(), form.getMonth()) );
		
		//해당월 시작일과 마지막 일자 설정.
		LocalDate frDate = LocalDate.of(Integer.valueOf(form.getYear()), Integer.valueOf(form.getMonth()), 1);
		form.setFrDate(frDate.toString());
		form.setToDate(frDate.plusMonths(1).minusDays(1).toString());

		RewardSummaryVO summary = service.selectRewardApprovalSummary(form);
		
		model.addAttribute("form", form);
		model.addAttribute("summary", summary );
		
		List<RewardVO> list = service.selectRewardList(form);
		model.addAttribute("totalRows", 0);
		model.addAttribute("rewardCount", 0);
		model.addAttribute("notRewardCount", 0);
		if(list.size() > 0) {
			RewardVO reward = list.get(0);
			form.setTotalRows(reward.getTotalRows());
			model.addAttribute("totalRows", form.getTotalRows());
			//model.addAttribute("rewardCount", reward.getRewardCount());
			//model.addAttribute("notRewardCount", reward.getTotalRows()-reward.getRewardCount());
		}
		
		model.addAttribute("list", list );

		return "reward/approval_list.mcp";
	}

	@GetMapping("/approvalView.do")
	public String view(RewardSearchVO form, Model model) throws Exception {
		LocalDate prevMonth = LocalDate.now().minusMonths(1);
		if(StringUtils.isEmpty(form.getYear())) form.setYear(prevMonth.format(DateTimeFormatter.ofPattern("yyyy")));
		if(StringUtils.isEmpty(form.getMonth())) form.setMonth(prevMonth.format(DateTimeFormatter.ofPattern("MM")));
		
		form.setYyyyMm( String.format("%s-%s", form.getYear(), form.getMonth()) );
		
		//해당월 시작일과 마지막 일자 설정.
		LocalDate frDate = LocalDate.of(Integer.valueOf(form.getYear()), Integer.valueOf(form.getMonth()), 1);
		form.setFrDate(frDate.toString());
		form.setToDate(frDate.plusMonths(1).minusDays(1).toString());
		
		model.addAttribute("form", form);
		List<RewardVO> list = service.selectRewardList(form);
		if(list.size() > 0) {
			model.addAttribute("settleApprovalDate", list.get(0).getSettleApprovalDate() );
		}
		model.addAttribute("list", list );
		
		form.setRows(100000);	//페이징되지 않도록 크게 잡음.
		model.addAttribute("productList", service.selectRewardProductList(form) );

		return "reward/approval_view.mcp";
	}

	@GetMapping("/settleList.do")
	public String settleList(RewardSearchVO form, Model model) throws Exception {

		LocalDate prevMonth = LocalDate.now().minusMonths(1);
		if(StringUtils.isEmpty(form.getYear())) form.setYear(prevMonth.format(DateTimeFormatter.ofPattern("yyyy")));
		if(StringUtils.isEmpty(form.getMonth())) form.setMonth(prevMonth.format(DateTimeFormatter.ofPattern("MM")));
		
		form.setYyyyMm( String.format("%s-%s", form.getYear(), form.getMonth()) );
		
		//해당월 시작일과 마지막 일자 설정.
		LocalDate frDate = LocalDate.of(Integer.valueOf(form.getYear()), Integer.valueOf(form.getMonth()), 1);
		form.setFrDate(frDate.toString());
		form.setToDate(frDate.plusMonths(1).minusDays(1).toString());
		
		//리워드 합계.
		model.addAttribute("summary", service.selectRewardSummaryForMcp(form));
		
		//셀러별 리워드 정보 목록.
		List<RewardVO> list = service.selectRewardList(form);
		model.addAttribute("totalRows", 0);
		model.addAttribute("depositCount", 0);
		model.addAttribute("undepositCount", 0);

		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
			model.addAttribute("totalRows", form.getTotalRows());
			model.addAttribute("depositCount", list.get(0).getDepositCount());
			model.addAttribute("undepositCount", list.get(0).getUndepositCount());
		}
		model.addAttribute("list", list );

		model.addAttribute("form", form);

		return "reward/settle_list.mcp";
	}

	@GetMapping("/settleView.do")
	public String settleView(RewardSearchVO form, Model model) throws Exception {
		
		form.setIdKey(Long.valueOf(form.getDataKey()));
		form.setYyyyMm( String.format("%s-%s", form.getYear(), form.getMonth()) );
		
		model.addAttribute("seller", sellerService.selectSellerInfo( form.getDataKey() ) );
		model.addAttribute("data", service.selectRewardInfo(form) );

		form.setType("SETTLE");
		model.addAttribute("commentList", service.selectRewardCommentList(form));

		return "reward/settle_view.mcp";
	}

	@GetMapping("/withdrawalList.do")
	public String withdrawal(RewardSearchVO form, Model model) throws Exception {
		Map<String, LocalDate> dateMap = new HashMap<String, LocalDate>();
		dateMap.put("D01", LocalDate.now());
		dateMap.put("W01", LocalDate.now().minusWeeks(1).plusDays(1));
		dateMap.put("M01", LocalDate.now().minusMonths( 1).plusDays(1));
		dateMap.put("M03", LocalDate.now().minusMonths( 3).plusDays(1));
		dateMap.put("M06", LocalDate.now().minusMonths( 6).plusDays(1));
		dateMap.put("M12", LocalDate.now().minusMonths(12).plusDays(1));
		model.addAttribute("dateMap", dateMap);
		
		model.addAttribute("withdrawalStatusList", codeService.selectCodeList("RewardWithdrawalStatus"));
		
		LocalDate prevMonth = LocalDate.now().minusMonths(1);
		if(StringUtils.isEmpty(form.getYear())) form.setYear(prevMonth.format(DateTimeFormatter.ofPattern("yyyy")));
		if(StringUtils.isEmpty(form.getMonth())) form.setMonth(prevMonth.format(DateTimeFormatter.ofPattern("MM")));

		model.addAttribute("totalRows", 0);
		model.addAttribute("waitCount", 0);
		model.addAttribute("completeCount", 0);
		model.addAttribute("incompleteCount", 0);

		List<WithdrawalVO> list = service.selectWithdrawalList(form);
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
			model.addAttribute("totalRows", form.getTotalRows());
			model.addAttribute("waitCount", list.get(0).getWaitCount());
			model.addAttribute("completeCount", list.get(0).getCompleteCount());
			model.addAttribute("incompleteCount", list.get(0).getIncompleteCount());
		}

		model.addAttribute("list", list );
		
		model.addAttribute("form", form);

		return "reward/withdrawal_list.mcp";
	}

}
