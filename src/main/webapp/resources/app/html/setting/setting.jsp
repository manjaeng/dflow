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
			<section class="sec mysets">
				<ul class="list">
					<li>
						<span class="bt">계정관리</span>
						<ul>
							<li><a class="bt" href="../setting/pwMod.jsp">비밀번호 변경</a></li>
							<li><a class="bt" href="../setting/account.jsp">연결된 계정</a></li>
							<li><a class="bt" href="../setting/my_review.jsp">쇼핑내역</a></li>
							<li><a class="bt" href="../setting/myreward.jsp">내 리워드 관리</a></li>
							<!-- <li><a class="bt" href="../setting/certiEmail.jsp">이메일 인증</a></li> -->
							<!-- <li><a class="bt" href="../setting/cools.jsp">COOL한 게시물</a></li> -->
						</ul>
					</li>
					<li>
						<a class="bt" href="../setting/setting_alim.jsp">알림설정</a>
					<li>
						<span class="bt">고객지원</span>
						<ul>
							<li><a class="bt" href="../setting/qna.jsp">1 : 1 문의</a></li>
							<li><a class="bt" href="../setting/notice.jsp">공지사항</a></li>
						</ul>
					</li>
					<li>
						<span class="bt">이용가이드</span>
						<ul>
							<li><a class="bt" href="../setting/policy1.jsp">이용약관</a></li>
							<li><a class="bt" href="../setting/policy2.jsp">개인정보취급방침</a></li>
						</ul>
					</li>
					<li>
						<span class="bt">업데이트</span>
						<ul>
							<li><a class="bt" href="../setting/version.jsp">앱버전정보 <em class="ver">1.0.2</em></a></li>
						</ul>
					</li>
					<li>
						<a class="bt" href="javascript:;" onclick="sampleSellerAct();">셀러 계정 신청</a>
					</li>
					<li>
						<a class="bt" href="javascript:;" onclick="sampleLogoutAct();">로그아웃</a>
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
	var sampleSellerAct = function(){
		ui.confirm({ // 컨펌 창 띄우기
			msg:'<p>확인을 누르시면 <br>셀러 가입 웹페이지로 이동합니다.</p>',
			ycb:function(){
				// console.log('컨펌확인결과');
			},
			ncb:function(){
				// console.log('컨펌취소결과');
			}
		});
	}
	var sampleLogoutAct = function(){
		ui.confirm({ // 컨펌 창 띄우기
			msg:'<p>로그아웃을 하시겠습니까?</p>',
			ycb:function(){
				// console.log('컨펌확인결과');
			},
			ncb:function(){
				// console.log('컨펌취소결과');
			}
		});
	}

	$(document).ready(function(){
		
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>