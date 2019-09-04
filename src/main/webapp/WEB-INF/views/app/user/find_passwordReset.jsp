<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain findPw rst">
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
				<div class="form">
					<form>
						<div class="uiIptPlc pw new">
							<input type="password" class="input" id="pw">
							<span class="plc">비밀번호 입력</span>
						</div>
						<div class="uiIptPlc pw com">
							<input type="password" class="input" id="pwre">
							<span class="plc">비밀번호 확인</span>
						</div>
						<div class="msg_error" id="msg_check">비밀번호가 일치하지 않습니다.</div>
						<div class="msgs">* 영문숫자조합 6자 이상 조합으로 가능합니다. </div>
					</form>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn xl b fill btnDone">DONE</a>
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
			
			$('.fit a').click(function() {
				
				$("#pw, #pwre").removeClass("no");
				
				var $pw   = $.trim($('.pw input').eq(0).val()),
					$pwre = $.trim($('.pw input').eq(1).val());
				
				if($pw.length === 0) {
					$("#pw").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(0)').focus();
					return false;
				}
				
				if(!fp.util.checkRegEx('pw',$pw)) {
					$("#pw").addClass("no");
					$('#msg_check').addClass('show');
					$('#msg_check').text('6자이상 영문숫자조합으로 입력해주세요.');
					$('.pw input:eq(0)').focus();
					return false;
				}
				
				if($pwre.length === 0) {
					$("#pwre").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(1)').focus();
					return false;
				}
				
				if($pw !== $pwre) {
					$("#pwre").addClass("no");
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호가 일치하지 않습니다.');
					$('.pw input:eq(1)').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/find_passwordReset.do',
					data : {
						'password' : $pw
					},
					success: function(data) {
						if(data === 't') {
							$("#pw, #pwre").removeClass("no");
							pjax('find_passwordCom.do');
						} else if(data === 'f') {
							$('#msg_check').addClass('show');
							$('#msg_check').text('유효시간이 만료되었습니다.')
						}
					}
				});
				
				return false;
			});
			
			$('#pwre').keypress(function(e) {
				if(e.keyCode == 13) {
					$('.fit a').trigger('click');
				}
			});
		});
	</script>
	
</div>