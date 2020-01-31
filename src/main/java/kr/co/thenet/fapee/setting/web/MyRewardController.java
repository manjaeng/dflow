package kr.co.thenet.fapee.setting.web;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RewardAccountVO;
import kr.co.thenet.fapee.common.model.RewardInoutVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import kr.co.thenet.fapee.home.service.CodeService;
import kr.co.thenet.fapee.setting.service.MyRewardService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MyRewardController {

	@Autowired
	private MyRewardService rewardService;

	@Autowired
	private CodeService codeService;
	
	//내 리워드 내역
	@GetMapping("/app/setting/myreward.do")
	public String shoppingList(BaseSearchVO form, Model model) throws Exception {
		
		model.addAttribute("bankCodeList", codeService.selectCodeList("BankCode"));

		form.setIdKey(SessionUtils.getIdKey());
		RewardAccountVO accountInfo = rewardService.selectRewardAccountInfo(form);
		RewardInoutVO summary = rewardService.selectRewardSummary(form);
		
		model.addAttribute("account", accountInfo);
		model.addAttribute("totalPoint", summary.getInTotalAmount());
		model.addAttribute("payablePoint", (summary.getInTotalAmount()-summary.getOutTotalAmount()));
		
		List<String> yearList = new ArrayList<String>();
		for(int i = LocalDate.now().getYear(); i >= 2019; i--) {
			yearList.add(String.valueOf(i));
		}
		
		List<String> monthList = new ArrayList<String>();
		for(int i = 1; i <= 12; i++) {
			monthList.add(String.format("%02d", i));
		}
		
		model.addAttribute("form", form);
		model.addAttribute("yearList", yearList);
		model.addAttribute("monthList", monthList);
		
		return "setting/myreward.app";
	}

}
