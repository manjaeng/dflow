<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
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
                    <span class="sub_pt ">TOTAL <span>65,350</span>P</span>
                </h1>
                
                <article>
                    <ul class="uiTab type a">
                        <li class="active"><a href="#tabPanelA1">MY REWARD</a></li>
                        <li class=""><a href="#tabPanelA2" onclick="rewTabFnc();">HISTORY</a></li>
                        <li class=""><a href="#tabPanelA3">SETTING</a></li>
                    </ul>
                    <div class="uiTabPan">
                        <div class="panel myrw active" id="tabPanelA1">
                            <div class="tab_ct">
                                <div class="pt_wrap">
                                    <h2 class="tit">REWARD EXCHANGE</h2>
                                    <dl class="dl1">
                                        <dt>지급 가능 포인트</dt>
                                        <dd><span class="point_val">65,000P</span></dd>
                                    </dl>
                                    <dl class="dl2">
                                        <dt>지급 신청 포인트</dt>
                                        <dd >
                                            <span class="point_val">
                                                <span class="point_inp"><input type="text" class="input" value="65,000"><em class="p">P</em></span>
                                            </span>
                                        </dd>
                                    </dl>
                                    <a href="javascript:;" class="btn c sm" onclick="testRegRwd();">신청하기</a>
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
                                        <li class="active"><a href="javascript:;">1개월</a></li>
                                        <li><a href="javascript:;">3개월</a></li>
                                        <li><a href="javascript:;">6개월</a></li>
                                        <li><a href="javascript:;" onclick="ui.popLayer.open('popRwRange')">이전내역</a></li>
                                    </ul>
                                </div>
                                <div class="pt_list">
                                    <ul class="list" id="his_list"></ul>
                                    <div class="uiLoadMore">
                                        <em></em>
                                        <button type="button" class="btnLoad" onclick="addItemFnc()" id="btnListMore">불러오기</button>
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
                                    <div class="p_txt">
                                        <p>회원님은 등록하신 계좌가 없습니다.</p>
                                        <p>계좌를 등록하시고<br> FAPEE의 리워드를 받아보세요!</p>
                                    </div>
                               
                                    
                                    <div class="bk none">
                                        <div class="sel_wrap">
                                            <select class="select">
                                                <option selected data-value="selected">은행선택</option>
                                                <option>KB국민은행</option>
                                                <option>우리은행</option>
                                            </select>
                                        </div>
                                        <span class="inp_wrap">
                                            <input type="text" class="input" placeholder="계좌번호 입력">
                                        </span>
                                    </div>
                                </div>
                                
                                <!-- 개발자 전달 : 등록된 계좌 있을 시 -->
                                <div class="acc_has" id="testBankSet" style="display: none;">

                                    <ul class="ing_account">
                                        <li>
                                            <div class="info01">
                                                <strong class="tit">현재 사용중인 계좌</strong>
                                                <span class="acc_bank">KB국민은행</span>
                                                <span class="acc_name">정**</span>
                                            </div>
                                            <span class="acc_num font_blairMd">855-22-0689-223</span>
                                        </li>
                                    </ul>
                                    
                                    <div class="bk set">
                                        <div class="txt">계좌 변경 시</div>
                                        <div class="sel_wrap">
                                            <select class="select">
                                                <option >은행선택</option>
                                                <option selected>KB국민은행</option>
                                                <option>우리은행</option>
                                            </select>
                                        </div>
                                        <span class="inp_wrap">
                                            <input type="text" class="input" placeholder="계좌번호 입력" value="43180201221325">
                                        </span>
                                    </div>
                                </div>
                                
                                <div class="botFixed">
                                    <div class="in">
                                        <div class="btnSet fit">
                                            <a href="javascript:;" class="btn xl b fill btnNext" onclick="$('#testBankNone').hide(); $('#testBankSet').show(); ">확인</a>
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
                                    <option>년도 선택</option>
                                    <option>2019</option>
                                    <option>2018</option>
                                </select>
                            </div>
                            <div class="sels">
                                <select class="select mm">
                                    <option>월 선택</option>
                                    <option>12</option>
                                    <option>11</option>
                                </select>
                            </div>
                        </div>
                    </main>
                </div>
                <div class="pbt">
                    <div class="bts">
                        <a href="javascript:;" class="btn lg" onclick="ui.popLayer.close('popRwRange')">취소</a>
                        <a href="javascript:;" class="btn a lg" onclick="ui.popLayer.close('popRwRange')">확인</a>
                    </div>
                </div>
            </div>
        </article>

		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

    <script>
        var testRegRwd = function(){
            ui.confirm({
                msg:"<h1>알림</h1>"+
                    "<p>리워드 지급 신청을 위해서는 <br> 계좌 설정이 필요합니다.<br> 확인 버튼을 누르면 <br>계좌 설정 화면으로 이동 합니다.</p>",
                ycb:function(){
                    ui.tab.set( "tabPanelA3");
                }
            });
        }


        var rewTabFnc = function(opt){  // 
            $("#his_list").empty();
            $(".uiLoadMore").addClass("active");
            page = 0 ;          
            addItemFnc();
        }
        
		var page = 0 ;
		appendStat = true ;
		addItemFnc = function(){
			appendStat = false ;
			$(".uiLoadMore").addClass("active");
			$.ajax({
				type: "post",
				url: "./myreward_more.jsp",
				dataType: "html",
				success: function(html) {
					window.setTimeout(function(){
						page ++ ;
						$("#his_list").append(html).addClass("load");
						console.log("페이징 = " + page);
						appendStat = true ;
						if (page >= 3) {
							console.log("끝");
							$(".uiLoadMore").addClass("hide");
							appendStat = false ;
						}
						ui.slides.lookPic.using();
						ui.look.elip.using();
						$(".uiLoadMore").removeClass("active");
						
					},500);
				}
			});

            $(window).on("scroll", function() { // 바닥 확인
                var docH = $(document).height();
                var scr = $(window).scrollTop() + $(window).height() +  30;
                // console.log(docH,scr);
                if (docH <= scr  && appendStat == true) {
                    console.log("바닥sss");
                    addItemFnc();
                    appendStat = false;
                }
            });

		};




	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>