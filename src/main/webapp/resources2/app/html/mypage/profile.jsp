<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain my prf">
		<div class="prfeHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="hisback">뒤로</a>
				</div>
				<h1 class="tit">패피루키</h1>
				<div class="set">
					<a class="bt alim on" href="javascript:;">알림</a>
					<a class="bt conf" href="/resources2/app/html/mypage/setting.jsp">설정</a>
					<a class="bt more" href="javascript:;">더보기</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<section class="uiPrfeSet a">
				<div class="user">
					<div class="photo">
						<div class="pic"><img src="https://placeimg.com/160/160/1" alt=""></div>
						<div class="bts"><a href="javascript:;" class="bt mod">수정</a></div>
					</div>
					<div class="infos">
						<div class="name">패피루키</div>
						<div class="summ">
							<span class="cm">163cm</span>
							<span class="nt">대한민국</span>
						</div>
						<div class="amount">
							<div class="fw fwers"><em>1.1K</em><i>followers</i></div>
							<div class="fw fwing"><em>51</em><i>following</i></div>
						</div>
					</div>
				</div>
				<div class="foll"><a href="javascript:;" class="btn type a">FOLLOW</a></div>
				<div class="desc">
					<div class="ment">
						하늘색과 트렌치 코트를 좋아합니다.<br>
						편안하고 출근할 때 입기 좋은 옷을 좋아해요~
					</div>
					<div class="url"><a href="http://www.beautyitem.com" target="_blank">www.beautyitem.com</a></div>
					<div class="tag">
						<span class="hash">#Casual</span> <span class="hash">#Elegant</span> <span class="hash">#Vintage</span> 
					</div>
				</div>
			</section>

			<section class="prInfoList">
				<div class="tabs">
					<ul class="menu">
						<li class="active"><a href="javascript:;">LOOK</a></li>
						<li><a href="javascript:;">FOLLOW</a></li>
						<li><a href="javascript:;">LIKE</a></li>
					</ul>
				</div>
				<div class="prInfoCont">
					탭 내용
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
	
	<%@ include file="../_inc/menubar.jsp" %>

</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>