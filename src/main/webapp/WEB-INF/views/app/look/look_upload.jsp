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
					<li class="swiper-slide">
						<div class="img"><a class="btnAdd" href="javascript:openPhotoMulti()">선택</a></div>
					</li>
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


		<!-- 룩등록 팝업 -->
		<article class="popLayer a popLookReg" id="popLookReg">
			<div class="pbd">
				<button type="button" class="btnPopClose">닫기</button>
				<div class="pct">
					<main class="poptents">
						<ul class="list">
							<li>
								<span href="javascript:;" class="bt">SELLER</span>
								<ol class="mds">
									<li>
										<a href="javascript:;" class="box">
											<span class="pic"><div class="img"><img src="<c:out value="${profileInfo.imageUrl}"/>" alt=""></div></span>
											<span class="name"><c:out value="${profileInfo.nickName}"/> <em class="ico seller">셀러</em></span>
											<span class="info">160cm, KOREA</span>
										</a>
									</li>
								</ol>
							</li>
							<li>
								<span href="javascript:;" class="bt">MODEL</span>
								<ol class="mds">
									<c:forEach var="model" items="${userModelInfoList}" varStatus="status">
										<li>
											<a href="javascript:selectModel('<c:out value="${model.idKey}"/>')" class="box">
												<span class="pic"><div class="img"><img src="<c:out value="${model.imgUrl}"/>" alt=""></div></span>
												<span class="name"><c:out value="${model.modelName}"/></span>
												<span class="info"><c:out value="${model.height}"/>cm, KOREA</span>
											</a>
										</li>

									</c:forEach>
									<c:if test="${empty userModelInfoList}">
									<li>
										<a href="javascript:;" class="box">
											<span class="none">등록된 모델이 없습니다.</span>
										</a>
									</li>
									</c:if>
								</ol>
							</li>
						</ul>
						<div class="botBtns">
							<a href="../my/model_set.do" class="bt mdlset">MODEL SETTING</a>
						</div>
					</main>
				</div>
			</div>
		</article>

	</div>

	<script>


        function popLookReg(){
            ui.confirm({ // 컨펌 창 띄우기
                msg:'<h1>로그인이 필요한 서비스입니다.</h1>'+
                '<p>로그인화면으로 <br>이동하시겠습니까?</p>',
                ycb:function(){
                    popLookReg_open();
                }
            });
        };

        function popLookReg_open(){
            ui.popLayer.open('popLookReg',{
                ocb:function(){
                    console.log("프로필 기타팝업 열림");
                },
                ccb:function(){
                    console.log("프로필 기타팝업 닫힘");
                }
            });
        }
		var modelid;
        function selectModel(id){
            modelid = id;

            $("#popLookReg > div > button").trigger("click");
		}

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
				    alert(photos[ii]);
					_images.push(photos[ii]);
					var picHtml = '<li class="swiper-slide">' + 
									'<div class="img">' +
										'<img src="' + photos[ii] + '">' +
									'</div>' +
									'<div class="bts">' +
										'<a href="javascript:;" class="del" onclick="deletePicture(this)">삭제</a>' +
									'</div>' +
								'</li>';
					alert(picHtml);
					$("#slideUploadPic .list").append( picHtml );
				}
			}
		}
		
		function openPhotoMulti() {
			//showPhotoForPickupMulti(onPhotoSelected)
			showPhotoForPickupMulti(onPhotoSelected, "0", "10")
		}
		
		var deletePicture = function(els){
			$(els).closest(".swiper-slide").remove();
		}
		
		$(function() {
			$('.fit a').click(function() {
				
				fp.data.look = {
						images: _images,
                        modelKey : modelid

				};
				
				$.pjax({
					url : './look_cate.do',
					fragment : '#wrap',
					container : '#wrap'
				});
				
			});
		});

        $(document).ready(function(){

            popLookReg_open();

        });
	</script>

	<!--// 컨텐츠 끝 -->
</div>