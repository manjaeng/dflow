<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
							<div class="msg_error" id="msg_sample1">입력정보가 올바르지 않습니다.</div>
							<div class="msg_error" id="msg_sample2">아이디 또는 비밀번호를 다시 확인하세요.</div>
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
			
			fp.util.jsonAjax({
				url : '/rest/v1/user/login',
				data: {
					userId : $.trim($("#input_sample1").val()),
					password : $.trim($("#input_sample2").val()),
					deviceType : "WEB",
					version : "1.0.0"
				},
				success: function(data) {
					fp.util.setCookie({
						authToken : data.authToken,
						userIdKey : data.userIdKey,
						userId : data.userId,
						userType : data.userType,
						userName : data.userName
					});
					
					location.href = "/app/look/look.jsp";
				},
				error: function(x,s,e) {
					
					$("#input_sample1").addClass("no");
					$("#input_sample2").addClass("no");

					if(x.status == '400') {
						$("#msg_sample1").addClass("show");
					} else if (x.status == '404' || x. status =='406') {
						$("#msg_sample2").addClass("show");
					}
					
				} 
			});
		});
		
		$("#input_sample1,#input_sample2").on("focus",function() {
			$(this).removeClass("no");
			$("#msg_sample1, #msg_sample2").removeClass("show");
		});
		
	</script>
	

	<!--// 컨텐츠 끝 -->

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>