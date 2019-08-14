<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<c:forEach var="item" items="${styleList}">
						<li>
							<label>
								<input type="checkbox" value='<c:out value="${item.idkey}"/>'>
								<span class="tit"><c:out value="${item.style}"/></span>
							</label>
						</li>
					</c:forEach>
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
						<a href="./step3.do" class="btn xl b fill btnNext">NEXT</a>
					</div>
				</div>
			</div>

		</main>
	</div>
	
	<!-- 레이어팝업 자리 -->
	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
	
	$(function() {
		
		$('.style input[type=checkbox]').click(function(e) {
			if($('.style input[type=checkbox]:checked').length > 4) {
				e.preventDefault();
				alert('최대 4개 가능');
			}
		});
		
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
				url : './step3.do',
				fragment : '#wrap',
				container : '#wrap'
			});
			
			return false;
		});
	});
	
	</script>
	
	<!--// 컨텐츠 끝 -->
	
</div>