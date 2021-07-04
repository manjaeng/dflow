﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/app/intro/includeSvg.jsp" %>
<!-- Custom font-->
<link rel="stylesheet" href="/resources/app/css/main/fonts/stylesheet.css">
<!-- Swiper-->
<link rel="stylesheet" href="/resources/app/css/main/swiper/css/swiper.min.css">
<!-- AOS - AnimationOnScroll-->
<link rel="stylesheet" href="/resources/app/css/main/aos/aos.css">
<!-- Custom Scrollbar-->
<link rel="stylesheet" href="/resources/app/css/main/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
<!-- Theme stylesheet-->
<link rel="stylesheet" href="/resources/app/css/main/style.default.bc0dbdbe.css" id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/app/css/main/custom.0a822280.css">
<!-- Favicon-->
<link rel="shortcut icon" href="/resources/app/css/main/img/favicon.png">
<!-- FontAwesome-->
<link rel="stylesheet" href="/resources/app/css/main/all.css">
<!-- Tweaks for older IEs--><!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
<!-- navbar-->
<header class="header header-absolute">
	<!-- Top Bar-->
	<div class="top-bar text-sm bg-transparent">
		<div class="container-fluid px-lg-5 py-3">
			<div class="row align-items-center">
				<div class="col-md-4 d-none d-md-block">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-2"><a class="text-reset text-hover-primary" href="#"><i class="fab fa-facebook-f"> </i></a></li>
						<li class="list-inline-item mr-4"><a class="text-reset text-hover-primary" href="#"><i class="fab fa-twitter"> </i></a></li>
						<li class="list-inline-item mr-2">
							<svg class="svg-icon mr-2">
								<use xlink:href="#calls-1"> </use>
							</svg>010-8493-8492
						</li>
					</ul>
				</div>
				<div class="col-sm-6 col-md-4 text-left text-md-center">
					<p class="mb-0">DFlow in-store delivery</p>
				</div>
				<div class="col-sm-6 col-md-4 d-none d-sm-flex justify-content-end">
					<!-- Language Dropdown-->
					<div class="dropdown border-right px-3"><a class="dropdown-toggle topbar-link" id="langsDropdown" href="#" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">Koriean</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="langsDropdown"><a class="dropdown-item" href="#">English</a><a class="dropdown-item" href="#">Japan</a></div>
					</div>
					<!-- Currency Dropdown-->
					<div class="dropdown pl-3 ml-0"><a class="dropdown-toggle topbar-link" id="currencyDropdown" href="#" data-toggle="dropdown" data-display="static" aria-haspopup="true" aria-expanded="false">₩</a>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="currencyDropdown"><a class="dropdown-item" href="#">USD</a><a class="dropdown-item" href="#">¥</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Top Bar End-->
	<nav class="navbar navbar-expand-lg bg-transparent border-0 shadow-0 navbar-light px-lg-5 "><a class="navbar-brand" href="index.html">DFlow</a>
		<ul class="list-inline mb-0 d-block d-lg-none">
			<li class="list-inline-item mr-3"><a class="text-dark text-hover-primary" href="#" data-toggle="modal" data-target="#loginModal">
				<svg class="svg-icon navbar-icon">
					<use xlink:href="#avatar-1"> </use>
				</svg></a></li>
			<li class="list-inline-item mr-3"><a class="text-dark text-hover-primary position-relative" href="wishlist.html">
				<svg class="svg-icon navbar-icon">
					<use xlink:href="#heart-1"> </use>
				</svg>
				<div class="navbar-icon-badge">3</div></a></li>
			<li class="list-inline-item position-relative mr-3"><a class="text-dark text-hover-primary" href="#" data-toggle="modal" data-target="#sidebarCart">
				<svg class="svg-icon navbar-icon">
					<use xlink:href="#retail-bag-1"> </use>
				</svg>
				<div class="navbar-icon-badge">5</div></a></li>
		</ul>
		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
			<svg class="svg-icon navbar-icon">
				<use xlink:href="#menu-hamburger-1"> </use>
			</svg>
		</button>
		<div class="collapse navbar-collapse" id="navbarContent">
			<ul class="navbar-nav mt-3 mt-lg-0">
				<li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" id="homeDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</a>
					<div class="dropdown-menu" aria-labelledby="homeDropdown"><a class="dropdown-item" href="index.html">Home 1 - Fashion </a><a class="dropdown-item" href="index-2.html">Home 2 - Fashion </a><a class="dropdown-item" href="index-3.html">Home 3 - Design <span class="badge badge-primary-light ml-1">New</span> </a><a class="dropdown-item" href="index-4.html">Home 4 - Design <span class="badge badge-primary-light ml-1">New</span> </a>
					</div>
				</li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="shopDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Shop</a>
					<div class="dropdown-menu py-0" aria-labelledby="shopDropdown" data-min-width="750px" data-translate-x="-50px">
						<div class="row">
							<div class="col-lg-4 col-sm-6 p-lg-5">
								<h6 class="dropdown-header h6 pl-lg-0">Shop pages</h6><a class="dropdown-item pl-lg-0" href="category-full.html">Full width </a><a class="dropdown-item pl-lg-0" href="category-full-sidebar.html">Full width with category menu </a><a class="dropdown-item pl-lg-0" href="category-big-products.html">Full width with big products </a><a class="dropdown-item pl-lg-0" href="category-boxed.html">Fixed width </a><a class="dropdown-item pl-lg-0" href="category-sidebar.html">Fixed width & sidebar </a><a class="dropdown-item pl-lg-0" href="category-masonry.html">Fixed width & masonry layout<span class="badge badge-primary-light ml-1">New</span> </a><a class="dropdown-item pl-lg-0" href="category-categories.html">Subcategories </a>
							</div>
							<div class="col-lg-4 col-sm-6 p-lg-5">
								<h6 class="dropdown-header h6 pl-lg-0">Product pages</h6><a class="dropdown-item pl-lg-0" href="detail-1.html">Product with sticky info </a><a class="dropdown-item pl-lg-0" href="detail-2.html">Product with background </a><a class="dropdown-item pl-lg-0" href="detail-3.html">Product standard  </a>
							</div>
							<div class="col-lg-4 d-none d-lg-block"><img class="bg-image" src="/resources/app/images/main/product/kyle-loftus-596319-unsplash-cropped.jpg" alt=""></div>
						</div>
					</div>
				</li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="iconsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Icons</a>
					<div class="dropdown-menu py-lg-0" aria-labelledby="iconsDropdown" data-min-width="750px">
						<div class="row py-lg-5 px-4">
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-5"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#trousers-1"> </use>
								</svg>
								<h6>Trousers</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-5"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#suit-1"> </use>
								</svg>
								<h6>Jackets</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-5"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#shirt5-1"> </use>
								</svg>
								<h6>T-Shirts</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-5"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#shirt1-1"> </use>
								</svg>
								<h6>Shirts</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-5"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#pullover-1"> </use>
								</svg>
								<h6>Pullovers</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-5"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#scarf-1"> </use>
								</svg>
								<h6>Scarfs</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-0"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#shorts1-1"> </use>
								</svg>
								<h6>Shorts</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-0"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#underwear1-1"> </use>
								</svg>
								<h6>Underwear</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-0"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#watch-1"> </use>
								</svg>
								<h6>Watches</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-0"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#portfolio-1"> </use>
								</svg>
								<h6>Bags</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-0"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#cap-1"> </use>
								</svg>
								<h6>Caps</h6></a></div>
							<div class="col-6 col-sm-3 col-md-2 text-center mb-2 mb-lg-0"><a class="text-reset" href="category-categories.html">
								<svg class="svg-icon w-3rem h-3rem mb-2 svg-icon-light">
									<use xlink:href="#bowtie-1"> </use>
								</svg>
								<h6>Accessories</h6></a></div>
						</div>
						<div class="p-3 bg-primary text-center text-sm d-none d-lg-block">
							<p class="mb-0">Don't miss our biggest sales this year. Use the code "SUMMER35" at checkout until Jun. 15! </p>
						</div>
					</div>
				</li>
				<!-- Megamenu-->
				<li class="nav-item dropdown position-static"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Pages</a>
					<div class="dropdown-menu megamenu px-4 px-lg-5 py-lg-5" data-translate-x="-50%">
						<div class="row">
							<div class="col-lg-3 col-sm-6"><img class="img-fluid mb-3 d-none d-lg-block" src="/resources/app/images/main/blog/christopher-campbell-28571-unsplash.jpg" alt=""/>
								<!-- Megamenu list-->
								<h6>Homepage</h6>
								<ul class="megamenu-list list-unstyled">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="index.html">Home 1 - Fashion   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="index-2.html">Home 2 - Fashion   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="index-3.html">Home 3 - Design <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="index-4.html">Home 4 - Design <span class="badge badge-primary-light ml-1">New</span>   </a></li>
								</ul>
								<!-- Megamenu list-->
								<h6>Category</h6>
								<ul class="megamenu-list list-unstyled mb-lg-0">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-full.html">Full width   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-full-sidebar.html">Full width with category menu   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-big-products.html">Full width with big products   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-boxed.html">Fixed width   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-sidebar.html">Fixed width & sidebar   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-masonry.html">Fixed width & masonry layout<span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="category-categories.html">Subcategories   </a></li>
								</ul>
							</div>
							<div class="col-lg-3 col-sm-6"><img class="img-fluid mb-3 d-none d-lg-block" src="/resources/app/images/main/blog/ian-dooley-347962-unsplash.jpg" alt=""/>
								<!-- Megamenu list-->
								<h6>Order process</h6>
								<ul class="megamenu-list list-unstyled">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="cart.html">Shopping cart   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="checkout1.html">Checkout - Five steps <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="checkout.html">Checkout - Single-page   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="checkout-confirmed.html">Checkout - confirmed   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="wishlist.html">Wishlist   </a></li>
								</ul>
								<!-- Megamenu list-->
								<h6>Product</h6>
								<ul class="megamenu-list list-unstyled mb-lg-0">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="detail-1.html">Product with sticky info   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="detail-2.html">Product with background   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="detail-3.html">Product standard    </a></li>
								</ul>
							</div>
							<div class="col-lg-3 col-sm-6"><img class="img-fluid mb-3 d-none d-lg-block" src="/resources/app/images/main/blog/ian-dooley-347942-unsplash.jpg" alt=""/>
								<!-- Megamenu list-->
								<h6>Blog</h6>
								<ul class="megamenu-list list-unstyled">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="blog.html">Blog   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="blog-masonry.html">Blog - Masonry   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="post.html">Post   </a></li>
								</ul>
								<!-- Megamenu list-->
								<h6>Pages</h6>
								<ul class="megamenu-list list-unstyled">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="about.html">About - Company <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="about-2.html">About v.2 - Person <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="faq.html">F.A.Q. <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="contact.html">Contact   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="privacy.html">Privacy policy <span class="badge badge-primary-light ml-1">New</span>   </a></li>
								</ul>
							</div>
							<div class="col-lg-3 col-sm-6"><img class="img-fluid mb-3 d-none d-lg-block" src="/resources/app/images/main/blog/photo-1534126511673-b6899657816a.jpg" alt=""/>
								<!-- Megamenu list-->
								<h6>Customer</h6>
								<ul class="megamenu-list list-unstyled mb-lg-0">
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-login.html">Login/sign up<span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-orders.html">Orders <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-order.html">Order detail <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-order-tracking.html">Order tracking <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-addresses.html">Addresses <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-account.html">Profile <span class="badge badge-primary-light ml-1">New</span>   </a></li>
									<li class="megamenu-list-item"><a class="megamenu-list-link" href="customer-wishlist.html">Wishlist <span class="badge badge-primary-light ml-1">New</span>   </a></li>
								</ul>
							</div>
						</div>
					</div>
				</li>
				<!-- /Megamenu end-->
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="docsDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Docs</a>
					<div class="dropdown-menu" aria-labelledby="homeDropdown"><a class="dropdown-item" href="docs/index.html">Introduction </a><a class="dropdown-item" href="docs/directory-structure.html">Directory structure </a><a class="dropdown-item" href="docs/gulp.html">Gulp </a><a class="dropdown-item" href="docs/customizing-css.html">Customizing CSS </a><a class="dropdown-item" href="docs/credits.html">Credits </a><a class="dropdown-item" href="docs/changelog.html">Changelog </a>
						<div class="dropdown-divider"></div><a class="dropdown-item" href="docs/components-bootstrap.html">Bootstrap </a><a class="dropdown-item" href="docs/components-theme.html">Theme </a>
					</div>
				</li>
			</ul>
			<form class="d-lg-flex ml-auto mr-lg-5 mr-xl-6 my-4 my-lg-0" action="#">
				<div class="input-group input-group-underlined">
					<input class="form-control form-control-underlined pl-3" type="text" placeholder="Search" aria-label="Search" aria-describedby="button-search">
					<div class="input-group-append ml-0">
						<button class="btn btn-underlined py-0" id="button-search" type="button">
							<svg class="svg-icon navbar-icon">
								<use xlink:href="#search-1"> </use>
							</svg>
						</button>
					</div>
				</div>
			</form>
			<ul class="list-inline mb-0 d-none d-lg-block">
				<li class="list-inline-item mr-3"><a class="text-dark text-hover-primary" href="#" data-toggle="modal" data-target="#loginModal">
					<svg class="svg-icon navbar-icon">
						<use xlink:href="#avatar-1"> </use>
					</svg></a></li>
				<li class="list-inline-item mr-3"><a class="text-dark text-hover-primary position-relative" href="wishlist.html">
					<svg class="svg-icon navbar-icon">
						<use xlink:href="#heart-1"> </use>
					</svg>
					<div class="navbar-icon-badge">3</div></a></li>
				<li class="list-inline-item position-relative mr-3"><a class="text-dark text-hover-primary" href="#" data-toggle="modal" data-target="#sidebarCart">
					<svg class="svg-icon navbar-icon">
						<use xlink:href="#retail-bag-1"> </use>
					</svg>
					<div class="navbar-icon-badge">5</div></a></li>
				<li class="list-inline-item"><a class="text-dark text-hover-primary" href="#" data-toggle="modal" data-target="#sidebarRight">
					<svg class="svg-icon navbar-icon">
						<use xlink:href="#menu-hamburger-1"> </use>
					</svg></a></li>
			</ul>
		</div>
	</nav>
