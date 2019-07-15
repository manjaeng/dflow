<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	
	<!-- 컨텐츠 시작 -->
	
	<div class="prfeHd">
		<div class="in">
			<div class="bts">
				<a href="javascript:history.back();" class="hisback">뒤로</a>
			</div>
			<h1 class="tit">Profile</h1>
		</div>
	</div>
	<div id="contain" class="contain my prf set">
		<main id="contents" class="contents">

			<section class="uiPrfeSet b">
				<div class="user">
					<div class="photo">
						<div class="pic"><img src="https://placeimg.com/160/160/1" alt=""></div>
						<div class="bts"><a href="javascript:;" class="bt mod" onclick="popPrfPicMod();">수정</a></div>
					</div>
				</div>
			</section>

			<section class="prfeForm">
				<ul class="list">
					<li class="nick">
						<span class="dt">닉네임</span>
						<span class="dd"><input class="input bdn" type="text" value="BLUEMOON"></span>
					</li>
					<li class="id">
						<span class="dt">아이디</span>
						<span class="dd"><input class="input bdn" type="text" value="BLUEMOON1234"></span>
					</li>
					<li class="intro">
						<span class="dt">소개</span>
						<span class="dd">
							<textarea class="textarea bdn">편안하고 깔끔하게 출근할 때 입기 좋은 옷을 좋아 해요</textarea>
							<span class="num"><em>20</em><i>/</i><em>200</em></span>
						</span>
					</li>
					<!-- <li class="site">
						<span class="dt">홈페이지</span>
						<span class="dd"><input class="input bdn" type="url" value="www.bluemoon22.com"></span>
					</li> -->
					<li class="gender">
						<span class="dt">성별</span>
						<span class="dd">
							<label class="radio"><input type="radio" name="gender1" checked="checked"><span>여자</span></label>
							<label class="radio"><input type="radio" name="gender1"><span>남자</span></label>
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
				<div class="memDis">
					<a href="../member/mem_dis.jsp">회원탈퇴</a>
				</div>
			</section>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn type e xl">Cancel</a>
						<a href="javascript:;" class="btn type b fill xl">Done</a>
					</div>
				</div>
			</section>

		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>


	<script>
	$(document).ready(function(){
		
	});
	</script>
	

	<!--// 컨텐츠 끝 -->
	

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>