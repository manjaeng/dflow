<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../common/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain myinfo step2">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="sec style">
				<div class="hdt"><em>CHOOSE YOUR <br> FAVORITE STYLE </em> </div>
				<ul class="list">
				</ul>
			</section>
			
			<section class="steps st2">
				<ul class="st">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</section>

			<div class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="./step3.jsp" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>

		</main>
	</div>

	<script>
	
	$.ajax({
		type : 'get',
		url : '/rest/v1/intro/styleList',
		success : function(data) {
			$('.style .list').empty();
			
			$.each(data,function(i,e) {
				
				var tmp  = '<li><label><input type="checkbox" value='+e.idkey+'><span class="tit">';
				    tmp += e.style
				    tmp += '</span></label></li>'
				
				$('.style .list').append(tmp);
			});
		},
		complete : function() {
			$('.style input[type=checkbox]').click(function(e) {
				if($('.style input[type=checkbox]:checked').length > 4) {
					e.preventDefault();
					alert('최대 4개 가능');
				}
			});
		}
	});
	
	$(function() {
		$('.fit a').click(function() {
			
			fp.data.intro.style = [];
			
			if($('.style input[type=checkbox]:checked').length == 0) {
				alert('한개이상 선택');
				return false;
			}
			
			$('.style input[type=checkbox]:checked').each(function(i,e) {
				fp.data.intro.style.push($(this).val());
			});
			
			$.pjax({
				url : './step3.jsp',
				fragment : '#wrap',
				container : '#wrap'
			});
			
			return false;
		});
	});
	
	</script>
	
	<!--// 컨텐츠 끝 -->
	
</div>


<%@ include file="../common/bottom.jsp" %>
<%@ include file="../common/scripts.jsp" %>
</body>
</html>