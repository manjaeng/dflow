<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
		
	<!-- 컨텐츠 시작 -->
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
					<div class="msg_error show" id="msg_sample1">사용 중인 아이디입니다.</div>
					<div class="msg_error show" id="msg_sample2">아이디를 입력해 주세요.</div>
					<div class="msgs">
						아이디는 내 프로필의 고유 주소가 되며 변경이 불가합니다. <br> 아이디는 영문 및  숫자로만 입력 가능합니다. 
					</div>

				</div>
			</div>
			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./joinPw.jsp" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>
		</main>
	</div>
	
	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>
	
	
	<script>
		
	</script>

	<!--// 컨텐츠 끝 -->

	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>