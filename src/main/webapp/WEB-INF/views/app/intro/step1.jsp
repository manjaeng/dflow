<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain myinfo step1">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<!-- <a href="javascript:history.back();" class="bt hisback">뒤로</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<section class="sec myinfo">
				<div class="hdt"><em>FIND YOUR FIT</em></div>
				<div class="form">
					<div class="msg">
						패피의 사이즈 매칭으로 <br>
						당신에게 맞는 핏을 찾아드립니다.
					</div>
					<ul class="list">
						<li class="gender">
							<div class="dt">성별</div>
							<div class="dd">
								<label class="radio"><input type="radio" name="gender" value="f" checked><span>여자</span></label>
								<label class="radio"><input type="radio" name="gender" value="m"><span>남자</span></label>
							</div>
						</li>
						<li class="nation">
							<div class="dt">국가</div>
							<div class="dd">
								<div class="sel">
									<select class="select">
										<option>KOREA</option>
										<option>CHINA</option>
										<option>JAPAN</option>
										<option>INDIA</option>
									</select>
								</div>
							</div>
						</li>
					</ul>
					<div class="account">
						<a href="/app/user/login.do">Do you HAVE AN ACCOUNT?</a>
					</div>
				</div>


			</section>

			<section class="steps st1">
				<ul class="st">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</section>

			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a  href="./step2.do" class="btn xl b fill btnNext">NEXT</a>
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
			var deviceId = 'emsdf1-saesd-vsdaf-esdfs';
			
			fp.data.intro = {
				deviceId : deviceId,
				gender : $('input[name="gender"]:checked').val(),
				country : $('.nation .select').val().toLowerCase()
			};
			
			pjax('./step2.do');
			
			return false;
		});
		
	});
	
	</script>
</div>