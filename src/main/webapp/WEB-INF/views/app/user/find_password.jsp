<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain findPw">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="findForm">
				<div class="hdt"><em>비밀번호 찾기</em></div>
				<div class="msg">가입 시 인증한 전화 번호를 입력하시면 <br> 본인 확인 코드를 보내드립니다. </div>
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
					<div class="msg_error" id="msg_check">인증 코드를 다시 확인하세요. </div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn xl b fill">NEXT</a>
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
			
			var timer2 = fp.util.getTimer(180,'.certi .time');
			
			window.onpopstate = function () {
				timer2.destroy();
			};
			
			$('.phone a').click(function() {
				
				$(".phone input, .certi input").removeClass("no");
				
				$('.msgcode').hide();
				$('#msg_check').removeClass('show');
				
				var $phone = $('.phone input').val();
				
				if(!fp.util.checkRegEx('mobile',$phone)) {
					$(".phone input").addClass("no");
					timer2.destroy();
					$('#msg_check').addClass('show');
					$('#msg_check').text('올바른 전화번호를 입력해주세요.');
					$('.phone input').focus();
					
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/find_password.do',
					data : {
						'mobile' : $phone
					},
					success: function(data) {
						if(data === 'send') {
							$('.msgcode').show();
							timer2.start();
						} else if(data === 'notExist') {
							$(".phone input").addClass("no");
							$('#msg_check').addClass('show');
							$('#msg_check').text('등록 되지 않은정보입니다.')
							$('.phone input').focus();
							timer2.destroy();
						}
					}
				});
				
				return false;
			});
			
			
			$('.fit a').click(function() {
				
				$(".certi input").removeClass("no");
				var $verification = $('.certi input').val();
				
				if(timer2.isStart() === false) {
					$('#msg_check').addClass('show');
					$('#msg_check').text('인증코드를 보내주세요.');
					$('.phone input').focus();
					return false;
				}
				
				if(timer2.isEnd() === true) {
					$('.msgcode').hide();
					$('#msg_check').addClass('show');
					$('#msg_check').text('인증코드를 다시 보내주세요.');
					return false;
				}
				
				if($verification.length === 0) {
					$(".certi input").addClass("no");
					$('.msgcode').hide();
					$('#msg_check').addClass('show');
					$('#msg_check').text('인증코드를 입력해 주세요.');
					 $('.certi input').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/find_password2.do',
					data : {
						'verification' : $verification
					},
					success: function(data) {
						if(data === 't') {
							$(".phone input, .certi input").removeClass("no");
							timer2.destroy();
							timer2 = null;
							pjax('./find_passwordReset.do');
						} else if (data === 'f') {
							$(".certi input").addClass("no");
							$('.msgcode').hide();
							$('#msg_check').addClass('show');
							$('#msg_check').text('인증 코드를 다시 확인하세요.');
						}
						
					}
				});
				
				return false;
			});
			
		});
	</script>
</div>