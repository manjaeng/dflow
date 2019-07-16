<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain setting">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">SETTING</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="secMySets">
				<ul class="list">
					<li>
						<a href="javascript:;">계정관리</a>
						<ul>
							<li><a href="javascript:;">비밀번호 변경</a></li>
							<li><a href="javascript:;">이메일 변경</a></li>
							<li><a href="../mypage/cools.jsp">COOL한 게시물</a></li>
						</ul>
					</li>
					<li>
						<a href="../mypage/setting_alim.jsp">알림설정</a>
					<li>
						<a href="javascript:;">고객지원</a>
						<ul>
							<li><a href="../mypage/qna.jsp">1:1 문의</a></li>
							<li><a href="../mypage/notice.jsp">공지사항</a></li>
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
						<a href="javascript:;">업데이트</a>
						<ul>
							<li><a href="javascript:;">앱버전정보 <em class="ver">0.1</em></a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:;">전문가 계정 신청</a>
					</li>
					<li>
						<a href="javascript:;">로그아웃</a>
					</li>
				</ul>
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