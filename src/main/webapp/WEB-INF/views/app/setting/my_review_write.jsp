<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain review my cate">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<div class="forms">
				<ul class="list">
					<li class="items">
						<div class="ht">ITEM</div>
						<div class="ct">
							<div class="item">
								<span class="img"><a class="pic" href="javascript:;"><img src="https://placeimg.com/360/360/any/2" alt=""></a></span>
								<div class="info">
									<div class="tit">${data.productName} </div>
									<div class="desc">
										<span class="prc"><em class="w">&#8361;</em><span class="p"><fmt:formatNumber type="number" value="${data.price}" /></span></span>
										<span class="name">${data.lookUserId} </span>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li class="text">
						<div class="ht">DETAIL</div>
						<div class="ct">
							<div class="num on">MAX 250</div>
							<textarea class="textarea" id="reviewMsg" name="reviewMsg" ></textarea>
						</div>
					</li>
					
				</ul>
			</div>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn type b fill xl save">DONE</a>
					</div>
				</div>
			</section>

		</main>
	</div>
	<textarea id="imageSrcList" name="imageSrcList" style="display: none;">${form.imageSrcList}</textarea>

	<script>
	$(document).ready(function(){
		$('a.save').click(function() {
			var param = { clickKey: '${form.clickKey}', reviewMsg: $('#reviewMsg').val(), imageSrcList: $('#imageSrcList').val() };
			
			$.post('/app/setting/rest/my_review_save.do', param, function(data) {
				if(data.code==0) {
					ui.alert({  // 알럿창 띄우기
						msg:'<p>저장되었습니다.</P>' ,
						ycb:function(){
							location.href = '/app/setting/my_review.do';
						},
						ybt:'확인'
					});	
				}
				else {
					ui.alert({ msg: '<p>' + data.message + '</P>' });
				}
			}, 'json');
		})
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>
