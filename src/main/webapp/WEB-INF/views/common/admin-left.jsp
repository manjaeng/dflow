<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>
	$(function() {

		var $subPages = $('#subPages');

		switch (location.pathname) {
		case '/main.do':
			break;
		case '/notice/list.do':
		case '/notice/modify.do':
		case '/notice/add.do':
			$('.notice').addClass('active');
			break;
		case '/user/list.do':
			$('.user').addClass('active');
			break;
		case '/admin/setting/hashtag.do':
			$subPages.prev().addClass('active');
			$subPages.addClass('in');
			$('#subPages li a').eq(0).addClass('active');
			break;
		case '/admin/setting/style.do':
			$subPages.prev().addClass('active');
			$subPages.addClass('in');
			$('#subPages li a').eq(1).addClass('active');
			break;
		default:
		}
	});
</script>

<div id="sidebar-nav" class="sidebar">
	<div class="sidebar-scroll">
		<nav>
			<ul class="nav">
				<li><a href="/main.do" class=""><i class="lnr lnr-home"></i>
						<span>Home</span></a></li>
				<li><a href="/notice/list.do" class="notice"><i
						class="lnr lnr-alarm"></i> <span>Notice</span></a></li>
				<li><a href="/user/list.do" class="user"><i
						class="lnr lnr-user"></i> <span>User</span></a></li>
				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed"><i class="lnr lnr-cog"></i> <span>Setting</span>
						<i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse">
						<ul class="nav">
							<li><a href="/" class="">HashTag</a></li>
							<li><a href="/" class="">Style</a></li>
						</ul>
					</div></li>
			</ul>
		</nav>
	</div>
</div>