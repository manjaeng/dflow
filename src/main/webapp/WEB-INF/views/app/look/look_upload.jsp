<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="wrap" id="wrap">

	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain lkreg upload">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

		<section class="sec photo">
			<div class="hdt">
				<em>UPLOAD YOUR <br> LOOK PHOTOS
				</em>
			</div>

			<div class="pics swiper-container" id="slideUploadPic">
				<ul class="list swiper-wrapper slide">
					<li class="swiper-slide"><div class="img"><a class="btnAdd" href="javascript:openPhotoMulti()">선택</a></div></li>
				</ul>
			</div>
		</section>

		<!-- <button type="button" onclick="testPicAdd()">추가</button> -->

		<section class="steps st1">
			<ul class="st">
				<li>1</li>
				<li>2</li>
			</ul>
		</section>

		<section class="botFixed">
			<div class="in">
				<div class="btnSet fit">
					<a href="./look_cate.do" class="btn type b fill xl">NEXT</a>
				</div>
			</div>
		</section>

		</main>
	</div>

	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="/WEB-INF/views/common/app-layers.jsp"%>
	</div>

	<script>
		var testPicAdd = function() {
			var picHtml = '<li class="swiper-slide"><div class="img"><img src="//placeimg.com/380/500/1" alt=""></div><div class="bts"><a href="javascript:;" class="del" onclick="testPicDel(this)">삭제</a></div></li>';
			$("#slideUploadPic .list").append(picHtml);
		}
		var testPicDel = function(els) {
			$(els).closest(".swiper-slide").find("img , .bts").remove();
		}

		var _images = [];
		var onPhotoSelected = function(success, status, photos) {
			if (success && photos) {
				for (var ii=0; ii<photos.length; ii++) {
					_images.push(photos[ii]);
					var picHtml = '<li class="swiper-slide">' + 
									'<div class="img">' +
										'<img src="data:image/jpeg;base64,' + photos[ii] + '">' +
									'</div>' +
									'<div class="bts">' +
										'<a href="javascript:;" class="del" onclick="deletePicture(this)">삭제</a>' +
									'</div>' +
								'</li>';
					$("#slideUploadPic .list").append( picHtml );
				}
			}
		}
		
		function openPhotoMulti() {
			showPhotoForPickupMulti(onPhotoSelected)
		}
		
		var deletePicture = function(els){
			$(els).closest(".swiper-slide").remove();
		}
		
		$(function() {
			$('.fit a').click(function() {
				
				fp.data.look = {
						images: _images
				};
				
				$.pjax({
					url : './look_cate.do',
					fragment : '#wrap',
					container : '#wrap'
				});
				
			});
		});
	</script>

	<!--// 컨텐츠 끝 -->
</div>