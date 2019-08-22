<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain popJoin id">
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
					<!-- <div class="memcate">
						<label class="radio"><input type="radio" name="memcate1" checked="checked"><span>일반회원</span></label>
						<label class="radio"><input type="radio" name="memcate1"><span>전문가</span></label>
					</div> -->
					<div class="uiIptPlc id">
						<input type="text" class="input valid"  id="input_sample1" value="">
						<span class="plc">ID</span>
					</div>
					<div class="msg_error" id="msg_existId">아이디를 입력해주세요.</div>
					<div class="msgs">
						아이디는 내 프로필의 고유 주소가 되며 변경이 불가합니다. <br> 아이디는 영문 및  숫자로만 입력 가능합니다. 
					</div>

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./join_password.do" class="btn xl b fill btnNext">NEXT</a>
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
					fp.data.join.userId = 'fapee';
					pjax('./join_password.do');
					
					return false;
				}
				
				var $id = $('.id input').val();
				
				if($id.length === 0) {
					$('#msg_existId').addClass('show');
					$('#msg_existId').text('아이디를 입력해주세요.');
					$('.id input').focus();
					return false;
				}
				
				if(!fp.util.checkRegEx('id',$id)) {
					$('#msg_existId').addClass('show');
					$('#msg_existId').text('아이디 형식을 다시 확인해주세요.');
					$('.id input').focus();
					return false;
				}
				
				$.ajax({
					type : 'post',
					url : '/app/user/join_id.do',
					data : {
						'userId' : $id
					},
					success: function(data) {
						if(data === 'ok') {
							fp.data.join.userId = $id;
							pjax('./join_password.do');
						} else if (data === 'exist') {
							$('.msgcode').hide();
							$('#msg_existId').addClass('show');
							$('#msg_existId').text('사용 중인 아이디입니다.');
						}
					}
				});
				
				return false;
			});
			
		});
	</script>
	
</div>