</header>
<!-- Slider main container-->
<div class="swiper-container home-slider" style="height: 95vh; min-height: 600px;">
	<!-- Additional required wrapper-->
	<div class="swiper-wrapper">
		<!-- Slides-->
		<div class="swiper-slide bg-cover bg-cover-right" style="background-image: url('/resources/app/images/main/photo/home-1-plain.jpeg');">
			<div class="container-fluid px-lg-6 px-xl-7 h-100">
				<div class="row h-100 align-items-center" data-swiper-parallax="-500">
					<div class="col-lg-6">
						<p class="subtitle letter-spacing-3 mb-3 text-dark font-weight-light">Our all-time favourites</p>
						<h2 class="display-1 mb-3" style="line-height: 1">Blouses &amp; Tops</h2>
						<p class="text-muted mb-5">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pit</p><a class="btn btn-dark" href="#">Discover more</a>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-slide bg-cover" style="background-image: url('/resources/app/images/main/photo/home-2-plain.jpeg');">
			<div class="container-fluid px-lg-6 px-xl-7 h-100">
				<div class="row h-100 justify-content-center align-items-center text-center" data-swiper-parallax="-500">
					<div class="col-lg-6">
						<p class="subtitle letter-spacing-3 mb-3 text-dark font-weight-light">Blue &amp; White</p>
						<h2 class="display-1 mb-3" style="line-height: 1">Linen and denim</h2><a class="btn btn-dark" href="#">Start shopping</a>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-slide bg-cover" style="background-image: url('/resources/app/images/main/photo/home-3-plain.jpeg');">
			<div class="container-fluid px-lg-6 px-xl-7 h-100">
				<div class="row h-100 align-items-center" data-swiper-parallax="-500">
					<div class="col-lg-6 offset-lg-6">
						<p class="subtitle letter-spacing-3 mb-3 text-primary font-weight-light mb-4">Sneakers</p>
						<h2 class="display-1 mb-5" style="line-height: 1">For every occassion</h2><a class="btn btn-dark" href="#">Start shopping</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="swiper-pagination"></div>
	<div class="swiper-nav d-none d-lg-block">
		<div class="swiper-button-prev" id="homePrev"></div>
		<div class="swiper-button-next" id="homeNext"></div>
	</div>
