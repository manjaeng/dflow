<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>
	$(function() {

		var $subPages = $('#subPages');

		switch (location.pathname) {
		case '/admin/user/list.do':
			$('.user').addClass('active');
			break;
		case '/admin/notice/list.do':
		case '/admin/notice/modify.do':
		case '/admin/notice/add.do':
			$('.notice').addClass('active');
			break;
		case '/admin/qna/list.do':
		case '/admin/qna/answer.do':
			$('.qna').addClass('active');
			break;
		case '/admin/look/list.do':
			$('.look').addClass('active');
			break;
		case '/admin/setting/list.do':
			$('.setting').addClass('active');
			break;
		case '/admin/setting/hashtag.do':
			$subPages.prev().addClass('active');
			$subPages.addClass('in');
			$('#subPages li a').eq(0).addClass('active');
			break;
		default:
		}
	});
</script>

<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<!-- <li><a href="/main.do" class=""><i class="lnr lnr-home"></i>
						<span>Home</span></a></li> -->

				<li><a href="#subPages" data-toggle="collapse" class="collapsed">
					<i class="lnr lnr-user"></i><span>회원 관리</span>
					<i class="icon-submenu lnr lnr-chevron-right"></i></a>
					<div id="subPages" class="collapse">
						<ul class="nav">
							<li><a href="/admin/user/list.do" class="user">회원 조회</a></li>
							<li><a href="/admin/qna/list.do" class="qna">1:1 문의 관리</a></li>
							<li><a href="/admin/report/list.do" class="report">신고 관리</a></li>
						</ul>
					</div>
				</li>

				<li><a href="#subPages2" data-toggle="collapse" class="collapsed">
					<i class="lnr lnr-alarm"></i><span>고객지원 관리</span>
					<i class="icon-submenu lnr lnr-chevron-right"></i></a>
					<div id="subPages2" class="collapse">
						<ul class="nav">
							<li><a href="/admin/notice/list.do" class="notice">공지사항 관리</a></li>
							<li><a href="/admin/policy/list.do" class="policy">이용가이드 관리</a></li>
						</ul>
					</div>
				</li>
				
				<li><a href="#subPages3" data-toggle="collapse" class="collapsed">
					<i class="lnr lnr-shirt"></i><span>콘텐츠 관리</span>
					<i class="icon-submenu lnr lnr-chevron-right"></i></a>
					<div id="subPages3" class="collapse">
						<ul class="nav">
							<li><a href="/admin/look/list.do" class="look">LOOK 콘텐츠 목록</a></li>
						</ul>
					</div>
				</li>
				
				<li><a href="#subPages4" data-toggle="collapse" class="collapsed">
					<i class="lnr lnr-smile"></i><span>서비스 지원 관리</span>
					<i class="icon-submenu lnr lnr-chevron-right"></i></a>
					<div id="subPages4" class="collapse">
						<ul class="nav">
							<li><a href="/admin/match/list.do" class="match">매칭율 조건 관리</a></li>
							<li><a href="/admin/style/list.do" class="style">스타일 조건 관리</a></li>
							<li><a href="/admin/tag/list.do" class="tag">태그 관리</a></li>
						</ul>
					</div>
				</li>
				
				<li><a href="#subPages5" data-toggle="collapse" class="collapsed">
					<i class="lnr lnr-home"></i><span>관리자 계정 관리</span>
					<i class="icon-submenu lnr lnr-chevron-right"></i></a>
					<div id="subPages5" class="collapse">
						<ul class="nav">
							<li><a href="/admin/admin_user/list.do" class="admin_user">관리자 계정 조회</a></li>
						</ul>
					</div>
				</li>
						
				<li><a href="/admin/setting/list.do" class="setting"><i
						class="lnr lnr-cog"></i> <span>Setting</span></a></li>

			</ul>
		</nav>
	</div>
</div>