<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
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
					<div class="uiIptPlc phone">
						<input type="number" class="input" value="">
						<span class="plc">Mobile Phone</span>
						<a href="javascript:;" class="btn c sm btnSend">SEND</a>
					</div>
					
					<div class="uiIptPlc certi">
						<input type="number" class="input" value="">
						<span class="plc">Verification number </span>
						<span class="time" style="display:none;">2:59</span>
					</div>
					<div class="msgcode" style="display:none;">해당 번호로 코드를 전송하였습니다.</div>
					<div class="msg_error" id="msg_exist"></div>
					<div class="findpws" style="display:none;">
						<a href="./findPw.jsp" class="link">FORGOT ID/PASSWORD?</a>
					</div>
					
					<div class="agree">
						<div class="txt">
							본인이 만 14세 이상인 것과 서비스 이용약관, <br> <a href="javascript:;">서비스이용약관, 개인정보보호정책</a>에 동의하십니까? </div>
						<label class="checkbox"><input type="checkbox"><span></span></label>
					</div>
					<div class="msg_error show" id="msg_agree">약관에 동의해 주세요.</div>

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./joinId.jsp" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>
	
	<script>
		$(function() {
			
			var timer = fp.util.getTimer(180,'.certi .time');
			
			$('.phone a').click(function() {
				
				$('.msgcode').hide();
				$('.findpws').hide();
				$('#msg_exist').removeClass('show');
				
				var $phone = $('.phone input').val();
				
				if(!fp.util.checkRegEx('mobile',$phone)) {
					timer.destroy();
					$('#msg_exist').addClass('show');
					$('#msg_exist').text('올바른 번호를 입력해주세요.');
					$('.phone input').focus();
					
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/join_mobileCertified.do',
					data : {
						'mobile' : $phone
					},
					success: function(data) {
						
						if(data === 'exist') {
							$('#msg_exist').addClass('show');
							$('#msg_exist').text('이미 가입된 전화번호입니다.')
							$('.findpws').show();
							timer.destroy();
						} else if(data === 'send') {
							$('.msgcode').show();
							timer.start();
						}
					}
				});
				
				return false;
			});
			
			$('.fit a').click(function() {
				
				var $verification = $('#verification').val();
				
				if(timer.isStart() === false) {
					console.log('인증코드 보내주세요');
					return false;
				}
				
				if(timer.isEnd() === true) {
					console.log('인증코드 다시 보내주세요');
					return false;
				}
				
				if($verification.length === 0) {
					console.log('인증코드 입력해주세요');
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/join_mobileCertified2.do',
					data : {
						'verification' : $verification
					},
					success: function(data) {
						if(data === 't') {
							timer.destroy();
							timer = null;
							console.log('일치함');
							pjax('./join_id.do');
						} else if (data === 'f') {
							console.log('일치안함');
						}
						
					}
				});
				
				return false;
			});
			
		});
	</script>
</div>