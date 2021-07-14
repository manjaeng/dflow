<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link href="/resources/app/assets/css/material-dashboard.css" rel="stylesheet" />

<div class="wrapper ">
	<%@ include file="/WEB-INF/views/app/common/sellerSidebar.jsp" %>
	<div class="main-panel">
		<!-- Navbar -->
		<%@ include file="/WEB-INF/views/app/common/sellerNav.jsp" %>
		<!-- End Navbar -->
		<div class="content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-primary">
								<h4 class="card-title">개인정보 수정</h4>
								<p class="card-category">개인정보를 수정하실 수 있습니다.</p>
							</div>
							<div class="card-body">
								<form>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">로그인ID (disabled)</label>
												<input type="text" class="form-control" value="<c:out value="${user.userId}"/>" disabled>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="dropdown" id="sellerType">
													<input type="hidden" name="userType" value="02"
														   id="hiddenSellerType">
													<a class="btn btn-secondary dropdown-toggle" href=""
													   id="addrDropdownSellerType" data-toggle="dropdown">
														<i class="material-icons">supervisor_account</i>
														사용자 유형을 선택하세요.
													</a>
													<ul class="dropdown-menu" aria-labelledby="addrDropdownSellerType">
														<li><a class="dropdown-item seller-type"
															   data_value="01">일반회원</a></li>
														<li><a class="dropdown-item seller-type"
															   data_value="02">셀러회원</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="bmd-label-floating">Email</label>
												<input type="email" class="form-control" value="<c:out value="${user.email}"/>" name="email">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">Name</label>
												<input type="text" class="form-control">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">전화번호</label>
												<input type="text" class="form-control" value="<c:out value="${user.mobile}"/>" name="mobile">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="bmd-label-floating">주소</label>
												<input type="text" class="form-control" value="<c:out value="${companyUser.fullAddr}"/>" name="fullAddr">
											</div>
										</div>
									</div>

									<button type="submit" class="btn btn-primary pull-right">개인정보 수정 </button>
									<div class="clearfix"></div>
								</form>
							</div>
						</div>
					</div>

				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header card-header-primary">
								<h4 class="card-title">업체정보 수정</h4>
								<p class="card-category">업체정보를 수정하실 수 있습니다.</p>
							</div>
							<div class="card-body">
								<form>
									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label class="bmd-label-floating">회사명 (disabled)</label>
												<input type="text" class="form-control" value="<c:out value="${companyUser.company}"/>" name="company"disabled>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="bmd-label-floating">사업자등록번호</label>
												<input type="text" class="form-control"value="<c:out value="${user.bizNo}"/>" name="bizNo">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">회사전화번호</label>
												<input type="text" class="form-control" value="<c:out value="${user.comPhone}"/>" name="comPhone">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">거래은행</label>
												<input type="text" class="form-control" value="<c:out value="${user.email}"/>" name="email">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="bmd-label-floating">은행계좌번호</label>
												<input type="text" class="form-control" value="<c:out value="${user.bankName}"/>" name="bankName">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label for="select">회사주소</label>
												<select class="select" name="store_name" id="select">
													<option value="">매장위치</option>
													<option value="디오트">디오트</option>
													<option value="청평화">청평화</option>
													<option value="누죤">누죤</option>
													<option value="DDP 패션몰(유어스)">DDP 패션몰(유어스)</option>
													<option value="APM">APM</option>
													<option value="APM 럭스">APM 럭스</option>
													<option value="APM PLACE">APM PLACE</option>
													<option value="디자이너클럽">디자이너클럽</option>
													<option value="퀸즈스퀘어">퀸즈스퀘어</option>
													<option value="팀204">팀204</option>
													<option value="제일평화">제일평화</option>
													<option value="남평화">남평화</option>
													<option value="동평화">동평화</option>
													<option value="신평화">신평화</option>
													<option value="스튜디오W">스튜디오W</option>
													<option value="테크노">테크노</option>
													<option value="DWP">DWP</option>
													<option value="벨포스트">벨포스트</option>
													<option value="해양">해양</option>
													<option value="엘리시움">엘리시움</option>
													<option value="맥스타일">맥스타일</option>
													<option value="etc">기타(직접입력)</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">우편번호</label>
												<input type="text" class="form-control" value="<c:out value="${user.postCode}"/>" name="email">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">기본주소</label>
												<input type="text" class="form-control" value="<c:out value="${user.firstAddr}"/>" name="email">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label class="bmd-label-floating">기타주소</label>
												<input type="text" class="form-control" value="<c:out value="${user.secondAddr}"/>" name="email">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="file">사업자등록증업로드</label>
												<input type="file" id="file" class="form-control-file">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>취급품목</label>
											</div>
										</div>
									</div>
									<div class="row">
										<c:forEach var="item" items="${productType}">
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check">
														<label class="form-check-label">
															<input class="form-check-input" type="checkbox" name="productType"
																   value='<c:out value="${item.code_no}"/>'>
															<span class="form-check-sign">
                                                            <span class="check"></span>
                                                         </span>
															<c:out value="${item.code_nm}"/>
														</label>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>제품스타일</label>
											</div>
										</div>
									</div>
									<div class="row">
										<c:forEach var="item" items="${styleList}">
											<div class="col-md-2">
												<div class="form-group">
													<div class="form-check">
														<label class="form-check-label">
															<input class="form-check-input" type="checkbox" name="styleList"
																   value='<c:out value="${item.code_no}"/>'>
															<span class="form-check-sign">
                                                            <span class="check"></span>
                                                        </span><c:out value="${item.code_nm}"/>
														</label>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
									<button type="submit" class="btn btn-primary pull-right">업체정보수정</button>
									<div class="clearfix"></div>
								</form>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
		<footer class="footer">
			<div class="container-fluid">
				<nav class="float-left">
					<ul>
						<li>
							<a href="">
								Dflow Tim
							</a>
						</li>
						<li>
							<a href="">
								About Us
							</a>
						</li>
						<li>
							<a href="">
								Contect Us
							</a>
						</li>

					</ul>
				</nav>
				<div class="copyright float-right">
					&copy;
					<script>
						document.write(new Date().getFullYear())
					</script>, made with <i class="material-icons">favorite</i> by
					<a href="" target="_blank">Dflow</a>
				</div>
			</div>
		</footer>
	</div>