</div>
<!-- Categories big-->
<div class="bg-gray-100 position-relative">

</div>
<div class="container-fluid container-fluid-px py-6">
	<div class="row">
		<div class="col-lg-10 col-xl-8 text-center mx-auto">
			<h2 class="display-3 mb-5">New Arrivals</h2>
			<p class="lead text-muted mb-6">One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections</p>
		</div>
	</div>
	<div class="row justify-content-between align-items-center mb-4">
		<div class="col-12 col-sm">
			<ul class="list-inline text-center text-sm-left mb-3 mb-sm-0">
				<li class="list-inline-item"><a class="text-dark" href="#">All Products </a></li>
				<li class="list-inline-item"><a class="text-muted text-hover-dark" href="#">Clothing </a></li>
				<li class="list-inline-item"><a class="text-muted text-hover-dark" href="#">Bags</a></li>
				<li class="list-inline-item"><a class="text-muted text-hover-dark" href="#">Shoes</a></li>
				<li class="list-inline-item"><a class="text-muted text-hover-dark" href="#">Accessories</a></li>
			</ul>
		</div>
		<div class="col-12 col-sm-auto text-center"><a class="btn btn-link px-0" href="#">All products</a></div>
	</div>
	<div class="row">
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3">
					<div class="product-badge badge badge-secondary">Fresh</div><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0987188250_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0987188250_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">White Tee</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0950354513_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0950354513_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Black blouse</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3">
					<div class="product-badge badge badge-primary">Sale</div><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/5161335400_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/5161335400_2_3_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">College jacket</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0027211800_1_2_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0027211800_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Carrot-fit jeans</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0144074800_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0144074800_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Striped T-Shirt</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0693492802_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0693492802_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Short top</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3">
					<div class="product-badge badge badge-dark">Sold out</div><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0364326148_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0364326148_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Ethnic Sweater</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0931168712_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0931168712_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Beige</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/1000962306_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/1000962306_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Skull Tee</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0915494643_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0915494643_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Trucker jacket</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0907168607_1_1_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0907168607_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Blouse</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="detail-1.html">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/5806513505_1_2_1.jpg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/5806513505_2_1_1.jpg" alt="product"/></div></a>
					<div class="product-hover-overlay"><a class="text-dark text-sm" href="#">
						<svg class="svg-icon text-hover-primary svg-icon-heavy d-sm-none">
							<use xlink:href="#retail-bag-1"> </use>
						</svg><span class="d-none d-sm-inline">Add to cart</span></a>
						<div><a class="text-dark text-hover-primary mr-2" href="#">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#heart-1"> </use>
							</svg></a><a class="text-dark text-hover-primary text-decoration-none" href="#" data-toggle="modal" data-target="#quickView">
							<svg class="svg-icon svg-icon-heavy">
								<use xlink:href="#expand-1"> </use>
							</svg></a></div>
					</div>
				</div>
				<div class="position-relative">
					<h3 class="text-base mb-1"><a class="text-dark" href="detail-1.html">Shirt</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
	</div>
	<!-- Quickview Modal    -->
	<div class="modal fade quickview" id="quickView" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<button class="close close-absolute close-rotate" type="button" data-dismiss="modal" aria-label="Close">
					<svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
						<use xlink:href="#close-1"> </use>
					</svg>
				</button>
				<div class="modal-body quickview-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="detail-carousel">
								<div class="product-badge badge badge-primary">Fresh</div>
								<div class="product-badge badge badge-dark">Sale</div>
								<div class="swiper-container quickview-slider" id="quickViewSlider">
									<!-- Additional required wrapper-->
									<div class="swiper-wrapper">
										<!-- Slides-->
										<div class="swiper-slide"><img class="img-fluid" src="/resources/app/images/main/product/detail-1-gray.jpg" alt="Modern Jacket 1"></div>
										<div class="swiper-slide"><img class="img-fluid" src="/resources/app/images/main/product/detail-2-gray.jpg" alt="Modern Jacket 2"></div>
										<div class="swiper-slide"><img class="img-fluid" src="/resources/app/images/main/product/detail-3-gray.jpg" alt="Modern Jacket 3"></div>
										<div class="swiper-slide"><img class="img-fluid" src="/resources/app/images/main/product/detail-4-gray.jpg" alt="Modern Jacket 4"></div>
										<div class="swiper-slide"><img class="img-fluid" src="/resources/app/images/main/product/detail-5-gray.jpg" alt="Modern Jacket 5"></div>
									</div>
								</div>
								<div class="swiper-thumbs" data-swiper="#quickViewSlider">
									<button class="swiper-thumb-item detail-thumb-item mb-3 active"><img class="img-fluid" src="/resources/app/images/main/product/detail-1-gray.jpg" alt="Modern Jacket 0"></button>
									<button class="swiper-thumb-item detail-thumb-item mb-3"><img class="img-fluid" src="/resources/app/images/main/product/detail-2-gray.jpg" alt="Modern Jacket 1"></button>
									<button class="swiper-thumb-item detail-thumb-item mb-3"><img class="img-fluid" src="/resources/app/images/main/product/detail-3-gray.jpg" alt="Modern Jacket 2"></button>
									<button class="swiper-thumb-item detail-thumb-item mb-3"><img class="img-fluid" src="/resources/app/images/main/product/detail-4-gray.jpg" alt="Modern Jacket 3"></button>
									<button class="swiper-thumb-item detail-thumb-item mb-3"><img class="img-fluid" src="/resources/app/images/main/product/detail-5-gray.jpg" alt="Modern Jacket 4"></button>
								</div>
							</div>
						</div>
						<div class="col-lg-6 p-lg-5">
							<h2 class="mb-4 mt-4 mt-lg-1">Push-up Jeans</h2>
							<div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-sm-between mb-4">
								<ul class="list-inline mb-2 mb-sm-0">
									<li class="list-inline-item h4 font-weight-light mb-0">$65.00</li>
									<li class="list-inline-item text-muted font-weight-light">
										<del>$90.00</del>
									</li>
								</ul>
								<div class="d-flex align-items-center text-sm">
									<ul class="list-inline mr-2 mb-0">
										<li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
										<li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
										<li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
										<li class="list-inline-item mr-0"><i class="fa fa-star text-primary"></i></li>
										<li class="list-inline-item mr-0"><i class="fa fa-star text-gray-300"></i></li>
									</ul><span class="text-muted text-uppercase">25 reviews</span>
								</div>
							</div>
							<p class="mb-4 text-muted">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>
							<form id="buyForm_modal" action="#">
								<div class="row">
									<div class="col-sm-6 col-lg-12 detail-option mb-4">
										<h6 class="detail-option-heading">Size <span>(required)</span></h6>
										<select class="selectpicker" name="size" data-style="btn-selectpicker">
											<option value="value_0">Small</option>
											<option value="value_1">Medium</option>
											<option value="value_2">Large</option>
										</select>
									</div>
									<div class="col-sm-6 col-lg-12 detail-option mb-5">
										<h6 class="detail-option-heading">Type <span>(required)</span></h6>
										<label class="btn btn-sm btn-outline-primary detail-option-btn-label" for="material_0_modal"> Hoodie
											<input class="input-invisible" type="radio" name="material" value="value_0" id="material_0_modal" required>
										</label>
										<label class="btn btn-sm btn-outline-primary detail-option-btn-label" for="material_1_modal"> College
											<input class="input-invisible" type="radio" name="material" value="value_1" id="material_1_modal" required>
										</label>
									</div>
								</div>
								<div class="input-group w-100 mb-4">
									<input class="form-control form-control-lg detail-quantity" name="items" type="number" value="1">
									<div class="input-group-append flex-grow-1">
										<button class="btn btn-dark btn-block" type="submit"> <i class="fa fa-shopping-cart mr-2"></i>Add to Cart</button>
									</div>
								</div>
								<div class="row mb-4">
									<div class="col-6"><a href="#"> <i class="far fa-heart mr-2"></i>Add to wishlist </a></div>
									<div class="col-6 text-right">
										<ul class="list-inline mb-0">
											<li class="list-inline-item mr-2"><a class="text-dark text-hover-primary" href="#"><i class="fab fa-facebook-f"> </i></a></li>
											<li class="list-inline-item"><a class="text-dark text-hover-primary" href="#"><i class="fab fa-twitter"> </i></a></li>
										</ul>
									</div>
								</div>
								<ul class="list-unstyled">
									<li><strong>Category:</strong> <a class="text-muted" href="#">Jeans</a></li>
									<li><strong>Tags:</strong> <a class="text-muted" href="#">Leisure</a>, <a class="text-muted" href="#">Elegant</a></li>
								</ul>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Sidebar Cart Modal-->
