<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<article class="popPage popMysize" id="popMysize">
		<div class="pbd">
			<!-- <a href="javascript:;" class="btnHisback" onclick="history.back();">뒤로</a> -->
			<a href="javascript:;" class="btnPopClose" onclick="history.back();">뒤로</a>
			<div class="pct">
				<main class="poptents">

					<section class="sec myinfo">
						<div class="hdt"><em>FIND YOUR FIT</em></div>
						<div class="form">
							<div class="msg">
								패피의 사이즈 매칭으로 <br>
								당신에게 맞는 핏을 찾아드립니다.
							</div>
							<ul class="list">
								<li>
									<div class="dt">성별</div>
									<div class="dd">
										<label class="radio"><input type="radio" name="gender" checked><span>여자</span></label>
										<label class="radio"><input type="radio" name="gender"><span>남자</span></label>
									</div>
								</li>
								<li>
									<div class="dt">국가</div>
									<div class="dd">
										<select class="select">
											<option>KOREA</option>
											<option>KOREA</option>
										</select>
									</div>
								</li>
							</ul>
						</div>


					</section>

					<section class="steps st1">
						<ul class="st">
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
					</section>

				</main>
			</div>
			<div class="pbt">
				<div class="in">
					<div class="bts">
						<a href="./myinfo_step2.jsp" class="btn type xl a btnStart">START</a>
					</div>
				</div>
			</div>
		</div>
	</article>


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