</div>

<!--   Core JS Files   -->
<script src="/resources/app/assets/js/core/jquery.min.js"></script>
<script src="/resources/app/assets/js/core/popper.min.js"></script>
<script src="/resources/app/assets/js/core/bootstrap-material-design.min.js"></script>
<script src="/resources/app/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!-- Plugin for the momentJs  -->
<script src="/resources/app/assets/js/plugins/moment.min.js"></script>
<!--  Plugin for Sweet Alert -->
<script src="/resources/app/assets/js/plugins/sweetalert2.js"></script>
<!-- Forms Validations Plugin -->
<script src="/resources/app/assets/js/plugins/jquery.validate.min.js"></script>
<!-- Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="/resources/app/assets/js/plugins/jquery.bootstrap-wizard.js"></script>
<!--	Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="/resources/app/assets/js/plugins/bootstrap-selectpicker.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="/resources/app/assets/js/plugins/bootstrap-datetimepicker.min.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/  -->
<script src="/resources/app/assets/js/plugins/jquery.dataTables.min.js"></script>
<!--	Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="/resources/app/assets/js/plugins/bootstrap-tagsinput.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="/resources/app/assets/js/plugins/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="/resources/app/assets/js/plugins/fullcalendar.min.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="/resources/app/assets/js/plugins/jquery-jvectormap.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/resources/app/assets/js/plugins/nouislider.min.js"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="/resources/app/assets/js/plugins/arrive.min.js"></script>

<!-- Chartist JS -->
<script src="/resources/app/assets/js/plugins/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="/resources/app/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="/resources/app/assets/js/material-dashboard.js?v=2.1.2" type="text/javascript"></script>

