<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	
	<article class="popPage popLogin" id="popLogin">
		<div class="pbd">
			<button type="button" class="btnPopClose" onclick="history.back();">뒤로</button>
			<div class="pct">
				<main class="poptents">
					<div class="loginForm">
						<div class="hdt"><em>LOGIN</em></div>
						<div class="form">
							<div class="uiIptPlc id">
								<input type="text" class="input valid"  id="input_sample1" value="">
								<span class="plc">아이디</span>
							</div>
							<div class="uiIptPlc pw">
								<input type="password" class="input valid" id="input_sample2">
								<span class="plc">비밀번호</span>
							</div>
							<div class="msg_error" id="msg_sample1">비밀번호가 일치하지 않습니다.</div>
							<div class="btns">
								<a href="javascript:;" class="btn xl type a btnLogin" id="btnLogin">LOGIN</a>
							</div>
						</div>
						<div class="info">
							<div class="save">
								<label class="checkbox"><input type="checkbox" checked="checked"><span>자동 로그인</span></label>
							</div>
							<div class="txt">
								<a href="javascript:;" class="link">비밀번호를 잊으셨나요?</a>
							</div>
						</div>
					</div>
					
				</main>
			</div>
		</div>
	</article>
	
	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>
	
	
	<script>
		$("#btnLogin").on("click",function(){
			$("#input_sample1").addClass("ok");
			$("#input_sample2").addClass("no");
			$("#msg_sample1").addClass("show");
		});
	</script>

	<!--// 컨텐츠 끝 -->

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>