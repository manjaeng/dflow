<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain look review">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="hisback">뒤로</a>
				</div>
				<h1 class="tit">${data.productName}</h1>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="sec rev">
				<div class="uiLkItem">
					<div class="tops">
						<div class="info">
							<div class="code">${data.productIdKey}</div>
							<div class="prc"><em class="w">&#8361;</em><span class="p"><fmt:formatNumber type="number" value="${data.price}" /></span></div>
						</div>
						<div class="bts">
							<a href="javascript:;" class="bt buy"><em class="t">BUY NOW</em><span class="s">reword code</span></a>
						</div>
					</div>
					<div class="slideLookPic" id="slideLookPic">
						<div class="swiper-container">
							<ul class="swiper-wrapper slide">
							<c:forEach var="item" items="${data.imageList}" varStatus="status">
								<li class="swiper-slide">
									<div class="uiPhoto">
										<div class="photo">
											<span class="pic swiper-zoom-container"><img src="${item.imageSrc}" alt="사진"></span>
										</div>
									</div>
								</li>
							</c:forEach>
							</ul>
							<div class="pagination"></div>
						</div>						
					</div>

					<div class="info">
						<div class="user">
							<a href="/app/my/profile.do?id=${data.userIdKey}" class="pic">
								<span class="img"><img src="//placeimg.com/60/70" alt=""></span>
							</a>
							<a href="/app/my/profile.do?id=${data.userIdKey}" class="mem">
								<div class="nm">${data.userId}  <em class="ico seller">셀러</em> </div>
								<div class="dt"><em class="k">170cm</em><em class="n">Korea</em></div>
							</a>
							<div class="bts"><a href="javascript:;" class="bt more" onclick="ui.popLayer.open('popRevMore');">더보기</a></div>
						</div>
						<div class="desc">
							<a href="javascript:;" class="txt">${data.reviewMsgHtml}</a>
							<a href="javascript:;" class="more">더보기</a>
						</div>
					</div>
				</div>
			</section>
		</main>
	</div>

	<script>
	$(document).ready(function(){

	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

</div>
