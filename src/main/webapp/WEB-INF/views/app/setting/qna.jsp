<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	
	<!-- 컨텐츠 시작 -->
	<div id="contain" class="contain qna">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">1:1문의</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec forms">
				<ul class="form">
					<!-- <li class="cate">
						<div class="dt">
							<select class="select">
								<option>회원정보 문의</option>
								<option>회원제도 문의</option>
								<option>시스템 문의</option>
								<option>기타 문의</option>
							</select>
						</div>
					</li> -->
					<li class="subj">
						<div class="dt">
							<input type="text" class="input" placeholder="TITLE">
						</div>
					</li>
					<li class="memo">
						<div class="dt">
							<textarea class="textarea" placeholder="CONTENTS"></textarea>
						</div>
					</li>
				</ul>
			</div>
			
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="#" class="btn type b fill xl">Complete</a>
					</div>
				</div>
			</section>

		</main>
	</div>


	<div class="popLayerArea">
		<!-- 레이어팝업 자리 -->
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
	                    userIdKey : '1',
	                    title : $.trim(title),
	                    content : $.trim(content).replace(/(?:\r\n|\r|\n)/g, '<br>')
	                },
	                success : function(data) {
	                	if(data === "success") {
	                		 alert(data);
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
	
	<!--// 컨텐츠 끝 -->
	

	
</div>