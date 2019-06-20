<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script>
	$(function() {

		switch (location.pathname) {
		case '/main.do':
		case '/store/list.do':
		case '/store/modify.do':
		case '/store/add.do':
			$('.store').addClass('active');
			break;
		
		case '/notice/list.do':
		case '/notice/modify.do':
		case '/notice/add.do':
			$('.notice').addClass('active');
			break;

		case '/user/list.do':
			$('.user').addClass('active');
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
				<li><a href="/store/list.do" 
					class="store"><i class="lnr lnr-cart"></i> <span>Store</span></a></li>
				<li><a href="/notice/list.do"
					class="notice"><i class="lnr lnr-alarm"></i> <span>Notice</span></a>
				</li>

				<li><a href="/admin/userList.do" class="user"><i
						class="lnr lnr-user"></i> <span>User</span></a></li>
			</ul>
		</nav>
	</div>
</div>