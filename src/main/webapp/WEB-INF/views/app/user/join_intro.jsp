<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain popJoinPre">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<div class="box">
				<div class="hdt">JOIN <em>FAPEE</em></div>
				<div class="bts">
					<a href="./login.do" class="bt btnLogin">LOGIN</a>
					<a href="./join_mobileCertified.do" class="bt btnJoin">SIGN UP</a>
				</div>
			</div>
			<div class="joinSet">
				
				<div class="hdt">Sign in with</div>
				<ul class="list">
					<li class="instar"><a href="javascript:;" class="bt"><span>Instargram</span></a></li>
					<li class="kakao"><a href="javascript:;" class="bt"><span>Kakaotalk</span></a></li>
					<li class="facebook"><a href="javascript:;" class="bt"><span>Facebook</span></a></li>
				</ul>
			
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
		$(function(){
			$('.box .bts a').click(function() {
				
				var index = $(this).index();
				
				if(index == 0) {
					pjax('./login.do');
				} else if (index == 1) {
					pjax('./join_mobileCertified.do');
				}
				
				return false;
			});
		});
	</script>
</div>