<div class="modal fade modal-right" id="sidebarCart" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content sidebar-cart-content">
			<div class="modal-header border-0">
				<button class="close modal-close close-rotate" type="button" data-dismiss="modal" aria-label="Close">
					<svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
						<use xlink:href="#close-1"> </use>
					</svg>
				</button>
			</div>
			<div class="modal-body px-5 sidebar-cart-body">
				<!-- Empty cart snippet-->
				<!-- In case of empty cart - display this snippet + remove .d-none-->
				<div class="d-none text-center mb-5">
					<svg class="svg-icon w-3rem h-3rem svg-icon-light mb-4 text-muted">
						<use xlink:href="#retail-bag-1"> </use>
					</svg>
					<p>Your cart is empty </p>
				</div>
				<!-- Empty cart snippet end-->
				<div class="sidebar-cart-product-wrapper custom-scrollbar">
					<!-- cart item-->
					<div class="navbar-cart-product">
						<div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-ian-dooley-347968-unsplash.jpg" alt="..."/></a>
							<div class="w-100"><a class="close" href="#">
								<svg class="svg-icon sidebar-cart-icon">
									<use xlink:href="#close-1"> </use>
								</svg></a>
								<div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Skull Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
							</div>
						</div>
					</div>
					<!-- cart item-->
					<div class="navbar-cart-product">
						<div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-kyle-loftus-596319-unsplash.jpg" alt="..."/></a>
							<div class="w-100"><a class="close" href="#">
								<svg class="svg-icon sidebar-cart-icon">
									<use xlink:href="#close-1"> </use>
								</svg></a>
								<div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Transparent Blouse</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
							</div>
						</div>
					</div>
					<!-- cart item-->
					<div class="navbar-cart-product">
						<div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-serrah-galos-494312-unsplash.jpg" alt="..."/></a>
							<div class="w-100"><a class="close" href="#">
								<svg class="svg-icon sidebar-cart-icon">
									<use xlink:href="#close-1"> </use>
								</svg></a>
								<div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">White Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
							</div>
						</div>
					</div>
					<!-- cart item-->
					<div class="navbar-cart-product">
						<div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-ian-dooley-347968-unsplash.jpg" alt="..."/></a>
							<div class="w-100"><a class="close" href="#">
								<svg class="svg-icon sidebar-cart-icon">
									<use xlink:href="#close-1"> </use>
								</svg></a>
								<div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Skull Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
							</div>
						</div>
					</div>
					<!-- cart item-->
					<div class="navbar-cart-product">
						<div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-kyle-loftus-596319-unsplash.jpg" alt="..."/></a>
							<div class="w-100"><a class="close" href="#">
								<svg class="svg-icon sidebar-cart-icon">
									<use xlink:href="#close-1"> </use>
								</svg></a>
								<div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">Transparent Blouse</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
							</div>
						</div>
					</div>
					<!-- cart item-->
					<div class="navbar-cart-product">
						<div class="d-flex align-items-center"><a href="detail-1.html"><img class="img-fluid navbar-cart-product-image" src="/resources/app/images/main/product/product-square-serrah-galos-494312-unsplash.jpg" alt="..."/></a>
							<div class="w-100"><a class="close" href="#">
								<svg class="svg-icon sidebar-cart-icon">
									<use xlink:href="#close-1"> </use>
								</svg></a>
								<div class="pl-3"> <a class="navbar-cart-product-link text-dark link-animated" href="detail-1.html">White Tee</a><small class="d-block text-muted">Quantity: 1 </small><strong class="d-block text-sm">$75.00     </strong></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer sidebar-cart-footer shadow">
				<div class="w-100">
					<h5 class="mb-4">Subtotal: <span class="float-right">$465.32</span></h5><a class="btn btn-outline-dark btn-block mb-3" href="cart.html">View cart</a><a class="btn btn-dark btn-block" href="checkout.html">Checkout</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Sidebar Modal Right-->
