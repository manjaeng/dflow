<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain review my upload">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="upload photo">
				<div class="hdt"><em>UPLOAD YOUR <br> REVIEW PHOTOS </em> </div>
					
				<div class="pics swiper-container" id="slideUploadPic">
					<ul class="list swiper-wrapper slide">
						<li class="swiper-slide"><div class="img"><a class="btnAdd" href="javascript:openPhotoMulti()">선택</a></div></li>
					</ul>
				</div>
			</section>

			<!-- <button type="button" onclick="testPicAdd()">추가</button> -->

			<!-- <section class="steps st1">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section> -->

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<button type="button" class="btn type b fill xl next">NEXT</button>
					</div>
				</div>
			</section>

		</main>
	</div>
	<form id="frmBase" name="frmBase" method="post" action="/app/setting/my_review_write.do">
		<input type="hidden" id="clickKey" name="clickKey" value="${form.clickKey}" />
		<textarea id="imageSrcList" name="imageSrcList" style="display: none;"></textarea>
	</form>

	<script>
	var _images = [];
	var onPhotoSelected = function(success, status, photos) {
		if (success && photos) {
			for (var ii=0; ii<photos.length; ii++) {
				var currCnt = $('li.swiper-slide').length;
				if( currCnt > 10 ) break;
				
				_images.push(photos[ii]);
				var picture = $('<li class="swiper-slide">' + 
								'<div class="img">' +
									'<img class="photo" src="data:image/jpeg;base64,' + photos[ii] + '">' +
									'<div class="num">0/10</div>' +
								'</div>' +
								'<div class="bts">' +
									'<a href="javascript:;" class="del" onclick="deletePicture(this)">삭제</a>' +
								'</div>' +
							'</li>');
				$("#slideUploadPic .list").append( picture );
			}
			
			//추가후 이미지 순서 조정.
			setImageSeq();
		}
	}
	
	function openPhotoMulti() {
		//showPhotoForPickupMulti(onPhotoSelected)
		showPhotoForPickup(onPhotoSelected, "0", "5")
	}
	
	function deletePicture(els){
		$(els).closest(".swiper-slide").remove();
		//삭제후 이미지 순서 조정.
		setImageSeq();
	}
	
	function setImageSeq() {
		$.each( $('li.swiper-slide').find('div.num'), function(idx, item) {
			$(item).text( (idx+1) + '/10' );
		})
	}

	$(document).ready(function(){
		$('button.next').click(function() {
			var images = [];
			$.each( $('img.photo'), function(idx, item) {
				images.push({ imageSrc: $(item).attr('src') });
			});
			if(images.length==0) {
				ui.alert({  // 알럿창 띄우기
					msg:'<p>이미지를 하나 이상 선택하세요.</P>' ,
					ybt:'확인'
				});	
			}
			else {
				$('#imageSrcList').val( JSON.stringify(images) );
				
				$('#frmBase').submit();
			}
			
		})
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>
