<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<%@ include file="/WEB-INF/views/app/common/mainTop.jsp" %>
	<!-- Top Bar End-->
	<%@ include file="/WEB-INF/views/app/common/mainNavbar.jsp" %>
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
					<div class="product-badge badge badge-secondary">Fresh</div><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">White Tee</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Black blouse</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3">
					<div class="product-badge badge badge-primary">Sale</div><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">College jacket</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0027211800_1_2_1.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0027211800_2_1_1.jpeg" alt="product"/></div></a>
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Carrot-fit jeans</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
					<div class="product-swap-image"><img class="img-fluid product-swap-image-front" src="/resources/app/images/main/product/0144074800_1_1_1.jpeg" alt="product"/><img class="img-fluid" src="/resources/app/images/main/product/0144074800_2_1_1.jpeg" alt="product"/></div></a>
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Striped T-Shirt</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Short top</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3">
					<div class="product-badge badge badge-dark">Sold out</div><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Ethnic Sweater</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Beige</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Skull Tee</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Trucker jacket</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Blouse</a></h3><span class="text-gray-500 text-sm">$40.00</span>
					<div class="product-stars text-xs"><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-primary"></i><i class="fa fa-star text-muted"></i><i class="fa fa-star text-muted"></i></div>
				</div>
			</div>
		</div>
		<!-- /product   -->
		<!-- product-->
		<div class="col-xl-2 col-lg-3 col-md-4 col-6">
			<div class="product" data-aos="zoom-in" data-aos-delay="0">
				<div class="product-image mb-md-3"><a href="/app/sales/detailModel.do">
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
					<h3 class="text-base mb-1"><a class="text-dark" href="/app/sales/detailModel.do">Shirt</a></h3><span class="text-gray-500 text-sm">$40.00</span>
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
<%@ include file="/WEB-INF/views/app/common/mainCart.jsp" %>
<!-- Sidebar Modal Right-->
<%@ include file="/WEB-INF/views/app/common/mainSidebar.jsp" %>
<!-- Login Modal    -->
<%@ include file="/WEB-INF/views/app/common/mainLogin.jsp" %>
<!-- Footer-->
<%@ include file="/WEB-INF/views/app/common/mainFooter.jsp" %>
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