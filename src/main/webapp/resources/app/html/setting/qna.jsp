<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain qna">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">1 : 1 문의</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec forms">
				<ul class="form">
					<!-- <li class="cate">
						<div class="dt">
							<select class="select">
								<option>회원정보 문의</option>
								<option>회원제도 문의</option>
								<option>시스템 문의</option>
								<option>기타 문의</option>
							</select>
						</div>
					</li> -->
					<li class="subj">
						<div class="dt">TITLE</div>
						<div class="dd">
							<input type="text" class="input">
						</div>
					</li>
					<li class="memo">
						<div class="dt">CONTENTS</div>
						<div class="dd">
							<textarea class="textarea"></textarea>
						</div>
					</li>
				</ul>
			</div>
			
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../mypage/profile.jsp" class="btn type b fill xl">Complete</a>
					</div>
				</div>
			</section>

		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
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