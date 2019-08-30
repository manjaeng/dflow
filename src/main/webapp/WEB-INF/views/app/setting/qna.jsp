<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain qna">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">1 : 1 문의</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec forms">
				<ul class="form">
					<li class="subj">
						<div class="dt">TITLE</div>
						<div class="dd">
							<input type="text" class="input">
						</div>
					</li>
					<li class="memo">
						<div class="dt">CONTENTS</div>
						<div class="dd">
							<textarea class="textarea"></textarea>
						</div>
					</li>
				</ul>
			</div>
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="../mypage/profile.jsp" class="btn type b fill xl">Complete</a>
					</div>
				</div>
			</section>
		</main>
	</div>


	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>

	$(document).ready(function(){
		$('.fit a').click(function() {
			
			var title = $('.subj .input').val();
			var content = $('.memo .textarea').val();
			
			if(title.length != 0 && content != 0) {
				 fp.util.jsonAjax({
					url : '/app/setting/qna.do',
					data : {
	                    title : $.trim(title),
	                    content : $.trim(content)
	                },
	                success : function(data) {
	                	if(data === "success") {
	                		 console.log('success');
	                         history.back();
	                	}
	                },
	                error : function(x, s, e) {
	                    console.log(x);
	                }
				});
			} else {
				alert('값 입력해 주세요!')
			} 
            
            return false;
		});
	});

	</script>
</div>