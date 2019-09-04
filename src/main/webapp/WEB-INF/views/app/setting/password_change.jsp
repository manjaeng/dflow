<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
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
					<form>
						<div class="uiIptPlc pw now">
							<input type="password" class="input" id="pw_now">
							<span class="plc">현재비밀번호 입력</span>
						</div>
						<div class="uiIptPlc pw new">
							<input type="password" class="input" id="pw_new">
							<span class="plc">변경비밀번호 입력</span>
						</div>
						<div class="uiIptPlc pw com">
							<input type="password" class="input" id="pw_re">
							<span class="plc">비밀번호 확인</span>
						</div>
						<div class="msg_error" id="msg_check">비밀번호가 일치하지 않습니다.</div>
						<div class="msgs">* 영문숫자조합 6자 이상 조합으로 가능합니다. </div>
					</form>
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
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
		$(function() {
			$('.fit a').click(function() {
				
				$("#pw_now ,#pw_new, #pw_re").removeClass("no");
				
				var $pw_now = $.trim($('.pw input').eq(0).val()),
					$pw_new = $.trim($('.pw input').eq(1).val()),
					$pw_re  = $.trim($('.pw input').eq(2).val());
				
				if($pw_now.length === 0) {
					$("#pw_now").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(0)').focus();
					return false;
				}
				
				if($pw_new.length === 0) {
					$("#pw_new").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(1)').focus();
					return false;
				}
				
				if($pw_re.length === 0) {
					$("#pw_re").addClass("no").val('');
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호를 입력해주세요.');
					$('.pw input:eq(2)').focus();
					return false;
				}
				
				if(!fp.util.checkRegEx('pw',$pw_new)) {
					$("#pw_new, #pw_re").addClass("no");
					$('#msg_check').addClass('show');
					$('#msg_check').text('6자이상 영문숫자조합으로 입력해주세요.');
					$('.pw input:eq(1)').focus();
					return false;
				}
				
				if($pw_new !== $pw_re) {
					$("#pw_re").addClass("no");
					$('#msg_check').addClass('show');
					$('#msg_check').text('비밀번호가 일치하지 않습니다.');
					$('.pw input:eq(2)').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/setting/password_change.do',
					data : JSON.stringify({
						'password' : $pw_now,
						'password_new' : $pw_new
					}),
					contentType : 'application/json; charset=utf-8',
					success: function(data) {
						
						if (data === 'noSession') {
							alert('계정 연결 끊김');
						} else if(data === 'mismatch') {
							$("#pw_now").addClass("no").val('');
							$('#msg_check').addClass('show');
							$('#msg_check').text('비밀번호가 일치하지 않습니다.');
							$('.pw input:eq(0)').focus();
						} else if(data === 'success') {
							history.back();
						}
					}
				});
				
				return false;
			});
			
			$('#pw_re').keypress(function(e) {
				if(e.keyCode == 13) {
					$('.fit a').trigger('click');
				}
			});
		});
	</script>
	
</div>