<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain pwmod">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">비밀번호 변경</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="findForm">
				
				<div class="form">
					<div class="uiIptPlc pw now">
						<input type="password" class="input">
						<span class="plc">현재비밀번호 입력</span>
					</div>
					<div class="uiIptPlc pw new">
						<input type="password" class="input">
						<span class="plc">변경비밀번호 입력</span>
					</div>
					<div class="uiIptPlc pw com">
						<input type="password" class="input">
						<span class="plc">비밀번호 확인</span>
					</div>
					<div class="msg_error" id="msg_sample1">비밀번호가 일치하지 않습니다.</div>
					<div class="msgs">* 영문숫자조합 6자 이상 조합으로 가능합니다. </div>
				</div>
			</div>
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn type b fill xl">DONE</a>
					</div>
				</div>
			</section>

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