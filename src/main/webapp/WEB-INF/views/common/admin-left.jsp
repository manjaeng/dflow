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

				<li><a href="/admin/user/list.do" class="user"><i
						class="lnr lnr-user"></i> <span>User</span></a></li>

				<li><a href="/admin/notice/list.do" class="notice"><i
						class="lnr lnr-alarm"></i> <span>Notice</span></a></li>

				<li><a href="/admin/look/list.do" class="look"><i
						class="lnr lnr-shirt"></i> <span>Look</span></a></li>
						
				<li><a href="/admin/setting/list.do" class="setting"><i
						class="lnr lnr-cog"></i> <span>Setting</span></a></li>

				<li><a href="#subPages" data-toggle="collapse"
					class="collapsed"><i class="lnr lnr-printer"></i> <span>Excel Importor</span>
						<i class="icon-submenu lnr lnr-chevron-left"></i></a>
					<div id="subPages" class="collapse">
						<ul class="nav">
							<li><a href="/importor/look.do" class="">Look</a></li>
						</ul>
					</div></li>
			</ul>
		</nav>
	</div>
</div>