<div class="modal fade modal-right" id="sidebarRight" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header border-0">
				<button class="close close-rotate" type="button" data-dismiss="modal" aria-label="Close">
					<svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
						<use xlink:href="#close-1"> </use>
					</svg>
				</button>
			</div>
			<div class="modal-body px-5 pb-5">
				<div>
					<h5 class="mb-5" data-aos="zoom-in" data-aos-delay="50">DFlow</h5>
					<ul class="nav flex-column mb-5">
						<li class="nav-item active"><a class="nav-link pl-0" href="#">Home </a></li>
						<li class="nav-item"><a class="nav-link pl-0" href="#">Link</a></li>
						<li class="nav-item"><a class="nav-link pl-0 disabled" href="#">Disabled</a></li>
						<li class="nav-item dropdown"><a class="nav-link pl-0 dropdown-toggle" id="navbarDropdownMenuLink" href="#" data-target="#sidebarSubmenu" data-toggle="collapse" aria-haspopup="true" aria-expanded="false">Dropdown link</a>
							<div class="collapse" id="sidebarSubmenu">
								<ul class="nav flex-column ml-3">
									<li class="nav-item"><a class="nav-link pl-0" href="#">Action</a></li>
									<li class="nav-item"><a class="nav-link pl-0" href="#">Another action</a></li>
									<li class="nav-item"><a class="nav-link pl-0" href="#">Something else here                </a></li>
								</ul>
							</div>
						</li>
					</ul>
					<ul class="list-inline mb-4">
						<li class="list-inline-item mr-2"><i class="fab fa-facebook-f"> </i></li>
						<li class="list-inline-item mr-2"><i class="fab fa-twitter"> </i></li>
						<li class="list-inline-item mr-2">
							<svg class="svg-icon mr-2">
								<use xlink:href="#calls-1"> </use>
							</svg>010-8493-8492
						</li>
					</ul>
					<p class="text-sm text-muted mb-0">Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Login Modal    -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<button class="close close-absolute" type="button" data-dismiss="modal" aria-label="Close">
				<svg class="svg-icon w-3rem h-3rem svg-icon-light align-middle">
					<use xlink:href="#close-1"> </use>
				</svg>
			</button>
			<div class="modal-body p-5">
				<ul class="nav list-inline" role="tablist">
					<li class="list-inline-item"><a class="nav-link nav-link-lg active" data-toggle="tab" href="#loginModalTabLogin" role="tab" id="loginModalLinkLogin" aria-controls="loginModalTabLogin" aria-selected="true">Login</a></li>
					<li class="list-inline-item"><a class="nav-link nav-link-lg" data-toggle="tab" href="#loginModalTabRegister" role="tab" id="loginModalLinkRegister" aria-controls="loginModalTabRegister" aria-selected="false">Register</a></li>
				</ul>
				<hr class="mb-3">
				<div class="tab-content">
					<div class="tab-pane active fade show px-3" id="loginModalTabLogin" role="tabpanel" aria-labelledby="loginModalLinkLogin">
						<form action="https://demo.bootstrapious.com/DFlow/1-2-1/customer-orders.html" method="get">
							<div class="form-group">
								<label class="form-label" for="email">Email</label>
								<input class="form-control" id="email" type="text">
							</div>
							<div class="form-group">
								<div class="row">
									<div class="col">
										<label class="form-label" for="loginPassword"> Password</label>
									</div>
									<div class="col-auto"><a class="form-text small" href="#">Forgot password?</a></div>
								</div>
								<input class="form-control" name="loginPassword" id="loginPassword" placeholder="Password" type="password" required data-msg="Please enter your password">
							</div>
							<div class="form-group">
								<div class="custom-control custom-checkbox">
									<input class="custom-control-input" id="loginRemember" type="checkbox">
									<label class="custom-control-label text-muted" for="loginRemember"> <span class="text-sm">Remember me for 30 days</span></label>
								</div>
							</div>
							<div class="form-group">
								<button class="btn btn-block btn-outline-dark" type="submit"><i class="fa fa-sign-in-alt mr-2"></i> Log in</button>
							</div>
						</form>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR">
						<div class="text-center">
							<button class="btn btn btn-outline-primary letter-spacing-0" data-toggle="tooltip" title="Connect with Facebook"><i class="fa-fw fa-facebook-f fab"></i><span class="sr-only">Connect with Facebook</span></button>
							<button class="btn btn btn-outline-muted letter-spacing-0" data-toggle="tooltip" title="Connect with Google"><i class="fa-fw fa-google fab"></i><span class="sr-only">Connect with Google</span></button>
						</div>
					</div>
					<div class="tab-pane fade px-3" id="loginModalTabRegister" role="tabpanel" aria-labelledby="loginModalLinkRegister">
						<p class="text-muted text-sm">The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pit.                                            </p>
						<form action="https://demo.bootstrapious.com/DFlow/1-2-1/customer-orders.html" method="get">
							<div class="form-group">
								<label class="form-label" for="registerName">Name</label>
								<input class="form-control" id="registerName" type="text">
							</div>
							<div class="form-group">
								<label class="form-label" for="registerEmail">Email</label>
								<input class="form-control" id="registerEmail" type="text">
							</div>
							<div class="form-group">
								<label class="form-label" for="registerPassword">Password</label>
								<input class="form-control" id="registerPassword" type="password">
							</div>
							<div class="form-group text-center">
								<button class="btn btn-block btn-outline-dark" type="submit"><i class="far fa-user mr-2"></i>Register                       </button>
							</div>
						</form>
						<hr class="my-3 hr-text letter-spacing-2" data-content="OR CONNECT WITH">
						<div class="text-center">
							<button class="btn btn btn-outline-primary letter-spacing-0" data-toggle="tooltip" title="Connect with Facebook"><i class="fa-fw fa-facebook-f fab"></i><span class="sr-only">Connect with Facebook</span></button>
							<button class="btn btn btn-outline-muted letter-spacing-0" data-toggle="tooltip" title="Connect with Google"><i class="fa-fw fa-google fab"></i><span class="sr-only">Connect with Google                                      </span></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Footer-->
