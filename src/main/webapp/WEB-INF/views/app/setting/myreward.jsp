<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain reward">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">내 리워드 관리</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section>
                <h1 class="sec_h1 ">
                    <span class="tit">MY REWARD POINT</span>
                    <span class="sub_pt ">TOTAL <span><fmt:formatNumber type="number" value="${totalPoint}" /></span>P</span>
                </h1>
                
                <article>
                    <ul class="uiTab type a">
                        <li class="active"><a href="#tabPanelA1">MY REWARD</a></li>
                        <li class=""><a href="#tabPanelA2" onclick="historyReload();">HISTORY</a></li>
                        <li class=""><a href="#tabPanelA3">SETTING</a></li>
                    </ul>
                    <div class="uiTabPan">
                        <div class="panel myrw active" id="tabPanelA1">
                            <div class="tab_ct">
                                <div class="pt_wrap">
                                    <h2 class="tit">REWARD EXCHANGE</h2>
                                    <dl class="dl1">
                                        <dt>지급 가능 포인트</dt>
                                        <dd><span class="point_val"><fmt:formatNumber type="number" value="${payablePoint}" />P</span></dd>
                                    </dl>
                                    <dl class="dl2">
                                        <dt>지급 신청 포인트</dt>
                                        <dd >
                                            <span class="point_val">
                                                <span class="point_inp"><input type="text" class="input" id="amount" name="amount" value=""><em class="p">P</em></span>
                                            </span>
                                        </dd>
                                    </dl>
                                    <a href="javascript:;" class="btn c sm withdrawal">신청하기</a>
                                </div>
                                <p class="info_txt">리워드는 <span class="p">10,000P</span> 이상부터, <span class="p">1,000P</span> 단위로 지급 신청 가능합니다.
                                    <br>리워드 지급을 위해서는 <strong class="require">계좌 설정</strong>이 필요합니다.
                                </p>

                                <div class="add_info">
                                    <strong>리워드란?</strong>
                                    <p>회원님의 FAPEE 활동으로 인한 홍보 효과에 대하여<br> FAPEE와 제휴 쇼핑몰에서 드리는 소정의 포인트입니다.</p>
                                    <p>해당 포인트는 현금화하실 수 있으며<br> 이를 위한 계좌 입금 신청 절차를 수행하시면<br> FAPEE에서 회원님의 계좌로 리워드를 지급해드립니다.</p>
                                    <p>신청은 10,000P부터 1,000P 단위로 가능합니다. </p>
                                    <p>1P = 1원이며 포인트는 타인에게 양도하거나 대여할 수 없습니다.</p>
                                    <p>리워드는 매달 00일 합산되어<br> 당월 00일에 회원님의 계좌로 입금됩니다.</p>
                                </div>

                            </div>
                        </div>
                        <div class="panel hist" id="tabPanelA2">
                            <div class="tab_ct">
                                <div class="h_grp">
                                    <h2 class="tit">REWARD HISTORY</h2>
                                    <ul class="uiTab type b">
                                        <li class="active"><a href="javascript:;" data-period="1M">1개월</a></li>
                                        <li><a href="javascript:;" data-period="3M">3개월</a></li>
                                        <li><a href="javascript:;" data-period="6M">6개월</a></li>
                                        <li><a href="javascript:;" onclick="ui.popLayer.open('popRwRange')">이전내역</a></li>
                                    </ul>
                                </div>
                                <div class="pt_list">
                                    <div class="nodata">
                                    	<br>
                                        <div class="msg">기록이 존재하지 않습니다.</div>
                                    </div>
                                    <ul class="list" id="his_list">
										<li class="list-template" style="display: none;">
										    <span class="info01">
										        <span class="date">2019.09.25</span>
										        <span class="bank">KB국민은행</span>
										        <span class="txt">리워드 지급 신청</span>
										    </span>
										    <span class="info02">
										        <span class="point ">-12,000P</span>
										        <span class="txt">포인트 차감<br><span class="">12,000</span>원 입금 대기 중</span>
										        <span class="total_pt">합계 <strong class="">65,350P</strong></span>
										    </span>
										</li>
                                    </ul>
                                    <div class="uiLoadMore">
                                        <em></em>
                                        <button type="button" class="btnLoad" id="btnListMore">불러오기</button>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="panel sett" id="tabPanelA3">
                            <div class="tab_ct">
                                <div class="h_grp">
                                    <h2>리워드 계좌 관리</h2>
                                </div>

                                <!-- 개발자 전달 : 등록된 계좌 없을 시 -->
                                <div class="acc_has" id="testBankNone">
									<c:choose>
										<c:when test="${empty account}">
		                                    <div class="p_txt">
		                                        <p>회원님은 등록하신 계좌가 없습니다.</p>
		                                        <p>계좌를 등록하시고<br> FAPEE의 리워드를 받아보세요!</p>
		                                    </div>
										</c:when>
										<c:otherwise>
		                                    <ul class="ing_account">
		                                        <li>
		                                            <div class="info01">
		                                                <strong class="tit">현재 사용중인 계좌</strong>
		                                                <span class="acc_bank">${account.rewardBank}</span>
		                                                <span class="acc_name"></span>
		                                            </div>
		                                            <span class="acc_num font_blairMd">${account.rewardAccountNo}</span>
		                                        </li>
		                                    </ul>
										</c:otherwise>
									</c:choose>
                                    <div class="bk none">
                                    	<c:if test='${not empty account}'>
                                    		<div class="txt">계좌 변경 시</div>
                                    	</c:if>
                                        <div class="sel_wrap">
                                            <select class="select" id="rewardBank" name="rewardBank">
                                                <option selected data-value="selected" value="">은행선택</option>
												<c:forEach var="item" items="${bankCodeList}">
					                                <option value="${item.name}">${item.name}</option>
												</c:forEach>
                                            </select>
                                        </div>
                                        <span class="inp_wrap">
                                            <input type="text" class="input" id="rewardAccountNo" name="rewardAccountNo" placeholder="계좌번호 입력">
                                        </span>
                                    </div>
                                </div>
                                
                                <div class="botFixed">
                                    <div class="in">
                                        <div class="btnSet fit">
                                            <a href="javascript:;" class="btn xl b fill btnNext account">확인</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
            </section>
			
		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
        <!-- 기간 선택 -->
        <article class="popLayer b popRwRange" id="popRwRange">
            <div class="pbd">
                <div class="phd">
                    <div class="in">
                        <h1 class="tit">기간선택 <em class="s">(최근1년)</em></h1>
                        <button type="button" class="btnPopClose">닫기</button>
                    </div>
                </div>
                <div class="pct">
                    <main class="poptents">
                        <div class="dates">
                            <div class="sels">
                                <select class="select yy">
                                    <option value=''>년도 선택</option>
									<c:forEach var="item" items="${yearList}">
		                                <option value="${item}">${item}</option>
									</c:forEach>
                                </select>
                            </div>
                            <div class="sels">
                                <select class="select mm">
                                    <option value=''>월 선택</option>
									<c:forEach var="item" items="${monthList}">
		                                <option value="${item}">${item}</option>
									</c:forEach>
                                </select>
                            </div>
                        </div>
                    </main>
                </div>
                <div class="pbt">
                    <div class="bts">
                        <a href="javascript:;" class="btn lg" onclick="ui.popLayer.close('popRwRange')">취소</a>
                        <a href="javascript:;" class="btn a lg monthChoice">확인</a>
                    </div>
                </div>
            </div>
        </article>

	</div>

    <script>
        var historyReload = function(opt){  // 
            $("#his_list").find('li.rowitem').remove();
            $(".uiLoadMore").addClass("active");
            page = 0 ;          
			$(".uiLoadMore").trigger('click');
        }
        
    	var page = 0 ;
    	var morePage = true ;

    	$(window).on("scroll", function() {

    		var docH = $(document).height();
    		var scr = $(window).scrollTop() + $(window).height() + 30;
    		// console.log(docH,scr);
    		if (docH <= scr  && morePage) {
    			console.log("바닥sss");
    			$(".uiLoadMore").trigger('click');
    			morePage = false;
    		}
    	});

    	var yyyyMm = '1M';	//History 검색은 기본 한달임.
    	$(document).ready(function(){
    		//계좌 설정후 새로고침인 경우.
    		if('${form.tab}'=='HISTORY') ui.tab.set( "tabPanelA2");
    		if('${form.tab}'=='ACCOUNT') ui.tab.set( "tabPanelA3");
    		
    		//검색기간(1개월,3개월,등) 탭을 클릭시.
    		$('a[data-period]').click(function() {
				yyyyMm = $(this).data('period');
				historyReload();
    		});
    		
    		//History 이전 내역 년월 선택.
    		$('a.monthChoice').click(function() {
    			var yy = $('select.yy').val();
    			var mm = $('select.mm').val();
    			if(yy=='' || mm=='') {
					ui.alert({ msg: '<p>년도와 월을 모두 선택하세요.</P>' });
    				return;
    			}
    			else {
    				yyyyMm = $.validator.format('{0}-{1}', yy, mm);	//검색기간을 yyyy-MM 형식으로 넘김.
        			ui.popLayer.close('popRwRange');	
    				historyReload();
    			}
    		});
    		
    		//출금신청.
    		$('a.withdrawal').click( function(){
    			if('${account.rewardAccountNo}'=='') {
    	            ui.confirm({
    	                msg:"<h1>알림</h1>"+
    	                    "<p>리워드 지급 신청을 위해서는 <br> 계좌 설정이 필요합니다.<br> 확인 버튼을 누르면 <br>계좌 설정 화면으로 이동 합니다.</p>",
    	                ycb:function(){
    	                    ui.tab.set( "tabPanelA3");
    	                }
    	            });
					return;
    			}
    			
    			var msg = null;
    			var payablePoint = ${payablePoint};
    			var amount = $('#amount').val();
    			
    			if(payablePoint < 10000) msg = '10,000P 이상부터 1,000P 단위로 지급 신청 가능합니다.';
    			else if(amount=='' || isNaN(amount)) msg = '요청 포인트를 숫자로 입력하세요';
    			if(msg==null) {
    				amount = parseInt(amount, 10);
    				if(amount < 10000) msg = '10,000P 이상부터 1,000P 단위로 지급 신청 가능합니다.';
    				else if((amount % 1000) != 0) msg = '1,000P 단위로 지급 신청 가능합니다.';
    				else if(payablePoint < amount) msg = '신청 포인트는 지급 가능 포인트보다 작거나 같아야 합니다.';
    			}
    				
    			if(msg != null) {
					ui.alert({  // 알럿창 띄우기
						msg: msg
					});
					//$('#amount').focus();
					return;
    			}
    			
				var param = { };
					param.inOutFlag		= 'OUT';
					param.amount		= amount;
					param.bankName		= '${account.rewardBank}';
					param.accountNo		= '${account.rewardAccountNo}';
					param.remark		= '리워드 출금 신청';
				
				$.post('/app/setting/rest/myrewardWithdrawal.do', param, function(data) {
					if(data.code!=0) {
						ui.alert({ msg: '<p>' + data.message + '</P>' });
						if(data.code==401) location.href = '/app/user/login.do';
					}
					else {
						historyReload();
						ui.tab.set( "tabPanelA2");
					}
				}, 'json');
    		});
    		
    		//출금계좌 정보 저장.
    		$("a.account").click( function(){
    			if($('#rewardBank').val()=='') {
					ui.alert({  // 알럿창 띄우기
						msg:'<p>은행을 선택하세요.</p>' ,
						ycb:function(){
							$('#rewardBank').focus();
						}, ybt:'확인'
					});	
					return;
    			}
    			if($('#rewardAccountNo').val()=='') {
					ui.alert({  // 알럿창 띄우기
						msg:'<p>계좌번호를 입력하세요.</p>' ,
						ycb:function(){
							$('#rewardAccountNo').focus();
						}, ybt:'확인'
					});	
					return;
    			}
    			
				var param = { };
					param.rewardBank		= $('#rewardBank').val();
					param.rewardAccountNo	= $('#rewardAccountNo').val();
				
				$.post('/app/setting/rest/accountInfo.do', param, function(data) {
					if(data.code!=0) {
						ui.alert({ msg: '<p>' + data.message + '</P>' });
						if(data.code==401) location.href = '/app/user/login.do';
					}
					else {
						location.href = 'myreward.do?tab=ACCOUNT';
					}
				}, 'json');
    		});
    		
    		//History 목록 조회.
    		$(".uiLoadMore").click( function(){
    			$('div.nodata').hide();
    			$(".uiLoadMore").addClass("active");
    			page ++ ;
    			
    			var url = $.validator.format('/app/setting/rest/reward_history.do?yyyyMm={0}&page={1}', yyyyMm, page);
    			$.get(url )
    			.done(function( data ) {
    				var listTemplate = $('li.list-template:first');

    				//alert(JSON.stringify(data.form));
    				$.each(data.list, function(idx, item) {
    					var row = listTemplate.clone(true).removeClass('list-template');
    					row.addClass('rowitem');
    					row.show();

						var info01 = row.find('span.info01');
						var info02 = row.find('span.info02');
						
    					if(item.inOutFlag=='IN') {
    						info01.find('span.date').text(item.inquireDate);
    						info01.find('span.bank').text('FAPEE');
    						info01.find('span.txt').text(item.remark);
        					
    						var amount = item.amount;
    						info02.find('span.point').text(amount.toLocaleString());	//금액
    						var msg = $.validator.format('포인트 적립<br><span class="">{0}</span>P 적립완료', amount.toLocaleString());
    						info02.find('span.txt').html(msg);
    						info02.find('span.total_pt').html('');	//합계 <strong class="">65,350P</strong>
    					}
    					else {
    						info01.find('span.date').text(item.inquireDate);
    						info01.find('span.bank').text(item.bank);
    						info01.find('span.txt').text(item.remark);
        					
    						var amount = -(item.amount);
    						info02.find('span.point').text(amount.toLocaleString());	//금액
    						var msg = $.validator.format('포인트 차감<br><span class="">{0}</span>원 {1}', item.amount.toLocaleString(), item.processStatusName);
    						info02.find('span.txt').html(msg);
    						info02.find('span.total_pt').html('');	//합계 <strong class="">65,350P</strong>
    					}
    					
    					$("#his_list").append(row).addClass("load");;
    				})

    				console.log("페이징 = " + page);
    				morePage = data.form.morePage ;
    				if (!morePage) {
    					console.log("끝");
    					$(".uiLoadMore").addClass("hide");
    					morePage = false ;
    				}
    				ui.accd.set();
    				$(".uiLoadMore").removeClass("active");

    				//전체 건수가 0인 경우.
    				if(data.form.totalRows==0) {
    					$('div.nodata').show();
    					return;
    				}
    			});
    		});
    		
    		//화면 로딩시 자동으로 목록 조회.
    		$(".uiLoadMore").trigger('click');
    	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	
</div>
