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
				<form>
					<div class="hdt"><em>LOGIN</em></div>
					<div class="form">
						<div class="uiIptPlc id">
							<input type="text" class="input"  id="input_sample1" value="">
							<span class="plc">ID/mobile PHONE</span>
						</div>
						<div class="uiIptPlc pw">
							<input type="password" class="input" id="input_sample2">
							<span class="plc">PASSWORD</span>
						</div>
						<div class="msg_error" id="msg_error">비밀번호가 일치하지 않습니다.</div>
					</div>
					<div class="info">
						<div class="save">
							<label class="checkbox"><input type="checkbox" checked="checked"><span>자동 로그인</span></label>
						</div>
						<div class="txt">
							<a href="./find_password.do" class="link">FORGOT ID/PASSWORD?</a>
						</div>
					</div>
				</form>
			</div>
			<div class="gudJoin">
				<div class="in">
					<div class="line"></div>
					<div class="msg">
						<span class="txt">Don’t have an account?</span>
						<a href="./join_mobileCertified.do" class="link">SIGN UP</a>
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
		$(function() {
			$("#btnLogin").click(function(){
				
				var $id = $.trim($('.id input').val());
				var $pw = $.trim($('.pw input').val());
				
				if($id.length === 0) {
					$("#input_sample1, #input_sample2").removeClass("no").addClass("on");
					$('#msg_error').addClass('show');
					$('#msg_error').text('아이디 또는 전화번호를 입력해주세요.');
					$('.id input').val('');
					$('.id input').focus();
					return false;
				}
				
				if(!(fp.util.checkRegEx('id',$id) || fp.util.checkRegEx('mobile',$id))) {
					$("#input_sample1, #input_sample2").removeClass("no").addClass("on");
					$('#msg_error').addClass('show');
					$('#msg_error').text('아이디 형식을 다시 확인해주세요.');
					$('.id input').focus();
					return false;
				}
				
				if($pw.length === 0) {
					$("#input_sample1, #input_sample2").removeClass("no").addClass("on");
					$('#msg_error').addClass('show');
					$('#msg_error').text('비밀번호를 입력해주세요.');
					$('.pw input').val('');
					$('.pw input').focus();
					return false;
				}
				
				fp.util.jsonAjax({
					url : '/app/user/login.do',
					data: {
						userId : $id,
						password : $pw,
					},
					success: function(data) {
						
						if(data === 't') {
							$("#input_sample1, #input_sample2").removeClass("no").addClass("on");
							$('#msg_error').removeClass('show');
							
							if(fp.util.getParam('after') !== '') {
								if(fp.util.getParam('after') === 'my') {
									if(fp.util.getParam('id') === '') {
										pjax('/app/my/profile.do');
									} else {
										pjax('/app/my/profile.do?id=' + fp.util.getParam('id'));
									}
								}
							} else {
								pjax('/app/home/home.do');
							}
							
						} else if (data === 'f') {
							$('#msg_error').addClass('show');
							$('#msg_error').text('계정 정보를 확인해주세요.');
							$("#input_sample1, #input_sample2").addClass("no");
						}
	
					}
				});
				
				return false;
			});
			
			$('.pw input').keypress(function(e) {
				if(e.keyCode == 13) {
					$('#btnLogin').trigger('click');
				}
			});
		});
	</script>
	
</div>