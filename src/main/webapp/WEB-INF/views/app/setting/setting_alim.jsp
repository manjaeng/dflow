<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain setalim">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">알림설정</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="sec alim">



				<ul class="list">
					<li>
						<ul>
							<li><span class="tit">내가 올린 LOOK에 대한 댓글 </span> <div class="uiChk"><input type="checkbox" id="myLookComment" name="myLookComment"><em></em></div> </li>
							<li><span class="tit">내가 남긴 댓글에 대한 댓글</span> <div class="uiChk"><input type="checkbox" id="myCommentComent" name="myCommentComent"><em></em></div> </li>
							<li><span class="tit">내가 COOL 누른 게시물의 댓글 </span> <div class="uiChk"><input type="checkbox" id="myCoolComment" name="myCoolComment"><em></em></div> </li>
						</ul>
					</li>
					<li>
						<ul>
							<li><span class="tit">타인이 나를 팔로우 할 때</span> <div class="uiChk"><input type="checkbox" id="followMe" name="followMe"><em></em></div> </li>
							<li><span class="tit">타인이 나의 LOOK에 COOL을 누를 때</span> <div class="uiChk"><input type="checkbox" id="coolMyLook" name="coolMyLook"><em></em></div> </li>
						</ul>
					</li>
					<li>
						<ul>
							<li><span class="tit">앱 공지사항</span> <div class="uiChk"><input type="checkbox" id="appNotice" name="appNotice"><em></em></div> </li>
							<li><span class="tit">앱 내 이벤트 알림</span> <div class="uiChk"><input type="checkbox" id="appEvent" name="appEvent"><em></em></div> </li>
						</ul>
					</li>
				</ul>
			</section>
		</main>
	</div>

	<script>
	$(document).ready(function(){
		if('${data.myLookComment}'=='Y') 	$('#myLookComment').attr('checked', true);
		if('${data.myCommentComent}'=='Y')	$('#myCommentComent').attr('checked', true);
		if('${data.myCoolComment}'=='Y') 	$('#myCoolComment').attr('checked', true);
		
		if('${data.followMe}'=='Y') 		$('#followMe').attr('checked', true);
		if('${data.coolMyLook}'=='Y') 		$('#coolMyLook').attr('checked', true);
		
		if('${data.appNotice}'=='Y') 		$('#appNotice').attr('checked', true);
		if('${data.appEvent}'=='Y') 		$('#appEvent').attr('checked', true);
		
		//삭제 버튼.
		$('body').delegate( 'input[type=checkbox]', 'click', function() {
			var param = { };
				param.myLookComment		= $('#myLookComment').is(':checked')? 'Y':'N';
				param.myCommentComent	= $('#myCommentComent').is(':checked')? 'Y':'N';
				param.myCoolComment		= $('#myCoolComment').is(':checked')? 'Y':'N';
				
				param.followMe			= $('#followMe').is(':checked')? 'Y':'N';
				param.coolMyLook		= $('#coolMyLook').is(':checked')? 'Y':'N';
				
				param.appNotice			= $('#appNotice').is(':checked')? 'Y':'N';
				param.appEvent			= $('#appEvent').is(':checked')? 'Y':'N';
			
			$.post('/app/setting/rest/setting_alim.do', param, function(data) {
				if(data.code!=0) {
					ui.alert({ msg: '<p>' + data.message + '</P>' });
					if(data.code==401) location.href = '/app/user/login.do';
				}
			}, 'json');

		});
	});
	</script>
	
	<!--// 컨텐츠 끝 -->
	

	
</div>
