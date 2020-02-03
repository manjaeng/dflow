<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="wrap" id="wrap">

	<%@ include file="/WEB-INF/views/common/app-head.jsp" %>
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain look view">
		<main id="contents" class="contents">
			<section class="secLk look">
				<ul class="lookList" id="lookList">

<c:forEach var="look" items="${lookList}" varStatus="status">
					<li>
						<div class="uiLkSet">
							<div class="slideLookPic" id="slideLookPic">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide">
											<div class="uiPhoto">
												<div class="photo">
													<c:set var="mainLoopimageUrl" value="${s3Url}${look.image[0]}"/>
													<span class="pic" id="${s3Url}"><img src="${mainLoopimageUrl}" alt="사진"  href=onclick="location.href='../look/look_tag.do?lookId=${look.idKey}';"></span>
													<div class="uiTag" style="left: 50%; top: 45%;">
														<button class="bt" type="button">태그</button>
														<article class="pop" onclick="location.href='../look/look_goods.do?productKey=PRD1910090000000001';">
															<div class="pan">
																<div class="info">
																	<div class="name">호피무늬치마</div>
																	<div class="pric"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
																</div>
															</div>
														</article>
													</div>
													<div class="uiTag" style="left: 10%; top: 10%;">
														<button class="bt" type="button">태그</button>
														<article class="pop left top" onclick="location.href='../look/look_goods.do';">
															<div class="pan">fp_model_style_arms
																<div class="info">
																	<div class="name">호피무늬치마</div>
																	<div class="pric"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
																</div>
															</div>
														</article>
													</div>
													<div class="uiTag" style="left: 80%; top: 22%;">
														<button class="bt" type="button">태그</button>
														<article class="pop right top" onclick="location.href='../look/look_goods.do';">
															<div class="pan">
																<div class="info">
																	<div class="name">호피무늬치마</div>
																	<div class="pric"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
																</div>
															</div>
														</article>
													</div>
													<div class="uiTag" style="left: 15%; top: 80%;">
														<button class="bt" type="button">태그</button>
														<article class="pop left bot" onclick="location.href='../look/look_goods.do';">
															<div class="pan">
																<div class="info">
																	<div class="name">호피무늬치마</div>
																	<div class="pric"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
																</div>
															</div>
														</article>
													</div>
													<div class="uiTag" style="left: 92%; top: 90%;">
														<button class="bt" type="button">태그</button>
														<article class="pop right bot" onclick="location.href='../look/look_goods.do';">
															<div class="pan">
																<div class="info">
																	<div class="name">호피무늬치마</div>
																	<div class="pric"><em class="w">&#8361;</em><span class="p">999,999,999</span></div>
																</div>
															</div>
														</article>
													</div>
												</div>
												<div class="btsTag"><a href="javascript:;" class="bt tag">태그</a></div>
											</div>
										</li>

									</ul>
									<div class="pagination"></div>
								</div>
							</div>
							<div class="match">
								<div class="box mat"><a class="bt" href="javascript:;" data-match="75"><i class="bar"></i><em class="amt"></em> <span class="txt">MATCH?</span></a></div>
								<div class="box sty"><a class="bt" href="../common/searchTag.do"><span class="txt">STYLE</span></a></div>
							</div>
							<div class="info">
								<div class="user">
									<a href="../mypage/profile.jsp" class="pic">
										<span class="img"><img src="//placeimg.com/60/70" alt=""></span>

									</a>
									<a href="../my/profile.do" class="mem">
										<div class="nm">JENNY  <em class="ico seller">셀러</em> </div>
										<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
									</a>
									<div class="bts"><a href="javascript:;" class="bt more" onclick="ui.popLayer.open('popOthers');">더보기</a></div>
								</div>

								<!-- <div class="time">2일전</div> -->
							</div>
							<div class="data">
								<ul class="dl">
									<li class="cool"><a href="javascript:;" class="bt"><span>쿨</span></a></li>
									<li class="like"><a href="../common/cool.do" class="bt"><span>120</span></a></li>
									<li class="reply"><a href="../common/comments.do" class="bt"><span>77</span></a></li>
									<li class="scrap"><a href="javascript:;" class="bt">저장</a></li>
								</ul>
							</div>
							<div class="tags">
								<ul class="tg">
									<li><a href="../common/searchTag.do" class="hash"><em class="tt">#유니크스타일</em> </a></li>
									<li><a href="../common/searchTag.do" class="hash"><em class="tt">#톰보이스타일</em> </a></li>
									<li><a href="../common/searchTag.do" class="hash"><em class="tt">#호피무늬</em> </a></li>
								</ul>
							</div>
						</div>
					</li>
</c:forEach>
				</ul>
			</section>
		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>


	<script>
	$(document).ready(function(){
		// ui.nav.act("look");  // 하단 메뉴 활성화
	});
	</script>



	<!--// 컨텐츠 끝 -->
	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>

</div>

