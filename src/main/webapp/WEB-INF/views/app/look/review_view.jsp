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
								<span class="img"><img src="${data.userImageUrl}" alt=""></span>
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
		$('a.buy').click(function() {
			var param = { reviewIdKey: '${data.reviewIdKey}', mapIdKey: '${data.mapIdKey}', productIdKey: '${data.productIdKey}' };
			
			$.post('/app/setting/rest/my_click_insert.do', param, function(data) {
				if(data.code==0) {
					// 클립보드로 복사하는 기능을 생성
					var obj = document.createElement("input"); // 글을 쓸 수 있는 란을 만든다.
					obj.setAttribute("value", 'RD-${data.reviewIdKey}'); // 지정된 요소의 값을 할당 한다.
					document.body.appendChild(obj); // bdy에 추가한다.
					obj.select(); // 지정된 내용을 강조한다.
					document.execCommand("copy"); // 텍스트를 카피 하는 변수를 생성
					document.body.removeChild(obj); // body 로 부터 다시 반환 한다.
					console.log(obj.value);

					ui.toast({msg:'<p>Link copied to clipboard</p>'});
				}
				else {
					ui.alert({ msg: '<p>' + data.message + '</P>' });
					if(data.code==401) location.href = '/app/user/login.do';
				}
			}, 'json');
		})
		
		$('a.edit').click(function() {
			location.href = '/app/setting/my_review_write.do?reviewIdKey=${data.reviewIdKey}';
		})
	});
	
	</script>
	
	<article class="popLayer c popRevMore" id="popRevMore">
		<div class="pbd">
			<button type="button" class="btnPopClose">닫기</button>
			<div class="pct">
				<main class="poptents">
					<ul class="list">
						<c:choose>
						<c:when test = "${data.owner==true}">
							<li><a href="javascript:;" class="bt edit">EDIT</a></li>
						</c:when>
						<c:otherwise>
							<li class="st"><a href="javascript:;" class="bt" onclick="popAccus(); ui.popLayer.close('popRevMore');">REPORT</a></li>
						</c:otherwise>
						</c:choose>
						<!-- <li class="st"><a href="javascript:;" class="bt">DELETE</a></li> -->
						<li><a href="javascript:;" class="bt" onclick="testUrlCopy(); ui.popLayer.close('popRevMore');">COPY LINK</a></li>
						<li><a href="javascript:;" class="bt" onclick="popShare(); ui.popLayer.close('popRevMore');">SHARE</a></li>
					</ul>
				</main>
			</div>
		</div>
	</article>


	<script>
	function testUrlCopy() {
		// 클립보드로 복사하는 기능을 생성
		var aux = document.createElement("input"); // 글을 쓸 수 있는 란을 만든다.
		aux.setAttribute("value", window.location.href); // 지정된 요소의 값을 할당 한다.
		document.body.appendChild(aux); // bdy에 추가한다.
		aux.select(); // 지정된 내용을 강조한다.
		document.execCommand("copy"); // 텍스트를 카피 하는 변수를 생성
		document.body.removeChild(aux); // body 로 부터 다시 반환 한다.
		console.log(aux.value);
	
		ui.toast({msg:'<p>Link copied to clipboard</p>'});
	}
	</script>
	
	<!-- 신고 하기  -->
	<article class="popLayer c popAccus" id="popAccus">
		<div class="pbd">
			<button type="button" class="btnPopClose">닫기</button>
			<div class="pct">
				<main class="poptents">
					<ul class="list">
						<li class="st"><a href="javascript:;" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s Spam</a></li>
						<li class="st"><a href="javascript:;" onclick="ui.toast({msg:'<p>Thanks for letting us know.</p>'}); ui.popLayer.close('popAccus');" class="bt">It’s appropriate</a></li>
					</ul>
				</main>
			</div>
		</div>
	</article>
	<script>
	function popAccus(){
		ui.popLayer.open('popAccus',{
			zIndex : 1500,
			ocb:function(){
				console.log("신고하기팝업 열림");
				// ui.popLayer.close('popPrfOthers');
			},
			ccb:function(){
				console.log("신고하기팝업 닫힘");
			}
		});
	};
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	<!-- 공유하기 팝업 -->
	<article class="popLayer c popShare" id="popShare">
		<div class="pbd">
			<button type="button" class="btnPopClose">닫기</button>
			<div class="pct">
				<main class="poptents">
					<ul class="list">
						<li class="twitter"><a href="javascript:;" class="bt">TWITTER</a></li>
						<li class="katalk"><a href="javascript:;" class="bt">KAKAOTALK</a></li>
						<li class="facebook"><a href="javascript:;" class="bt">FACEBOOK</a></li>
						<li class="kastory"><a href="javascript:;" class="bt">KAKAOSTORY</a></li>
					</ul>	
				</main>
			</div>
		</div>
	</article>
	<script>
	function popShare(){
	
		// ui.popLayer.open('popShare',{
		// 	ocb:function(){
		// 		// ui.popLayer.close('popPrfOthers');
		// 		console.log("공유하기 열림");
		// 	},
		// 	ccb:function(){
		// 		console.log("공유하기 닫힘");
		// 	}
		// });
	};
	</script>

</div>
