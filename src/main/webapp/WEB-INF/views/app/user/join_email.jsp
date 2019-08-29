<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
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
					<div class="uiIptPlc email">
						<input type="text" class="input valid"  id="input_sample1" value="">
						<span class="plc">E-MAIL</span>
					</div>
					<div class="msg_error" id="msg_existEmail">가입 완료된. 이메일입니다</div>
					<div class="msgs">이메일은 비밀번호 찾기 및 로그인시 필요합니다.</div>

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../home/home.jsp" class="btn xl b fill btnDone">Done</a>
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
				
				if(!fp.data.join) {
					console.log('데이터 없음');
					pjax('/app/user/join_intro.do');
					return false;
				}
				
				//Skip
				if(fp.test) {
					fp.data.join.email = 'csh0034@gmail.com';
					ui.loading.show();
					
					 fp.util.jsonAjax({
							url : '/app/user/join_complete.do',
							data : fp.data.join,
			                success : function(data) {
			                	if(data === "t") {
			                		fp.data.join = null;
			                		//pjax('/app/home.do');
			                		pjax('/app/my/profile.do');
			                		console.log('임시) 프로필로 이동');
			                		
			                		setTimeout(function(){
			                			ui.loading.hide();
			                		},500);
			                	}
			                },
			                error : function(x, s, e) {
			                    console.log(x);
			                }
						});
					
					return false;
				}
				
				var $email = $('.email input').val();
				
				if($email.length === 0) {
					$('#msg_existEmail').addClass('show');
					$('#msg_existEmail').text('이메일을 입력해주세요.');
					$('.email input').focus();
					return false;
				}
				
				if(!fp.util.checkRegEx('email',$email)) {
					$('#msg_existEmail').addClass('show');
					$('#msg_existEmail').text('이메일 형식을 다시 확인해주세요.');
					$('.email input').focus();
					return false;
				}
				
				fp.data.join.email = $email;
				ui.loading.show()
				
					
				fp.util.jsonAjax({
					url : '/app/user/join_complete.do',
					data : fp.data.join,
	                success : function(data) {
	                	if(data === "t") {
	                		fp.data.join = null;
	                		//pjax('/app/home.do');
	                		pjax('/app/my/profile.do');
	                		console.log('임시) 프로필로 이동')
	                		
	                		setTimeout(function(){
	                			ui.loading.hide();
	                		},500);
	                	}
	                },
	                error : function(x, s, e) {
	                    console.log(x);
	                }
				});
					
				return false;
			});
			
		});
	</script>

</div>