<footer>
	<!-- Services block-->
	<div class="py-5 py-lg-6 bg-gray-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-6 py-4 service-column">
					<svg class="svg-icon service-icon">
						<use xlink:href="#delivery-time-1"> </use>
					</svg>
					<div class="service-text">
						<h6 class="text-sm mb-1"> shipping &amp; delivery</h6>
						<p class="text-muted font-weight-light text-sm mb-0"> Shipping over $300</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 py-4 service-column">
					<svg class="svg-icon service-icon">
						<use xlink:href="#money-1"> </use>
					</svg>
					<div class="service-text">
						<h6 class="text-sm mb-1">Product guarantee</h6>
						<p class="text-muted font-weight-light text-sm mb-0">Product Guarantee</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 py-4 service-column">
					<svg class="svg-icon service-icon">
						<use xlink:href="#special-price-1"> </use>
					</svg>
					<div class="service-text">
						<h6 class="text-sm mb-1">Best prices</h6>
						<p class="text-muted font-weight-light text-sm mb-0">Always the best prices</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 py-4 service-column">
					<svg class="svg-icon service-icon">
						<use xlink:href="#customer-support-1"> </use>
					</svg>
					<div class="service-text">
						<h6 class="text-sm mb-1">010-8493-8492</h6>
						<p class="text-muted font-weight-light text-sm mb-0">24/7 Available Support</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main block - menus, subscribe form-->
	<div class="py-6 text-muted">
		<div class="container">
			<div class="row">
				<div class="col-lg-5 pr-lg-5 pr-xl-6 mb-5 mb-lg-0">
					<h6 class="text-dark letter-spacing-1 mb-4">Be in touch</h6>
					<p class="text-sm mb-3"> Lorem ipsum dolor sit amet, consectetur adipisicing elit. At itaque temporibus.</p>
					<form action="#" id="newsletter-form">
						<div class="input-group input-group-underlined mb-3">
							<input class="form-control form-control-underlined" type="email" placeholder="Your Email Address" aria-label="Your Email Address">
							<div class="input-group-append ml-0">
								<button class="btn btn-underlined text-gray-700 py-0" type="button">
									<svg class="svg-icon w-2rem h-2rem">
										<use xlink:href="#envelope-1"> </use>
									</svg>
								</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-7">
					<div class="row">
						<div class="col-lg-4"><a class="d-lg-none block-toggler my-3" data-toggle="collapse" href="#footerMenu0" aria-expanded="false" aria-controls="footerMenu0">Shop<span class="block-toggler-icon"></span></a>
							<!-- Footer collapsible menu-->
							<div class="expand-lg collapse" id="footerMenu0">
								<h6 class="text-dark letter-spacing-1 mb-4 d-none d-lg-block">Shop</h6>
								<ul class="list-unstyled text-sm pt-2 pt-lg-0">
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">For Women</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">For Men</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Stores</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Our Blog</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Shop</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-4"><a class="d-lg-none block-toggler my-3" data-toggle="collapse" href="#footerMenu1" aria-expanded="false" aria-controls="footerMenu1">Company<span class="block-toggler-icon"></span></a>
							<!-- Footer collapsible menu-->
							<div class="expand-lg collapse" id="footerMenu1">
								<h6 class="text-dark letter-spacing-1 mb-4 d-none d-lg-block">Company</h6>
								<ul class="list-unstyled text-sm pt-2 pt-lg-0">
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Login</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Register</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Wishlist</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Our Products</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Checkouts</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-4"><a class="d-lg-none block-toggler my-3" data-toggle="collapse" href="#footerMenu2" aria-expanded="false" aria-controls="footerMenu2">Your account<span class="block-toggler-icon"></span></a>
							<!-- Footer collapsible menu-->
							<div class="expand-lg collapse" id="footerMenu2">
								<h6 class="text-dark letter-spacing-1 mb-4 d-none d-lg-block">Your account</h6>
								<ul class="list-unstyled text-sm pt-2 pt-lg-0">
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Login</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Register</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Wishlist</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Our Products</a></li>
									<li class="mb-2"> <a class="text-muted text-hover-dark link-animated" href="#">Checkouts</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Copyright section of the footer-->
	<div class="py-4 font-weight-light text-muted">
		<div class="container">
			<div class="row align-items-center text-sm text-gray-500">
				<div class="col-lg-4 text-center text-lg-left">
					<p class="mb-lg-0">&copy;Dflow .  All rights reserved.</p>
				</div>
				<div class="col-lg-8">
					<ul class="list-inline mb-0 mt-2 mt-md-0 text-center text-lg-right">
						<li class="list-inline-item"> <a class="text-reset" href="#">Terms &amp; Conditions </a></li>
						<li class="list-inline-item"> <a class="text-reset" href="#">Privacy &amp; cookies </a></li>
						<li class="list-inline-item"> <a class="text-reset" href="#">Accessibility </a></li>
						<li class="list-inline-item"> <a class="text-reset" href="#">Dflow Promise </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- /Footer end-->
