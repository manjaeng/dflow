<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain popJoin email">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="joinForm">
				<div class="hdt"><em>SIGN UP</em></div>
				<div class="form">
					<!-- <div class="memcate">
						<label class="radio"><input type="radio" name="memcate1" checked="checked"><span>일반회원</span></label>
						<label class="radio"><input type="radio" name="memcate1"><span>전문가</span></label>
					</div> -->
					<div class="uiIptPlc email">
						<input type="text" class="input valid"  id="input_sample1" value="">
						<span class="plc">E-MAIL</span>
					</div>
					<div class="msg_error show" id="msg_sample1">이메일을 입력해 주세요.</div>
					<div class="msg_error show" id="msg_sample2">이메일 형식을 다시 확인해 주세요.</div>
					<!-- <div class="msgs">이메일은 비밀번호 찾기 및 로그인시 필요합니다.</div> -->

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn xl b fill btnDone" onclick="testjoinGoGo();">Done</a>
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
	function testjoinGoGo(){
		ui.loading.show();
		setTimeout(function(){
			ui.loading.hide();
			popSize();
			// location.href="../home/home.jsp";
		},2000);

		$(".popSize>.pbd>.pbt .bts .btnSave").attr("href","../home/home.jsp");
	}
	</script>

	<!--// 컨텐츠 끝 -->

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>