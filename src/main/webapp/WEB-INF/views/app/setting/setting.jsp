<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="wrap" id="wrap">
	<div id="contain" class="contain setting">
		<div class="pageHd">
			<div class="in">
				<div class="bts">
					<a href="javascript:history.back();" class="bt hisback">뒤로</a>
					<!-- <a href="javascript:history.back();" class="bt close">닫기</a> -->
				</div>
				<h1 class="tit">SETTING</h1>
			</div>
		</div>
		<main id="contents" class="contents">
			<section class="sec mysets">
				<ul class="list">
					<li>
						<span class="bt">계정관리</span>
						<ul>
							<li><a class="bt" href="../setting/password_change.do">비밀번호 변경</a></li>
							<li><a class="bt" href="/app/setting/my_review.do">쇼핑내역</a></li>
							<li><a class="bt" href="/app/look/review.do?lookIdKey=2&productIdKey=PRD1910090000000001">리뷰목록(/app/look/review.do?lookIdKey=2&productIdKey=PRD1910090000000001)</a></li>
						</ul>
					</li>
					<li>
						<a class="bt" href="../setting/setting_alim.jsp">알림설정</a>
					<li>
						<span class="bt">고객지원</span>
						<ul>
							<li><a class="bt" href="../setting/qna.do">1:1 문의</a></li>
							<li><a class="bt" href="../setting/notice.do">공지사항</a></li>
						</ul>
					</li>
					<li>
						<span class="bt">이용가이드</span>
						<ul>
							<li><a class="bt" href="../setting/policy1.jsp">이용약관</a></li>
							<li><a class="bt" href="../setting/policy2.jsp">개인정보취급방침</a></li>
						</ul>
					</li>
					<li>
						<span class="bt">업데이트</span>
						<ul>
							<li><a class="bt" href="../setting/app_version.do">앱버전정보 <em class="ver"><c:out value="${currentAppVersion}"/></em></a></li>
						</ul>
					</li>
					<li>
						<a class="bt" href="javascript:;">셀러 계정 신청</a>
					</li>
					<li>
						<a class="bt" id="logout" href="javascript:;">로그아웃</a>
					</li>
				</ul>
			</section>
		</main>
	</div>


	<div class="popLayerArea">
		<%@ include file="/WEB-INF/views/common/app-layers.jsp" %>
	</div>

	<script>
		$(function() {
			$('#logout').click(function() {
				$.ajax({
					url : '/app/user/logout.do',
					type: 'get',
					success : function() {
						pjax('/app/home/home.do');
					}
				});
				return false;
			});			
		});
	</script>
	
</div>