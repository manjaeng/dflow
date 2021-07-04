package kr.co.thenet.fapee.setting.web;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.thenet.fapee.setting.service.MyRewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.thenet.fapee.common.model.BaseSearchVO;
import kr.co.thenet.fapee.common.model.RestResultVO;
import kr.co.thenet.fapee.common.model.RewardAccountVO;
import kr.co.thenet.fapee.common.model.RewardInoutVO;
import kr.co.thenet.fapee.common.util.SessionUtils;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MyRewardRestController {

	@Autowired
	private MyRewardService rewardService;
	
	//내 리워드 목록.
	@RequestMapping("/app/setting/rest/reward_history.do")
	public Map<String, Object> rewardHistory(BaseSearchVO form, HttpServletRequest req) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//현재 사용자ID로 설정.
		form.setIdKey((SessionUtils.isLogin(req))? SessionUtils.getIdKey() : -99);
		//기간 설정
		DateTimeFormatter dateFMT = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter yymmFMT = DateTimeFormatter.ofPattern("yyyy-MM");
		String today = LocalDate.now().format(dateFMT);	//
		if( !StringUtils.isEmpty(form.getYyyyMm()) && form.getYyyyMm().length()==7) {	//yyyy-MM형식으로 넘어온 경우.
			LocalDate yyyymm = YearMonth.parse(form.getYyyyMm(), yymmFMT).atDay(1);
			form.setFrDate(yyyymm.format(dateFMT));	//선택된 월의 1일.
			form.setToDate(yyyymm.plusMonths(1).minusDays(1).format(dateFMT));	//선택된 월의 말일.
		}
		else if("3M".equals(form.getYyyyMm())) {
			form.setFrDate(LocalDate.now().minusMonths(3).plusDays(1).format(dateFMT));	//3개월전 다음날짜~
			form.setToDate(today);		//오늘
		}
		else if("6M".equals(form.getYyyyMm())) {
			form.setFrDate(LocalDate.now().minusMonths(6).plusDays(1).format(dateFMT));	//6개월전 다음날짜~
			form.setToDate(today);		//오늘
		}
		else {	//선택되지 않은 경우 기본은 한달.
			form.setFrDate(LocalDate.now().minusMonths(1).plusDays(1).format(dateFMT));	//1개월전 다음날짜~
			form.setToDate(today);		//오늘
		}
		
		List<RewardInoutVO> list = rewardService.selectRewardList(form);
		if(list.size() > 0) {
			form.setTotalRows(list.get(0).getTotalRows());
		}
		resultMap.put("form", form);
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@PostMapping("/app/setting/rest/myrewardWithdrawal.do")
	public RestResultVO myrewardWithdrawal(RewardInoutVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setIdKey(SessionUtils.getIdKey());
			form.setCreateId(String.valueOf(SessionUtils.getIdKey()));
			int cnt = rewardService.insertRewardWithdrawal(form);
			
			return (cnt==0)? RestResultVO.of(-1, "신청에 실패하였습니다.") : RestResultVO.of(0, "신청되었습니다.");
		}

	}
	
	@PostMapping("/app/setting/rest/accountInfo.do")
	public RestResultVO accountInfo(RewardAccountVO form, HttpServletRequest req) throws Exception {
		if ( !SessionUtils.isLogin(req) ) {
			return RestResultVO.of(401, "로그인 후 이용하세요");
		}
		else {
			form.setUserIdKey(SessionUtils.getIdKey());
			int cnt = rewardService.updateAccountInfo(form);
			
			return (cnt==0)? RestResultVO.of(-1, "저장에 실패하였습니다.") : RestResultVO.of(0, "저장되었습니다.");
		}

	}

}
