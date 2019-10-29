<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain mdl set">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Model Setting</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="guds">
				모델을 등록하면 <br> 모델사이즈로 LOOK을 지정할 수 있습니다.
			</div>

			<div class="sec mdls">
				<ul class="list">
					<li>
						<div class="box">
							<div class="pic"><a href="../mypage/model_edit.jsp" class="bt"><img src="https://placeimg.com/140/160/123" alt=""></a></div>
							<div class="name">Jenny</div>
							<div class="bts">
								<a href="javascript:;" class="bt del">Delete</a>
							</div>
						</div>
					</li>
					<li>
						<div class="box">
							<div class="pic"><a href="javascript:;" class="bt"><img src="../../images/common/profile_no.png" alt=""></a></div>
							<div class="name"></div>
							<div class="bts">
								<a href="javascript:;" class="bt reg">Register</a>
							</div>
						</div>
					</li>
					<li>
						<div class="box">
							<div class="pic"><a href="javascript:;" class="bt"><img src="../../images/common/profile_no.png" alt=""></a></div>
							<div class="name"></div>
							<div class="bts">
								<a href="javascript:;" class="bt reg">Register</a>
							</div>
						</div>
					</li>
				</ul>
			</div>

			<div class="msgs">
				모델 삭제 시 모든 LOOK 게시물이 <br>
				삭제되니 신중히 결정해주시기 바랍니다.
			</div>

			
			<!-- <section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./model_reg1.jsp" class="btn type b fill xl">Done</a>
					</div>
				</div>
			</section> -->

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