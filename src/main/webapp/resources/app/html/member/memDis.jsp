<!doctype html>
<html lang="ko">
<head>
	
<%@ include file="../_inc/meta.jsp" %>

</head>
<body class="body">
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain memdis">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">회원탈퇴</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="tops">탈퇴 이유를 선택해주세요.</div>

			<ul class="list">
				<li><label class="radio"><input type="radio" name="radio_memdis"> <span>서비스가 만족스럽지 않아서 </span></li>
				<li><label class="radio"><input type="radio" name="radio_memdis"> <span>잦은 오류, 장애 때문에</span></li>
				<li><label class="radio"><input type="radio" name="radio_memdis"> <span>개인정보 유출에 대한 우려 때문에</span></li>
				<li><label class="radio"><input type="radio" name="radio_memdis"> <span>다른 계정으로 재가입하려고 </span></li>
				<li><label class="radio"><input type="radio" name="radio_memdis"> <span>서비스 이용을 거의 하지 않아서 </span></li>
				<li><label class="radio"><input type="radio" name="radio_memdis" checked="checked"> <span>기타</span></li>
			</ul>
			
			<div class="guds">
				<p class="p">회원탈퇴시 등록하신 정보는 복구가 불가합니다. </p>
				<div class="t">
					탈퇴 후 회원정보 및 개인형 서비스 정보는 모두 삭제됩니다. 
					가입시 입력한 정보 : 이메일, 닉네임, 아이디 등 
					서비스 이용을 위한 정보 : 사이즈, 스타일, 룩 등 
				</div>
				<p class="p">서비스를 이용하면서 작성한 1:1 문의는 탈퇴후에도
				남아있습니다.</p>
			</div>
			<div class="agree">
				<label class="checkbox"><input type="checkbox" id="agree_check" onchange="memdis_agree()";> <span>내용 확인하였으며, 이에 동의합니다. </span>
			</div>
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<button type="button" class="btn type b fill xl" disabled="disabled" id="btn_check_agree" onclick="memdis_com();">회원탈퇴</button>
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
	var memdis_agree = function(){
		// console.log( $("input#agree_check").is(":checked") );
		if( $("input#agree_check").is(":checked") ) {
			$("#btn_check_agree").prop("disabled",false);
		}else{
			$("#btn_check_agree").prop("disabled",true);
		}
	}
	var memdis_com = function(){
		ui.alert({
			msg:"<p>회원탈퇴 되었습니다</P>"
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