<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<article class="popPage popSetting" id="popSetting">
		<div class="pbd">
			<div class="phd">
				<div class="in">
					<h1 class="tit">설정</h1>
					<button type="button" class="btnPopClose" onclick="history.back();">뒤로</button>
				</div>
			</div>
			<div class="pct">
				<main class="poptents">
					<section class="secMySets">
						<ul class="list">
							<li>
								<a href="javascript:;">회원정보</a>
								<ul>
									<li><a href="/resources2/app/html/mypage/profile_set.jsp">프로필 관리</a></li>
									<li><a href="javascript:;">비밀번호 변경</a></li>
									<li><a href="javascript:;">이메일 변경</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">서비스 정보</a>
								<ul>
									<li><a href="javascript:;">사이즈 관리</a></li>
									<li><a href="javascript:;">선호 스타일 관리</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">기타 설정</a>
								<ul>
									<li><a href="javascript:;">SNS 연결</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">모델 설정</a>
								<ul>
									<li><a href="javascript:;">모델 사이즈 관리</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">고객지원</a>
								<ul>
									<li><a href="javascript:;">1:1 문의</a></li>
									<li><a href="javascript:;">공지사항</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">이용가이드</a>
								<ul>
									<li><a href="javascript:;">이용약관</a></li>
									<li><a href="javascript:;">개인정보취급방침</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">서비스정보</a>
								<ul>
									<li><a href="javascript:;">선호스타일관리</a></li>
								</ul>
							</li>
							<li>
								<a href="javascript:;">로그아웃</a>
							</li>
						</ul>
					</section>
				</main>
			</div>
		</div>
	</article>


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