<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain mdl reg edt">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">Model Edit</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="guds">
				모델명과 모델의 사이즈정보는 <br>변경이 불가합니다.
			</div>

			
			<section class="prfeForm">
				<div class="photo">
					<div class="pic"><img src="//placeimg.com/160/160/1" alt=""></div>
					<div class="bts"><a href="javascript:;" class="bt mod">수정</a></div>
				</div>
				
				<ul class="list">
					<li class="name">
						<span class="dt">모델명</span>
						<span class="dd"><input class="input bdn" type="text" value=""></span>
					</li>
					<li class="gender">
						<span class="dt">성별</span>
						<span class="dd">
							<label class="radio"><input type="radio" name="gender1" checked="checked"><span>FEMALE</span></label>
							<label class="radio"><input type="radio" name="gender1"><span>MALE</span></label>
						</span>
					</li>
					<li class="nation">
						<span class="dt">국가</span>
						<span class="dd">
							<select class="select nt">
								<option>Korea</option>
								<option>Korea</option>
								<option>Korea</option>
								<option>Korea</option>
							</select>
						</span>
					</li>
				</ul>
				<div class="msg">*모델명과 모델의 사이즈 정보는 변경이 불가입니다.</div>
			</section>
			
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../mypage/model_reg2.jsp" class="btn type b fill xl">Save</a>
					</div>
				</div>
			</section>

		</main>
	</div>


	<script>

	$(document).ready(function(){

	});

	</script>
	
	<!--// 컨텐츠 끝 -->


	<%@ include file="/WEB-INF/views/common/app-menubar.jsp" %>
</div>