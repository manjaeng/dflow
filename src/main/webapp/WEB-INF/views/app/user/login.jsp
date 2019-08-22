<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain popLogin">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="loginForm">
				<div class="hdt"><em>LOGIN</em></div>
				<div class="form">
					<div class="uiIptPlc id">
						<input type="email" class="input"  id="input_sample1" value="">
						<span class="plc">ID/mobile PHONE</span>
					</div>
					<div class="uiIptPlc pw">
						<input type="password" class="input" id="input_sample2">
						<span class="plc">PASSWORD</span>
					</div>
					<div class="msg_error" id="msg_sample1">비밀번호가 일치하지 않습니다.</div>
				</div>
				<div class="info">
					<div class="save">
						<label class="checkbox"><input type="checkbox" checked="checked"><span>자동 로그인</span></label>
					</div>
					<div class="txt">
						<a href="./findPw.jsp" class="link">FORGOT ID/PASSWORD?</a>
					</div>
				</div>
			</div>
			<div class="gudJoin">
				<div class="in">
					<div class="line"></div>
					<div class="msg">
						<span class="txt">Don’t have an account?</span>
						<a href="./joinMo.jsp" class="link">SIGN UP</a>
					</div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn xl b fill btnLogin" id="btnLogin">LOGIN</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>
	
	
	<script>
		$("#btnLogin").on("click",function(){
			$("#input_sample1").addClass("ok");
			$("#input_sample2").addClass("no");
			$("#msg_sample1").addClass("show");
		});
	</script>
	
</div>