<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain ver">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
				</div>
				<h1 class="tit">앱 버전정보</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			
			<div class="sec vinfo">
				<div class="logo">FAPEE</div>
				<div class="vers">
					<div class="ver now">
						<div class="tt">현재버전</div>
						<div class="vv">1.02</div>
					</div>
					<div class="ver new">
						<div class="tt">최신버전</div>
						<div class="vv">1.03</div>
					</div>
				</div>
			</div>
			
			
			<section class="botFixed">
				<div class="in">
					<div class="btnSet fit">
						<a href="javascript:;" class="btn type b fill xl">UPDATE</a>
					</div>
				</div>
			</section>

		</main>
	</div>

	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
		$(function() {
			$('.fit a').click(function() {
				return false;
			});
		});
	</script>
</div>