<!-- JavaScript files-->
<!-- jQuery-->
<script src="/resources/app/css/main/jquery/jquery.min.js"></script>
<!-- Bootstrap Bundle -->
<script src="/resources/app/css/main/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Swiper Carousel                       -->
<script src="/resources/app/css/main/swiper/js/swiper.min.js"></script>
<!-- Bootstrap Select-->
<script src="/resources/app/css/main/bootstrap-select/js/bootstrap-select.min.js"></script>
<!-- AOS - AnimationOnScroll-->
<script src="/resources/app/css/main/aos/aos.js"></script>
<!-- Custom Scrollbar-->
<script src="/resources/app/css/main/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/resources/app/css/main/custom-scrollbar-init.f148089f.js"></script>
<!-- Smooth scroll-->
<script src="/resources/app/css/main/smooth-scroll/smooth-scroll.polyfills.min.js"></script>
<!-- Object Fit Images - Fallback for browsers that don't support object-fit-->
<script src="/resources/app/css/main/object-fit-images/ofi.min.js"></script>
<!-- JavaScript Countdown-->
<script src="/resources/app/css/main/countdown.782bfd78.js"></script>
<script>
	var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
	var countdown = new Countdown('countdown', deadline);

</script>
<!-- Some theme config-->
<script>
	var options = {
		navbarExpandPx: 992
	}

</script>
<!-- Main Theme files-->
<script src="/resources/app/css/main/sliders-init.1db6fb07.js"></script>
<script src="/resources/app/css/main/theme.fe2c17cd.js"></script>
</body>