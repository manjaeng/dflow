<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain myinfo step1">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<!-- <a href="javascript:history.back();" class="bt hisback">뒤로</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			
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
					<div class="account">
						<a href="javascript:;">Do you HAVE AN ACCOUNT?</a>
					</div>
				</div>


			</section>

			<section class="steps st1">
				<ul class="st">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</section>

			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./myinfo_step2.jsp" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>

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