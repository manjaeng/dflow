<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain popJoin mo">
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
					<div class="nation">
						<select class="select" id="nation_code"></select>
					</div>	
					<div class="uiIptPlc phone">
						<input type="tel" class="input" id="my_phone_number">
						<span class="plc">Mobile Phone</span>
						<a href="javascript:;" class="btn c sm btnSend">SEND</a>
					</div>
					<div class="msgcode">해당 번호로 코드를 전송하였습니다.</div>
					<div class="msg_error show" id="msg_sample1">이미 가입된 전화번호입니다.</div>
					<div class="findpws">
						<a href="../member/findPw.jsp" class="link">FORGOT ID/PASSWORD?</a>
					</div>
					<div class="uiIptPlc certi">
						<input type="tel" class="input">
						<span class="plc">Verification number </span>
						<span class="time">2:59</span>
					</div>
					<div class="msg_error show" id="msg_sample2">코드를 입력해주세요.</div>
					<div class="msg_error show" id="msg_sample3">인증 코드를 다시 확인해주세요.</div>
					
					<div class="agree">
						<div class="txt">
							본인이 만 14세 이상인 것과 <br> <a href="javascript:;">서비스이용약관</a>, <a href="javascript:;">개인정보보호정책</a>에 동의하십니까? </div>
						<label class="checkbox"><input type="checkbox"><span></span></label>
					</div>
					<div class="msg_error show" id="msg_sample1">약관에 동의해 주세요.</div>

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../member/joinId.jsp" class="btn xl b fill btnNext">NEXT</a>
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
	var nationNumFnc = function(){
		$.ajax({
			type: "post",
			url: "../common/nation.html",
			dataType: "html",
			success: function(html) {
				$("#nation_code").append(html);
			}
		});	
		$(document).on("change","#nation_code",function(e){
			var ncode = $("#nation_code").val() + " ";
			$("#my_phone_number").val( ncode ).focus();
		});
	};

	nationNumFnc();	
	</script>

	<!--// 컨텐츠 끝 -->

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>