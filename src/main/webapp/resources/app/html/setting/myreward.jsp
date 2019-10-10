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
                <h1 class="sec_h1 font_blairMd">MY REWARD POINT
                    <span class="sub_pt font_blairMd">TOTAL <span>65,350</span>P</span>
                </h1>
                
                <article>
                    <ul class="uiTab type a">
                        <li class="active"><a href="#tabPanelA1">MY REWARD</a></li>
                        <li class=""><a href="#tabPanelA2">HISTORY</a></li>
                        <li class=""><a href="#tabPanelA3">SETTING</a></li>
                    </ul>
                    <div class="uiTabPan">
                        <div class="panel active" id="tabPanelA1">
                            <div class="tab_ct">
                                <div class="pt_wrap">
                                    <h2 class="font_blairMd">REWARD EXCHANGE</h2>
                                    <dl>
                                        <dt>지급 가능 포인트</dt>
                                        <dd><span class="font_blairMd point_val">65,000P</span></dd>
                                    </dl>
                                    <dl>
                                        <dt>지급 신청 포인트</dt>
                                        <dd ><span class="font_blairMd"><span class="point_inp"><input type="text" class="input" placeholder="12,000"></span>P</span></dd>
                                    </dl>
                                    <a href="javascript:;" class="btn sm">신청하기</a>
                                </div>
                                <p class="info_txt">리워드는 <span class="font_blairMd">10,000P</span> 이상부터, <span class="font_blairMd">1,000P</span> 단위로 지급 신청 가능합니다.
                                    <br/><strong class="require">리워드 지급을 위해서는 계좌 설정이 필요합니다.</strong>
                                </p>

                                <div class="add_info">
                                    <strong>리워드란?</strong>
                                    <p>회원님의 <span class="font_blairMd">FAPEE</span> 활동으로 인한 홍보 효과에 대하여 <span class="font_blairMd">FAPEE</span>와 제휴 쇼핑몰에서 드리는 소정의 포인트입니다.<br/><br/>
                                    해당 포인트는 현금화하실 수 있으며 이를 위한 계좌 입금 신청 절차를 수행하시면 FAPEE에서 회원님의 계좌로 리워드를 지급해드립니다.<br/><br/>
                                    신청은 <span class="font_blairMd">10,000P</span>부터 <span class="font_blairMd">1,000P</span> 단위로 가능합니다. <br/><span class="font_blairMd">1P</span> = 1원이며 포인트는 타인에게 양도하거나 대여할 수 없습니다.<br/><br/>
                                    리워드는 매달 <span class="font_blairMd">00</span>일 합산되어 당월 <span class="font_blairMd">00</span>일에 회원님의 계좌로 입금됩니다.</p>
                                </div>

                            </div>
                        </div>
                        <div class="panel" id="tabPanelA2">
                            <div class="tab_ct">
                                <div class="h_grp">
                                    <h2 class="font_blairMd">REWARD HISTORY</h2>
                                    <ul class="uiTab type b">
                                        <li class="active"><a href="javascript:;">1개월</a></li>
                                        <li><a href="javascript:;">3개월</a></li>
                                        <li><a href="javascript:;">6개월</a></li>
                                        <li><a href="javascript:;">이전내역</a></li>
                                    </ul>
                                </div>
                                <div class="pt_list">
                                    <ul>
                                        <li>
                                            <span class="info01">
                                                <span class="date">2019.09.25</span>
                                                <span class="bank">KB국민은행</span>
                                                <span class="txt">리워드 지급 신청</span>
                                            </span>
                                            <span class="info02">
                                                <span class="point font_blairMd">-12,000P</span>
                                                <span class="txt">포인트 차감<br/><span class="font_blairMd">12,000</span>원 입금 대기 중</span>
                                                <span class="total_pt">합계 <strong class="font_blairMd">65,350P</strong></span>
                                            </span>
                                        </li>
                                        <li>
                                            <span class="info01">
                                                <span class="date">2019.09.25</span>
                                                <span class="bank">KB국민은행</span>
                                                <span class="txt">리워드 지급 신청</span>
                                            </span>
                                            <span class="info02">
                                                <span class="point font_blairMd">-12,000P</span>
                                                <span class="txt">포인트 차감<br/><span class="font_blairMd">12,000</span>원 입금 대기 중</span>
                                                <span class="total_pt">합계 <strong class="font_blairMd">65,350P</strong></span>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                

                            </div>
                        </div>
                        <div class="panel" id="tabPanelA3">
                            <div class="tab_ct">
                                <div class="h_grp">
                                    <h2>리워드 계좌 관리</h2>
                                </div>
                                <!-- 개발자 전달 : 등록된 계좌 없을 시 -->
                                <div class="acc_has">
                                    <p class="p_txt">회원님은 등록하신 계좌가 없습니다.<br/><br/>계좌를 등록하시고<br/><span class="font_blairMd">FAPEE</span>의 리워드를 받아보세요!</p>
                                    <div class="form_wrap">
                                        <select class="select">
                                            <option>은행선택</option>
                                            <option>선택2</option>
                                            <option>선택3</option>
                                            <option>선택4</option>
                                            <option>선택5</option>
                                            <option>선택6</option>
                                        </select>
                                        <span class="inp_wrap">
                                            <input type="text" class="input" placeholder="계좌번호 입력">
                                        </span>
                                    </div>
                                    <div class="botFixed">
                                        <div class="in">
                                            <div class="btnSet fit">
                                                <a href="" class="btn xl b fill btnNext">확인</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 개발자 전달 : 등록된 계좌 있을 시 -->
                                <div class="acc_less">
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
                                    <div class="form_wrap">
                                        <label for="">계좌 변경시</label>
                                        <select class="select">
                                            <option>은행선택</option>
                                            <option>선택2</option>
                                            <option>선택3</option>
                                            <option>선택4</option>
                                            <option>선택5</option>
                                            <option>선택6</option>
                                        </select>
                                        <span class="inp_wrap">
                                            <input type="text" class="input" placeholder="계좌번호 입력">
                                        </span>
                                    </div>
                                    <div class="botFixed">
                                        <div class="in">
                                            <div class="btnSet fit">
                                                <a href="" class="btn xl b fill btnNext">변경</a>
                                            </div>
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
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>

	$(document).ready(function(){

	});

	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>