<script>
	$(document).ready(function() {
		$().ready(function() {
			$sidebar = $('.sidebar');

			$sidebar_img_container = $sidebar.find('.sidebar-background');

			$full_page = $('.full-page');

			$sidebar_responsive = $('body > .navbar-collapse');

			window_width = $(window).width();

			fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();

			if (window_width > 767 && fixed_plugin_open == 'Dashboard') {
				if ($('.fixed-plugin .dropdown').hasClass('show-dropdown')) {
					$('.fixed-plugin .dropdown').addClass('open');
				}

			}

			$('.fixed-plugin a').click(function(event) {
				// Alex if we click on switch, stop propagation of the event, so the dropdown will not be hide, otherwise we set the  section active
				if ($(this).hasClass('switch-trigger')) {
					if (event.stopPropagation) {
						event.stopPropagation();
					} else if (window.event) {
						window.event.cancelBubble = true;
					}
				}
			});

			$('.fixed-plugin .active-color span').click(function() {
				$full_page_background = $('.full-page-background');

				$(this).siblings().removeClass('active');
				$(this).addClass('active');

				var new_color = $(this).data('color');

				if ($sidebar.length != 0) {
					$sidebar.attr('data-color', new_color);
				}

				if ($full_page.length != 0) {
					$full_page.attr('filter-color', new_color);
				}

				if ($sidebar_responsive.length != 0) {
					$sidebar_responsive.attr('data-color', new_color);
				}
			});

			$('.fixed-plugin .background-color .badge').click(function() {
				$(this).siblings().removeClass('active');
				$(this).addClass('active');

				var new_color = $(this).data('background-color');

				if ($sidebar.length != 0) {
					$sidebar.attr('data-background-color', new_color);
				}
			});

			$('.fixed-plugin .img-holder').click(function() {
				$full_page_background = $('.full-page-background');

				$(this).parent('li').siblings().removeClass('active');
				$(this).parent('li').addClass('active');


				var new_image = $(this).find("img").attr('src');

				if ($sidebar_img_container.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
					$sidebar_img_container.fadeOut('fast', function() {
						$sidebar_img_container.css('background-image', 'url("' + new_image + '")');
						$sidebar_img_container.fadeIn('fast');
					});
				}

				if ($full_page_background.length != 0 && $('.switch-sidebar-image input:checked').length != 0) {
					var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

					$full_page_background.fadeOut('fast', function() {
						$full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
						$full_page_background.fadeIn('fast');
					});
				}

				if ($('.switch-sidebar-image input:checked').length == 0) {
					var new_image = $('.fixed-plugin li.active .img-holder').find("img").attr('src');
					var new_image_full_page = $('.fixed-plugin li.active .img-holder').find('img').data('src');

					$sidebar_img_container.css('background-image', 'url("' + new_image + '")');
					$full_page_background.css('background-image', 'url("' + new_image_full_page + '")');
				}

				if ($sidebar_responsive.length != 0) {
					$sidebar_responsive.css('background-image', 'url("' + new_image + '")');
				}
			});

			$('.switch-sidebar-image input').change(function() {
				$full_page_background = $('.full-page-background');

				$input = $(this);

				if ($input.is(':checked')) {
					if ($sidebar_img_container.length != 0) {
						$sidebar_img_container.fadeIn('fast');
						$sidebar.attr('data-image', '#');
					}

					if ($full_page_background.length != 0) {
						$full_page_background.fadeIn('fast');
						$full_page.attr('data-image', '#');
					}

					background_image = true;
				} else {
					if ($sidebar_img_container.length != 0) {
						$sidebar.removeAttr('data-image');
						$sidebar_img_container.fadeOut('fast');
					}

					if ($full_page_background.length != 0) {
						$full_page.removeAttr('data-image', '#');
						$full_page_background.fadeOut('fast');
					}

					background_image = false;
				}
			});

			$('.switch-sidebar-mini input').change(function() {
				$body = $('body');

				$input = $(this);

				if (md.misc.sidebar_mini_active == true) {
					$('body').removeClass('sidebar-mini');
					md.misc.sidebar_mini_active = false;

					$('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar();

				} else {

					$('.sidebar .sidebar-wrapper, .main-panel').perfectScrollbar('destroy');

					setTimeout(function() {
						$('body').addClass('sidebar-mini');

						md.misc.sidebar_mini_active = true;
					}, 300);
				}

				// we simulate the window Resize so the charts will get updated in realtime.
				var simulateWindowResize = setInterval(function() {
					window.dispatchEvent(new Event('resize'));
				}, 180);

				// we stop the simulation of Window Resize after the animations are completed
				setTimeout(function() {
					clearInterval(simulateWindowResize);
				}, 1000);

			});
		});
	});
</script>