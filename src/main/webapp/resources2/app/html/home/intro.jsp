<!doctype html>
<html lang="ko">
<head>
<%@ include file="../_inc/meta.jsp" %>
</head>
<body class="body">
<div class="wrap" id="wrap">
	
	
	
	<!-- 컨텐츠 시작 -->
	
	<div id="contain" class="contain int">
		<main id="contents" class="contents">
			
			<article class="intro" id="intro">
				<div class="msg">FIND YOUR FIT</div>
				<a href="/resources2/app/html/home/home.jsp" class="logo">FAPEE</a>
				<div class="box bx1">
					<span class="line L1"></span>
					<span class="line L2"></span>
					<span class="line L3"></span>
					<span class="line L4"></span>
					<span class="line L5"></span>
					<span class="line L6"></span>
					<span class="line L7"></span>
					<span class="line L8"></span>
					<span class="line L9"></span>
					<span class="line L10"></span>
				</div>
				<div class="box bx2">
					<span class="line L1"></span>
					<span class="line L2"></span>
					<span class="line L3"></span>
					<span class="line L4"></span>
					<span class="line L5"></span>
					<span class="line L6"></span>
					<span class="line L7"></span>
					<span class="line L8"></span>
					<span class="line L9"></span>
					<span class="line L10"></span>
				</div>
			</article>
			

		</main>
	</div>

	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="../_inc/inc_layers.jsp" %>
	</div>

	<script>
	
	var introStart = function(){
		$("#intro").addClass("on");
		
		$("#intro .logo").on("transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",function(){
			console.log("이동");
			setTimeout(function(){
				
				location.href = "./myinfo_step1.jsp";
			},100);
		});
	}
	$(document).ready(function(){
		introStart();
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	
</div>


<%@ include file="../_inc/bottom.jsp" %>
<%@ include file="../_inc/scripts.jsp" %>
</body>
</html>