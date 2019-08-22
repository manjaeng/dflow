<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain popJoin pw">
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
					<div class="uiIptPlc pw">
						<input type="password" class="input"  id="input_sample1" value="">
						<span class="plc">PASSWORD</span>
					</div>
					<div class="msg_error" id="msg_existPw">비밀번호 형식을 다시 확인해 주세요.</div>
					<div class="msgs">비밀번호는 6자 이상의 영문, 숫자 조합으로 입력해주세요. </div>
				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./join_email.do" class="btn xl b fill">Next</a>
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
				
				//Skip
				if(fp.test) {
					fp.data.join.password = 'fapee123';
					pjax('./join_email.do');
					
					return false;
				}
				
				var $pw = $('.pw input').val();
				
				if($pw.length === 0) {
					$('#msg_existPw').addClass('show');
					$('#msg_existPw').text('비밀번호를 입력해주세요.');
					$('.pw input').focus();
					return false;
				}
				
				if(!fp.util.checkRegEx('pw',$pw)) {
					$('#msg_existPw').addClass('show');
					$('#msg_existPw').text('비밀번호 형식을 다시 확인해주세요.');
					$('.pw input').focus();
					return false;
				}
				
				fp.data.join.password = $pw;
				pjax('./join_email.do');
				
				return false;
			});
			
		});
	</script>
	
</div>