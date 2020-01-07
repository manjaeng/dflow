<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="look" items="${lookList}" varStatus="status">
					<li>
						<div class="uiLkSet">
							<div class="slideLookPic" id="slideLookPic">
								<div class="swiper-container">
									<ul class="swiper-wrapper slide">
										<li class="swiper-slide">
											<div class="uiPhoto">
												<div class="photo">

													<span class="pic"><img src="${look.image[0]}" alt="사진" onclick="location.href='../look/look_view.do';"></span>
													<div class="uiTag" style="left: 50%; top: 45%;">
														<button class="bt" type="button">태그</button>
														<article class="pop" onclick="location.href='../look/look_goods.jsp';">
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
														<article class="pop left top" onclick="location.href='../look/look_goods.jsp';">
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
														<article class="pop right top" onclick="location.href='../look/look_goods.jsp';">
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
														<article class="pop left bot" onclick="location.href='../look/look_goods.jsp';">
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
														<article class="pop right bot" onclick="location.href='../look/look_goods.jsp';">
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
										<c:if test="${fn:length(look.image)  > 1}">
										<li class="swiper-slide">
											<div class="uiPhoto">
												<div class="photo">
													<span class="pic"><img src="${look.image[1]}" alt="사진" onclick="location.href='../look/look_view.do';"></span>
													<div class="uiTag" style="left: 30%; top: 30%;">
														<button class="bt" type="button">태그</button>
														<article class="pop left top">
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
										</c:if>
										<c:if test="${fn:length(look.image) > 2}">
										<li class="swiper-slide">
											<div class="uiPhoto">
												<div class="photo">
													<span class="pic"><img src="${look.image[2]}" alt="사진" onclick="location.href='../look/look_view.do';"></span>
													<div class="uiTag" style="left: 30%; top: 30%;">
														<button class="bt" type="button">태그</button>
														<article class="pop left top">
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
										</c:if>
									</ul>
									<div class="pagination"></div>
								</div>
							</div>
							<div class="match">
								<div class="box mat"><a class="bt" href="javascript:;" data-match="75"><i class="bar"></i><em class="amt"></em> <span class="txt">MATCH?</span></a></div>
								<div class="box sty"><a class="bt" href="../common/searchTag.jsp"><span class="txt">STYLE</span></a></div>
							</div>
							<div class="info">
								<div class="user">
									<a href="../mypage/profile.jsp" class="pic">
										<span class="img"><img src="//placeimg.com/60/70" alt=""></span>

									</a>
									<a href="../mypage/profile.jsp" class="mem">
										<div class="nm">JENNY  <em class="ico seller">셀러</em> </div>
										<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
									</a>
									<div class="bts"><a href="javascript:;" class="bt more" onclick="ui.popLayer.open('popOthers');">더보기</a></div>
								</div>
								<div class="desc">
									<a href="javascript:;" class="txt">"${look.content}"</a>
									<a href="javascript:;" class="more">더보기</a>
								</div>
								<!-- <div class="time">2일전</div> -->
							</div>
							<div class="data">
								<ul class="dl">
									<li class="cool"><a href="javascript:;" class="bt"><span>쿨</span></a></li>
									<li class="like"><a href="../common/cool.jsp" class="bt"><span>120</span></a></li>
									<li class="reply"><a href="../common/comments.jsp" class="bt"><span>77</span></a></li>
									<li class="scrap"><a href="javascript:;" class="bt">저장</a></li>
								</ul>
							</div>
							<div class="tags">
								<ul class="tg">
									<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#유니크스타일</em> </a></li>
									<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#톰보이스타일</em> </a></li>
									<li><a href="../common/searchTag.jsp" class="hash"><em class="tt">#호피무늬</em> </a></li>
								</ul>
							</div>
						</div>
					</li>
</c:forEach>