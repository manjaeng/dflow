<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->

	<div id="contain" class="contain lkreg cate">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
			</div>
		</div>
		<main id="contents" class="contents">

			<div class="forms">
				<ul class="filters">
					<li class="style">
						<div class="ht">STYLE CATEGORY</div>
						<div class="ct">
							<ul class="list">
								<li>
									<label><input type="checkbox"><span class="tit">Casual</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Girly</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Tomboy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Business</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Chic</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Bohemian</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sexy</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Punk</span></label>
								</li>
								<li>
									<label><input type="checkbox"><span class="tit">Sporty</span></label>
								</li>
							</ul>
						</div>
					</li>
					<li class="hash">
						<div class="ht">TAG</div>
						<div class="ct">
							<div class="ipt">
								<input type="text" class="input" placeholder="#@"> <a href="javascript:;" class="bt save">SAVE</a>
							</div>
							<div class="tags">
								<span class="tg"><i>#유니크 스타일</i> <a href="javascript:;" class="del">삭제</a></span>
								<span class="tg"><i>#유니크 스타일</i> <a href="javascript:;" class="del">삭제</a></span>
								<span class="tg"><i>#유니크 스타일</i> <a href="javascript:;" class="del">삭제</a></span>
							</div>
						</div>
					</li>
					<li class="text">
						<div class="ht">DETAIL</div>
						<div class="ct">
							<div class="num">MAX 500</div>
							<textarea class="textarea"></textarea>
						</div>
					</li>
				</ul>
			</div>

			<section class="steps st2">
				<ul class="st">
					<li>1</li>
					<li>2</li>
				</ul>
			</section>

			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<button type="button" class="btn type b fill xl">DONE</button>
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